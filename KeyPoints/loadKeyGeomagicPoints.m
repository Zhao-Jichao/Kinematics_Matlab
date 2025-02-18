function keyGeomagicPoints = loadKeyGeomagicPoints(skullFilename, mandibleFilename)
    % 检查文件是否存在
    if ~isfile(skullFilename)
        error('File not found: %s', skullFilename);
    end
    if ~isfile(mandibleFilename)
        error('File not found: %s', mandibleFilename);
    end

    % Initialize structure to store data by column names
    keyGeomagicPoints = struct();
    
    % 读取文件内容
    skullData    = readtable(skullFilename, 'ReadVariableNames', false);
    mandibleData = readtable(mandibleFilename, 'ReadVariableNames', false);

    keyGeomagicPoints.UpperIncisorX    = skullData{1,2};
    keyGeomagicPoints.UpperIncisorY    = skullData{1,3};
    keyGeomagicPoints.UpperIncisorZ    = skullData{1,4};
    keyGeomagicPoints.UpperLeftFossaX  = skullData{2,2};
    keyGeomagicPoints.UpperLeftFossaY  = skullData{2,3};
    keyGeomagicPoints.UpperLeftFossaZ  = skullData{2,4};
    keyGeomagicPoints.UpperRightFossaX = skullData{3,2};
    keyGeomagicPoints.UpperRightFossaY = skullData{3,3};
    keyGeomagicPoints.UpperRightFossaZ = skullData{3,4};

    keyGeomagicPoints.LowerIncisorX    = mandibleData{1,2};
    keyGeomagicPoints.LowerIncisorY    = mandibleData{1,3};
    keyGeomagicPoints.LowerIncisorZ    = mandibleData{1,4};
    keyGeomagicPoints.LowerLeftCondyleX  = mandibleData{2,2};
    keyGeomagicPoints.LowerLeftCondyleY  = mandibleData{2,3};
    keyGeomagicPoints.LowerLeftCondyleZ  = mandibleData{2,4};
    keyGeomagicPoints.LowerRightCondyleX = mandibleData{3,2};
    keyGeomagicPoints.LowerRightCondyleY = mandibleData{3,3};
    keyGeomagicPoints.LowerRightCondyleZ = mandibleData{3,4};
end
