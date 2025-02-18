function smoothedMotionData = smoothMotionData(motionData)
    % Sampling frequency
    fs = 200;

    type = 'gaussian';  % 使用高斯核平滑
    windowSize = round(0.5 * fs);

    % 获取结构体中所有字段名
    fieldNames = fieldnames(motionData);

    % 遍历字段
    for i = 1:numel(fieldNames)
        fieldName = fieldNames{i};

        % 如果是时间或帧索引，直接保留
        if ismember(fieldName, ["Frame", "TypeNameTimeSeconds"])
            smoothedMotionData.(fieldName) = motionData.(fieldName);
        else
            % 进行高斯平滑
            smoothedMotionData.(fieldName) = smoothdata(motionData.(fieldName), type, windowSize);
        end
    end
end
