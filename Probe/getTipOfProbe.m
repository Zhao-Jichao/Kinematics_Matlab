function tipOfProbe = getTipOfProbe(motionProbeData)
    % Markers ideal position
    probeDesignMarker1 = [30, 52, 0]';
    probeDesignMarker2 = [-30, 0, 0]';
    probeDesignMarker3 = [0, -40, 0]';
    probeDesignMarker4 = [0, -80, 0]';
    probeDesignTipMarker = [0, -307, -9]';

    probeDesignPosition = [probeDesignMarker1, probeDesignMarker2, probeDesignMarker3, probeDesignMarker4];

    % 提取初始时刻的标记点位置
    t0ProbePosition = [
        motionProbeData.RigidBodyMarkerProbeMarker1PositionX(1), motionProbeData.RigidBodyMarkerProbeMarker2PositionX(1), motionProbeData.RigidBodyMarkerProbeMarker3PositionX(1), motionProbeData.RigidBodyMarkerProbeMarker4PositionX(1);
        motionProbeData.RigidBodyMarkerProbeMarker1PositionY(1), motionProbeData.RigidBodyMarkerProbeMarker2PositionY(1), motionProbeData.RigidBodyMarkerProbeMarker3PositionY(1), motionProbeData.RigidBodyMarkerProbeMarker4PositionY(1);
        motionProbeData.RigidBodyMarkerProbeMarker1PositionZ(1), motionProbeData.RigidBodyMarkerProbeMarker2PositionZ(1), motionProbeData.RigidBodyMarkerProbeMarker3PositionZ(1), motionProbeData.RigidBodyMarkerProbeMarker4PositionZ(1);
    ];

    probeSourcePosition = probeDesignPosition;
    probeTargetPosition = t0ProbePosition;

    [probeRotationMatrix, probeTranslationVector, accuracy] = svdRigidMotion(probeSourcePosition, probeTargetPosition);

    tipOfProbe = probeRotationMatrix * probeDesignTipMarker + probeTranslationVector;
    fprintf('Probe alignment accuracy: %f\n', accuracy);
end
