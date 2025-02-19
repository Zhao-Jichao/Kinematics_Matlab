function viewMotionData(motionData)
    switchViewSkullRB = 1;
    switchViewSkullMarkers = 0;
    switchViewMandibleRB = 1;
    switchViewMandibleMarkers = 0;

    if switchViewSkullRB == 1
        figure
        plot(motionData.RigidBodyGlassesPositionX-motionData.RigidBodyGlassesPositionX(1), 'LineWidth',1.5); title("RigidBodyGlassesPositionX");
        figure
        plot(motionData.RigidBodyGlassesPositionY-motionData.RigidBodyGlassesPositionY(1), 'LineWidth',1.5); title("RigidBodyGlassesPositionY");
        figure
        plot(motionData.RigidBodyGlassesPositionZ-motionData.RigidBodyGlassesPositionZ(1), 'LineWidth',1.5); title("RigidBodyGlassesPositionZ");
    end

    if switchViewSkullMarkers == 1
        figure
        plot(motionData.RigidBodyMarkerGlassesMarker1PositionX-motionData.RigidBodyMarkerGlassesMarker1PositionX(1), 'LineWidth',1.5); title("RigidBodyMarkerGlassesMarker1PositionX");
        figure
        plot(motionData.RigidBodyMarkerGlassesMarker1PositionY-motionData.RigidBodyMarkerGlassesMarker1PositionY(1), 'LineWidth',1.5); title("RigidBodyMarkerGlassesMarker1PositionY");
        figure
        plot(motionData.RigidBodyMarkerGlassesMarker1PositionZ-motionData.RigidBodyMarkerGlassesMarker1PositionZ(1), 'LineWidth',1.5); title("RigidBodyMarkerGlassesMarker1PositionZ");
    end

    if switchViewMandibleRB == 1
        figure
        plot(motionData.RigidBodyMandiblePositionX-motionData.RigidBodyMandiblePositionX(1), 'LineWidth',1.5); title("RigidBodyMandiblePositionX");
        figure
        plot(motionData.RigidBodyMandiblePositionY-motionData.RigidBodyMandiblePositionY(1), 'LineWidth',1.5); title("RigidBodyMandiblePositionY");
        figure
        plot(motionData.RigidBodyMandiblePositionZ-motionData.RigidBodyMandiblePositionZ(1), 'LineWidth',1.5); title("RigidBodyMandiblePositionZ");
    end

    if switchViewMandibleMarkers == 1
        figure
        plot(motionData.RigidBodyMarkerMandibleMarker1PositionX-motionData.RigidBodyMarkerMandibleMarker1PositionX(1), 'LineWidth',1.5); title("RigidBodyMarkerMandibleMarker1PositionX");
        figure
        plot(motionData.RigidBodyMarkerMandibleMarker1PositionY-motionData.RigidBodyMarkerMandibleMarker1PositionY(1), 'LineWidth',1.5); title("RigidBodyMarkerMandibleMarker1PositionY");
        figure
        plot(motionData.RigidBodyMarkerMandibleMarker1PositionZ-motionData.RigidBodyMarkerMandibleMarker1PositionZ(1), 'LineWidth',1.5); title("RigidBodyMarkerMandibleMarker1PositionZ");
    end

end