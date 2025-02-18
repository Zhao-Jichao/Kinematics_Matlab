function [rotationMatrix, translationVector, accuracy] = svdRigidMotion(sourcePoints, targetPoints)
    % svdRigidMotion 计算两个点集之间的刚性变换（旋转和平移）
    % 输入:
    %   sourcePoints - 源点集，大小为 3 x N
    %   targetPoints - 目标点集，大小为 3 x N
    % 输出:
    %   rotationMatrix - 旋转矩阵 (3x3)
    %   translationVector - 平移向量 (3x1)
    %   accuracy - 变换后点集与目标点集的均方误差

    % 检查输入点集是否满足要求
    if size(sourcePoints, 1) ~= 3 || size(targetPoints, 1) ~= 3
        error('Input point sets must have 3 rows (X, Y, Z coordinates).');
    end
    if size(sourcePoints, 2) ~= size(targetPoints, 2)
        error('Source and target point sets must have the same number of columns.');
    end

    % 计算点集的中心点
    centroidSource = mean(sourcePoints, 2); % 计算源点集的中心
    centroidTarget = mean(targetPoints, 2); % 计算目标点集的中心

    % 将点集移到原点
    centeredSource = sourcePoints - centroidSource;
    centeredTarget = targetPoints - centroidTarget;

    % 计算协方差矩阵
    covariance = centeredSource * centeredTarget';

    % SVD分解
    [U, ~, V] = svd(covariance);

    % 检查并修正反射
    if det(U * V') < 0
        V(:, 3) = -V(:, 3);
    end

    % 计算旋转矩阵
    rotationMatrix = V * U';

    % 计算平移向量
    translationVector = centroidTarget - rotationMatrix * centroidSource;

    % 计算准确度
    transformedSource = rotationMatrix * sourcePoints + translationVector;
    accuracy = norm(transformedSource - targetPoints, 'fro') / size(targetPoints, 2);
end
