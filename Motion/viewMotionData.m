function viewMotionData(motionData)
    switchViewSkullRB = 1;
    switchViewSkullMarkers = 0;
    switchViewMandibleRB = 1;
    switchViewMandibleMarkers = 0;

    switchViewTrajectory = 1;

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

    if switchViewTrajectory == 1
        figure; hold on;
        scatter3(motionData.RigidBodyMarkerGlassesMarker1PositionX, motionData.RigidBodyMarkerGlassesMarker1PositionY, motionData.RigidBodyMarkerGlassesMarker1PositionZ, 'LineWidth',1.5);
        scatter3(motionData.RigidBodyMarkerGlassesMarker2PositionX, motionData.RigidBodyMarkerGlassesMarker2PositionY, motionData.RigidBodyMarkerGlassesMarker2PositionZ, 'LineWidth',1.5);
        scatter3(motionData.RigidBodyMarkerGlassesMarker3PositionX, motionData.RigidBodyMarkerGlassesMarker3PositionY, motionData.RigidBodyMarkerGlassesMarker3PositionZ, 'LineWidth',1.5);
        scatter3(motionData.RigidBodyMarkerGlassesMarker4PositionX, motionData.RigidBodyMarkerGlassesMarker4PositionY, motionData.RigidBodyMarkerGlassesMarker4PositionZ, 'LineWidth',1.5);
        scatter3(motionData.RigidBodyMarkerGlassesMarker5PositionX, motionData.RigidBodyMarkerGlassesMarker5PositionY, motionData.RigidBodyMarkerGlassesMarker5PositionZ, 'LineWidth',1.5);
        plot3(motionData.RigidBodyMarkerMandibleMarker1PositionX, motionData.RigidBodyMarkerMandibleMarker1PositionY, motionData.RigidBodyMarkerMandibleMarker1PositionZ, 'LineWidth',1.5);
        plot3(motionData.RigidBodyMarkerMandibleMarker2PositionX, motionData.RigidBodyMarkerMandibleMarker2PositionY, motionData.RigidBodyMarkerMandibleMarker2PositionZ, 'LineWidth',1.5);
        plot3(motionData.RigidBodyMarkerMandibleMarker3PositionX, motionData.RigidBodyMarkerMandibleMarker3PositionY, motionData.RigidBodyMarkerMandibleMarker3PositionZ, 'LineWidth',1.5);
        plot3(motionData.RigidBodyMarkerMandibleMarker4PositionX, motionData.RigidBodyMarkerMandibleMarker4PositionY, motionData.RigidBodyMarkerMandibleMarker4PositionZ, 'LineWidth',1.5);
        plot3(motionData.RigidBodyMarkerMandibleMarker5PositionX, motionData.RigidBodyMarkerMandibleMarker5PositionY, motionData.RigidBodyMarkerMandibleMarker5PositionZ, 'LineWidth',1.5);
        plot3(motionData.RigidBodyMarkerMandibleMarker6PositionX, motionData.RigidBodyMarkerMandibleMarker6PositionY, motionData.RigidBodyMarkerMandibleMarker6PositionZ, 'LineWidth',1.5);
        xlabel('X'); ylabel('Y'); zlabel('Z');
        title('Trajectory of mandible markers');
        grid on; box on; axis equal;
        text(motionData.RigidBodyMarkerGlassesMarker1PositionX(1), motionData.RigidBodyMarkerGlassesMarker1PositionY(1), motionData.RigidBodyMarkerGlassesMarker1PositionZ(1), 's1');
        text(motionData.RigidBodyMarkerGlassesMarker2PositionX(1), motionData.RigidBodyMarkerGlassesMarker2PositionY(1), motionData.RigidBodyMarkerGlassesMarker2PositionZ(1), 's2');
        text(motionData.RigidBodyMarkerGlassesMarker3PositionX(1), motionData.RigidBodyMarkerGlassesMarker3PositionY(1), motionData.RigidBodyMarkerGlassesMarker3PositionZ(1), 's3');
        text(motionData.RigidBodyMarkerGlassesMarker4PositionX(1), motionData.RigidBodyMarkerGlassesMarker4PositionY(1), motionData.RigidBodyMarkerGlassesMarker4PositionZ(1), 's4');
        text(motionData.RigidBodyMarkerGlassesMarker5PositionX(1), motionData.RigidBodyMarkerGlassesMarker5PositionY(1), motionData.RigidBodyMarkerGlassesMarker5PositionZ(1), 's5');
        text(motionData.RigidBodyMarkerMandibleMarker1PositionX(1), motionData.RigidBodyMarkerMandibleMarker1PositionY(1), motionData.RigidBodyMarkerMandibleMarker1PositionZ(1), 'm1');
        text(motionData.RigidBodyMarkerMandibleMarker2PositionX(1), motionData.RigidBodyMarkerMandibleMarker2PositionY(1), motionData.RigidBodyMarkerMandibleMarker2PositionZ(1), 'm2');
        text(motionData.RigidBodyMarkerMandibleMarker3PositionX(1), motionData.RigidBodyMarkerMandibleMarker3PositionY(1), motionData.RigidBodyMarkerMandibleMarker3PositionZ(1), 'm3');
        text(motionData.RigidBodyMarkerMandibleMarker4PositionX(1), motionData.RigidBodyMarkerMandibleMarker4PositionY(1), motionData.RigidBodyMarkerMandibleMarker4PositionZ(1), 'm4');
        text(motionData.RigidBodyMarkerMandibleMarker5PositionX(1), motionData.RigidBodyMarkerMandibleMarker5PositionY(1), motionData.RigidBodyMarkerMandibleMarker5PositionZ(1), 'm5');
        text(motionData.RigidBodyMarkerMandibleMarker6PositionX(1), motionData.RigidBodyMarkerMandibleMarker6PositionY(1), motionData.RigidBodyMarkerMandibleMarker6PositionZ(1), 'm6');
    end
end