function mandibleGeomagicPoints = registerMandibleBySkull(motionData, skullGeomagicPoints)
    
    t0SkullPosition = [
        motionData.RigidBodyMarkerGlassesMarker1PositionX(1), motionData.RigidBodyMarkerGlassesMarker2PositionX(1), motionData.RigidBodyMarkerGlassesMarker3PositionX(1), motionData.RigidBodyMarkerGlassesMarker4PositionX(1), motionData.RigidBodyMarkerGlassesMarker5PositionX(1);
        motionData.RigidBodyMarkerGlassesMarker1PositionY(1), motionData.RigidBodyMarkerGlassesMarker2PositionY(1), motionData.RigidBodyMarkerGlassesMarker3PositionY(1), motionData.RigidBodyMarkerGlassesMarker4PositionY(1), motionData.RigidBodyMarkerGlassesMarker5PositionY(1);
        motionData.RigidBodyMarkerGlassesMarker1PositionZ(1), motionData.RigidBodyMarkerGlassesMarker2PositionZ(1), motionData.RigidBodyMarkerGlassesMarker3PositionZ(1), motionData.RigidBodyMarkerGlassesMarker4PositionZ(1), motionData.RigidBodyMarkerGlassesMarker5PositionZ(1);
    ];

    sourcePoints = t0SkullPosition;
    targetPoints = skullGeomagicPoints;
    [rotationMatrix, translationVector, accuracy] = svdRigidMotion(sourcePoints, targetPoints);

    t0MandiblePosition = [
        motionData.RigidBodyMarkerMandibleMarker1PositionX(1), motionData.RigidBodyMarkerMandibleMarker2PositionX(1), motionData.RigidBodyMarkerMandibleMarker3PositionX(1), motionData.RigidBodyMarkerMandibleMarker4PositionX(1), motionData.RigidBodyMarkerMandibleMarker5PositionX(1), motionData.RigidBodyMarkerMandibleMarker6PositionX(1);
        motionData.RigidBodyMarkerMandibleMarker1PositionY(1), motionData.RigidBodyMarkerMandibleMarker2PositionY(1), motionData.RigidBodyMarkerMandibleMarker3PositionY(1), motionData.RigidBodyMarkerMandibleMarker4PositionY(1), motionData.RigidBodyMarkerMandibleMarker5PositionY(1), motionData.RigidBodyMarkerMandibleMarker6PositionY(1);
        motionData.RigidBodyMarkerMandibleMarker1PositionZ(1), motionData.RigidBodyMarkerMandibleMarker2PositionZ(1), motionData.RigidBodyMarkerMandibleMarker3PositionZ(1), motionData.RigidBodyMarkerMandibleMarker4PositionZ(1), motionData.RigidBodyMarkerMandibleMarker5PositionZ(1), motionData.RigidBodyMarkerMandibleMarker6PositionZ(1);
    ];

    mandibleGeomagicPoints = rotationMatrix * t0MandiblePosition + translationVector;
end
