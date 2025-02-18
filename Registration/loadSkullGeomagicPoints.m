function skullGeomagicPoints = loadSkullGeomagicPoints(filename)
    % 初始化空矩阵，假设 3 行（X, Y, Z），5 列（每个点）
    %skullGeomagicPoints = [];

    % 检查文件是否存在
    if ~isfile(filename)
        error('File not found: %s', filename);
    end

    % 读取文件内容
    data = readtable(filename, 'ReadVariableNames', false);

    % 检查数据行和列是否符合预期
    if size(data, 2) < 4 || size(data, 1) < 5
        error('Invalid file format. Expected at least 4 columns and 5 rows.');
    end

    % 提取并检查有效数据
    try
        % 提取第 2 到第 4 列作为 X, Y, Z 数据
        skullGeomagicPoints = table2array(data(1:5, 2:4));
        skullGeomagicPoints = skullGeomagicPoints';
    catch
        error('Failed to parse data. Please check the file format.');
    end

    % 检查是否有无效数据
    if any(isnan(skullGeomagicPoints), 'all')
        error('Invalid data detected in the file.');
    end
end