function reorderedMotionProbeData = reorderProbeMarkers(motionProbeData)
    % Markers ideal position
    probeMarker1 = [30, 52, 0];
    probeMarker2 = [-30, 0, 0];
    probeMarker3 = [0, -40, 0];
    probeMarker4 = [0, -80, 0];
    
    % 计算参考点集合的距离矩阵
    refDistanceMatrix = [norm(probeMarker1-probeMarker1), norm(probeMarker1-probeMarker2), norm(probeMarker1-probeMarker3), norm(probeMarker1-probeMarker4);
                      norm(probeMarker2-probeMarker1), norm(probeMarker2-probeMarker2), norm(probeMarker2-probeMarker3), norm(probeMarker2-probeMarker4);
                      norm(probeMarker3-probeMarker1), norm(probeMarker3-probeMarker2), norm(probeMarker3-probeMarker3), norm(probeMarker3-probeMarker4);
                      norm(probeMarker4-probeMarker1), norm(probeMarker4-probeMarker2), norm(probeMarker4-probeMarker3), norm(probeMarker4-probeMarker4);];

    % 提取初始时刻的标记点位置
    t0ProbePosition = [
        motionProbeData.RigidBodyMarkerProbeMarker1PositionX(1), motionProbeData.RigidBodyMarkerProbeMarker2PositionX(1), motionProbeData.RigidBodyMarkerProbeMarker3PositionX(1), motionProbeData.RigidBodyMarkerProbeMarker4PositionX(1);
        motionProbeData.RigidBodyMarkerProbeMarker1PositionY(1), motionProbeData.RigidBodyMarkerProbeMarker2PositionY(1), motionProbeData.RigidBodyMarkerProbeMarker3PositionY(1), motionProbeData.RigidBodyMarkerProbeMarker4PositionY(1);
        motionProbeData.RigidBodyMarkerProbeMarker1PositionZ(1), motionProbeData.RigidBodyMarkerProbeMarker2PositionZ(1), motionProbeData.RigidBodyMarkerProbeMarker3PositionZ(1), motionProbeData.RigidBodyMarkerProbeMarker4PositionZ(1);
    ];

    % 初始化最小差异和最佳排列
    minDifference = inf;
    bestPermutation = [];

    % 生成所有排列组合
    permutations = perms(1:4); % 对4个标记点进行全排列

    for i = 1:size(permutations, 1)
        % 当前排列的点
        permutedPoints = t0ProbePosition(:, permutations(i, :));

        % 计算当前排列的距离矩阵
        permutedDistanceMatrix = computeDistanceMatrix(permutedPoints);

        % 计算与参考距离矩阵的差异
        difference = computeDifference(refDistanceMatrix, permutedDistanceMatrix);

        % 更新最优结果
        if difference < minDifference
            minDifference = difference;
            bestPermutation = permutations(i, :);
        end
    end

    % 根据最佳排列重排 motionData
    reorderedMotionProbeData = reorderMotionProbeDataByPermutation(motionProbeData, bestPermutation);
end

function distanceMatrix = computeDistanceMatrix(points)
    % 计算点集合的距离矩阵
    numPoints = size(points, 2);
    distanceMatrix = zeros(numPoints, numPoints);
    for i = 1:numPoints
        for j = i+1:numPoints
            distanceMatrix(i, j) = norm(points(:, i) - points(:, j));
        end
    end
end

function difference = computeDifference(matrixA, matrixB)
    % 计算两个距离矩阵的差异
    difference = sum(abs(matrixA(:) - matrixB(:)));
end

function reorderedMotionData = reorderMotionProbeDataByPermutation(motionData, permutation)
    % 根据排列顺序重排 motionData 中的标记点
    reorderedMotionData = motionData;
    for i = 1:4
        reorderedMotionData.(['RigidBodyMarkerProbeMarker' num2str(i) 'PositionX']) = ...
            motionData.(['RigidBodyMarkerProbeMarker' num2str(permutation(i)) 'PositionX']);
        reorderedMotionData.(['RigidBodyMarkerProbeMarker' num2str(i) 'PositionY']) = ...
            motionData.(['RigidBodyMarkerProbeMarker' num2str(permutation(i)) 'PositionY']);
        reorderedMotionData.(['RigidBodyMarkerProbeMarker' num2str(i) 'PositionZ']) = ...
            motionData.(['RigidBodyMarkerProbeMarker' num2str(permutation(i)) 'PositionZ']);
    end
end
