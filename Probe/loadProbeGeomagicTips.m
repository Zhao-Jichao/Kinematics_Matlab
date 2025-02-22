function probeGeomagicTips = loadProbeGeomagicTips(filename)
    % 检查文件是否存在
    if ~isfile(filename)
        error('File not found: %s', filename);
    end

    % Initialize structure to store data by column names
    probeGeomagicTips = struct();
    
    % 读取文件内容
    probeData    = readtable(filename, 'ReadVariableNames', false);

    probeGeomagicTips.Nasion      = probeData{1,2:4}';
    probeGeomagicTips.Subnasale   = probeData{2,2:4}';
    probeGeomagicTips.LeftTragus  = probeData{3,2:4}';
    probeGeomagicTips.RightTragus = probeData{4,2:4}';
end
