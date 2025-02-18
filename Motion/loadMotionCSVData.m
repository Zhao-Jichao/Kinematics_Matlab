function dataStruct = loadMotionCSVData(filename)
    % Open the file
    fid = fopen(filename, 'r');

    % Check if the file was successfully opened
    if fid == -1
        error('Failed to open the file. Please check the file path and permissions.');
    end

    % Data format
    % Type: Rigid Body, Rigid Body Marker
    % Name: Mandible, Mandible:Marker1-6, Glasses, Glasses:Marker1-5

    % Read header lines
    formatVersionLine = fgetl(fid);     % Skip 'Format Version' line
    blankLine = fgetl(fid);             % Skip blank line
    typeLine = fgetl(fid);              % Get 'Type' line
    nameLine = fgetl(fid);              % Get 'Name' line
    IDLine = fgetl(fid);                % Skip 'ID' line
    rotationLine = fgetl(fid);          % Get 'Rotation, Position, Mean Marker Error' line
    frameLine = fgetl(fid);             % Get 'Frame' line

    types = split(typeLine, ',');
    names = split(nameLine, ',');
    rotations = split(rotationLine, ',');
    frames = split(frameLine, ',');

    % Detect whether the data format is read correctly
    if frames(1) ~= "Frame"
        error('Data format wrong, please check it.');
    end

    % Parse header names for data columns
    frames = split(frameLine, ',');

    % Close the file to reset it and read data separately
    fclose(fid);

    % Read numeric data starting from row 8 (where Frame data starts)
    opts = detectImportOptions(filename);
    opts.DataLines = [8 Inf];
    opts.VariableNamingRule = 'preserve'; % Preserve original column headers
    data = readtable(filename, opts);

    % Initialize structure to store data by column names
    dataStruct = struct();

    % Find the smallest indices where the type is 'Marker' 
    markerIndices = find(strcmp(types, 'Marker'), 1);

    % Store each column in the dataStruct
    for i = 1:markerIndices-1
        % Sanitize the header components
        sanitizedFrame = regexprep(frames{i}, '[^a-zA-Z0-9_]', ''); 
        sanitizedType = regexprep(types{i}, '[^a-zA-Z0-9_]', '');
        sanitizedName = regexprep(names{i}, '[^a-zA-Z0-9_]', '');
        sanitizedRotation = regexprep(rotations{i}, '[^a-zA-Z0-9_]', '');
        
        % Combine sanitized components into a header
        sanitizedHeader = strcat(sanitizedType, sanitizedName, sanitizedRotation, sanitizedFrame);
    
        % Get the numeric data column
        numericData = data{:, i};
        
        % Calculate the number of NaN values in the data
        nanIndices = isnan(numericData);
        numNan = sum(nanIndices);
        fprintf('%s: missing %d out of %d data.\r', sanitizedHeader, numNan, length(numericData));

        % Filling NaN values using linear interpolation
        numericalData_filled = fillmissing(numericData, 'linear');

        % Assign the data column to dataStruct with the generated header
        dataStruct.(sanitizedHeader) = numericalData_filled;
    end
end
