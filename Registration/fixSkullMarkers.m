function reorderedMotionData = fixSkullMarkers(motionData, skullGeomagicPoints)

    reorderedMotionData = motionData;
    for i = 1:length(motionData.Frame)
        skullPosition = [
            motionData.RigidBodyMarkerGlassesMarker1PositionX(i), motionData.RigidBodyMarkerGlassesMarker2PositionX(i), motionData.RigidBodyMarkerGlassesMarker3PositionX(i), motionData.RigidBodyMarkerGlassesMarker4PositionX(i), motionData.RigidBodyMarkerGlassesMarker5PositionX(i);
            motionData.RigidBodyMarkerGlassesMarker1PositionY(i), motionData.RigidBodyMarkerGlassesMarker2PositionY(i), motionData.RigidBodyMarkerGlassesMarker3PositionY(i), motionData.RigidBodyMarkerGlassesMarker4PositionY(i), motionData.RigidBodyMarkerGlassesMarker5PositionY(i);
            motionData.RigidBodyMarkerGlassesMarker1PositionZ(i), motionData.RigidBodyMarkerGlassesMarker2PositionZ(i), motionData.RigidBodyMarkerGlassesMarker3PositionZ(i), motionData.RigidBodyMarkerGlassesMarker4PositionZ(i), motionData.RigidBodyMarkerGlassesMarker5PositionZ(i);];

        sourcePoints = skullPosition;
        targetPoints = skullGeomagicPoints;
        [rotationMatrix, translationVector, accuracy] = svdRigidMotion(sourcePoints, targetPoints);

        fprintf('Frame %d, Alignment accuracy: %f\n', i, accuracy);

        skullRBPosition = [
            motionData.RigidBodyGlassesPositionX(i);
            motionData.RigidBodyGlassesPositionY(i);
            motionData.RigidBodyGlassesPositionZ(i);
        ];
        mandiblePosition = [
            motionData.RigidBodyMarkerMandibleMarker1PositionX(i), motionData.RigidBodyMarkerMandibleMarker2PositionX(i), motionData.RigidBodyMarkerMandibleMarker3PositionX(i), motionData.RigidBodyMarkerMandibleMarker4PositionX(i), motionData.RigidBodyMarkerMandibleMarker5PositionX(i), motionData.RigidBodyMarkerMandibleMarker6PositionX(i);
            motionData.RigidBodyMarkerMandibleMarker1PositionY(i), motionData.RigidBodyMarkerMandibleMarker2PositionY(i), motionData.RigidBodyMarkerMandibleMarker3PositionY(i), motionData.RigidBodyMarkerMandibleMarker4PositionY(i), motionData.RigidBodyMarkerMandibleMarker5PositionY(i), motionData.RigidBodyMarkerMandibleMarker6PositionY(i);
            motionData.RigidBodyMarkerMandibleMarker1PositionZ(i), motionData.RigidBodyMarkerMandibleMarker2PositionZ(i), motionData.RigidBodyMarkerMandibleMarker3PositionZ(i), motionData.RigidBodyMarkerMandibleMarker4PositionZ(i), motionData.RigidBodyMarkerMandibleMarker5PositionZ(i), motionData.RigidBodyMarkerMandibleMarker6PositionZ(i);
        ];
        mandibleRBPosition = [
            motionData.RigidBodyMandiblePositionX(i);
            motionData.RigidBodyMandiblePositionY(i);
            motionData.RigidBodyMandiblePositionZ(i);
        ];

        newSkullPosition = rotationMatrix * skullPosition + translationVector;
        newSkullRBPosition = rotationMatrix * skullRBPosition + translationVector;
        newMandiblePosition = rotationMatrix * mandiblePosition + translationVector;
        newMandibleRBPosition = rotationMatrix * mandibleRBPosition + translationVector;

        reorderedMotionData.RigidBodyMarkerGlassesMarker1PositionX(i) = newSkullPosition(1,1);
        reorderedMotionData.RigidBodyMarkerGlassesMarker2PositionX(i) = newSkullPosition(1,2);
        reorderedMotionData.RigidBodyMarkerGlassesMarker3PositionX(i) = newSkullPosition(1,3);
        reorderedMotionData.RigidBodyMarkerGlassesMarker4PositionX(i) = newSkullPosition(1,4);
        reorderedMotionData.RigidBodyMarkerGlassesMarker5PositionX(i) = newSkullPosition(1,5);
        reorderedMotionData.RigidBodyMarkerGlassesMarker1PositionY(i) = newSkullPosition(2,1);
        reorderedMotionData.RigidBodyMarkerGlassesMarker2PositionY(i) = newSkullPosition(2,2);
        reorderedMotionData.RigidBodyMarkerGlassesMarker3PositionY(i) = newSkullPosition(2,3);
        reorderedMotionData.RigidBodyMarkerGlassesMarker4PositionY(i) = newSkullPosition(2,4);
        reorderedMotionData.RigidBodyMarkerGlassesMarker5PositionY(i) = newSkullPosition(2,5);
        reorderedMotionData.RigidBodyMarkerGlassesMarker1PositionZ(i) = newSkullPosition(3,1);
        reorderedMotionData.RigidBodyMarkerGlassesMarker2PositionZ(i) = newSkullPosition(3,2);
        reorderedMotionData.RigidBodyMarkerGlassesMarker3PositionZ(i) = newSkullPosition(3,3);
        reorderedMotionData.RigidBodyMarkerGlassesMarker4PositionZ(i) = newSkullPosition(3,4);
        reorderedMotionData.RigidBodyMarkerGlassesMarker5PositionZ(i) = newSkullPosition(3,5);

        reorderedMotionData.RigidBodyGlassesPositionX(i) = newSkullRBPosition(1,1);
        reorderedMotionData.RigidBodyGlassesPositionY(i) = newSkullRBPosition(2,1);
        reorderedMotionData.RigidBodyGlassesPositionZ(i) = newSkullRBPosition(3,1);

        reorderedMotionData.RigidBodyMarkerMandibleMarker1PositionX(i) = newMandiblePosition(1,1);
        reorderedMotionData.RigidBodyMarkerMandibleMarker2PositionX(i) = newMandiblePosition(1,2);
        reorderedMotionData.RigidBodyMarkerMandibleMarker3PositionX(i) = newMandiblePosition(1,3);
        reorderedMotionData.RigidBodyMarkerMandibleMarker4PositionX(i) = newMandiblePosition(1,4);
        reorderedMotionData.RigidBodyMarkerMandibleMarker5PositionX(i) = newMandiblePosition(1,5);
        reorderedMotionData.RigidBodyMarkerMandibleMarker6PositionX(i) = newMandiblePosition(1,6);
        reorderedMotionData.RigidBodyMarkerMandibleMarker1PositionY(i) = newMandiblePosition(2,1);
        reorderedMotionData.RigidBodyMarkerMandibleMarker2PositionY(i) = newMandiblePosition(2,2);
        reorderedMotionData.RigidBodyMarkerMandibleMarker3PositionY(i) = newMandiblePosition(2,3);
        reorderedMotionData.RigidBodyMarkerMandibleMarker4PositionY(i) = newMandiblePosition(2,4);
        reorderedMotionData.RigidBodyMarkerMandibleMarker5PositionY(i) = newMandiblePosition(2,5);
        reorderedMotionData.RigidBodyMarkerMandibleMarker6PositionY(i) = newMandiblePosition(2,6);
        reorderedMotionData.RigidBodyMarkerMandibleMarker1PositionZ(i) = newMandiblePosition(3,1);
        reorderedMotionData.RigidBodyMarkerMandibleMarker2PositionZ(i) = newMandiblePosition(3,2);
        reorderedMotionData.RigidBodyMarkerMandibleMarker3PositionZ(i) = newMandiblePosition(3,3);
        reorderedMotionData.RigidBodyMarkerMandibleMarker4PositionZ(i) = newMandiblePosition(3,4);
        reorderedMotionData.RigidBodyMarkerMandibleMarker5PositionZ(i) = newMandiblePosition(3,5);
        reorderedMotionData.RigidBodyMarkerMandibleMarker6PositionZ(i) = newMandiblePosition(3,6);

        reorderedMotionData.RigidBodyMandiblePositionX(i) = newMandibleRBPosition(1,1);
        reorderedMotionData.RigidBodyMandiblePositionY(i) = newMandibleRBPosition(2,1);
        reorderedMotionData.RigidBodyMandiblePositionZ(i) = newMandibleRBPosition(3,1);
    end
end
