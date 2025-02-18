function filteredMotionData = filterMotionData(motionData)
    % Sampling frequency
    fs = 200;

    % Low-pass filtering: use a Butterworth high-pass filter to remove DC off set
    lowpass_cutoff = 10;                                            % Cut-off frequency
    [b_low, a_low] = butter(4, lowpass_cutoff/(fs/2), 'low');       % 4th-order Butterworth
    
    % 获取结构体中所有字段名
    fieldNames = fieldnames(motionData);

    % 遍历字段
    for i = 1:numel(fieldNames)
        fieldName = fieldNames{i};

        % 如果是时间或帧索引，直接保留
        if ismember(fieldName, ["Frame", "TypeNameTimeSeconds"])
            filteredMotionData.(fieldName) = motionData.(fieldName);
        else
            % 进行高斯平滑
            filteredMotionData.(fieldName) = filtfilt(b_low, a_low, motionData.(fieldName));
        end
    end
end
