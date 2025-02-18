function keyGeomagicPoints = computeKeyPointsTrajectory(motionData, keyGeomagicPoints)
    for i = 2:length(motionData.Frame)
        % Frame
        keyGeomagicPoints.Frame(i,1) = motionData.Frame(i);

        % Skull related
        skullSourcePosition = [
            motionData.RigidBodyMarkerGlassesMarker1PositionX(i-1), motionData.RigidBodyMarkerGlassesMarker2PositionX(i-1), motionData.RigidBodyMarkerGlassesMarker3PositionX(i-1), motionData.RigidBodyMarkerGlassesMarker4PositionX(i-1), motionData.RigidBodyMarkerGlassesMarker5PositionX(i-1);
            motionData.RigidBodyMarkerGlassesMarker1PositionY(i-1), motionData.RigidBodyMarkerGlassesMarker2PositionY(i-1), motionData.RigidBodyMarkerGlassesMarker3PositionY(i-1), motionData.RigidBodyMarkerGlassesMarker4PositionY(i-1), motionData.RigidBodyMarkerGlassesMarker5PositionY(i-1);
            motionData.RigidBodyMarkerGlassesMarker1PositionZ(i-1), motionData.RigidBodyMarkerGlassesMarker2PositionZ(i-1), motionData.RigidBodyMarkerGlassesMarker3PositionZ(i-1), motionData.RigidBodyMarkerGlassesMarker4PositionZ(i-1), motionData.RigidBodyMarkerGlassesMarker5PositionZ(i-1);];

        skullTargetPosition = [
            motionData.RigidBodyMarkerGlassesMarker1PositionX(i), motionData.RigidBodyMarkerGlassesMarker2PositionX(i), motionData.RigidBodyMarkerGlassesMarker3PositionX(i), motionData.RigidBodyMarkerGlassesMarker4PositionX(i), motionData.RigidBodyMarkerGlassesMarker5PositionX(i);
            motionData.RigidBodyMarkerGlassesMarker1PositionY(i), motionData.RigidBodyMarkerGlassesMarker2PositionY(i), motionData.RigidBodyMarkerGlassesMarker3PositionY(i), motionData.RigidBodyMarkerGlassesMarker4PositionY(i), motionData.RigidBodyMarkerGlassesMarker5PositionY(i);
            motionData.RigidBodyMarkerGlassesMarker1PositionZ(i), motionData.RigidBodyMarkerGlassesMarker2PositionZ(i), motionData.RigidBodyMarkerGlassesMarker3PositionZ(i), motionData.RigidBodyMarkerGlassesMarker4PositionZ(i), motionData.RigidBodyMarkerGlassesMarker5PositionZ(i);];

        [skullRotationMatrix, skullTranslationVector, accuracy] = svdRigidMotion(skullSourcePosition, skullTargetPosition);

        fprintf('Frame %d, Alignment accuracy: %f\n', i, accuracy);

        upperKeyPointsPosition = [
            keyGeomagicPoints.UpperIncisorX(i-1), keyGeomagicPoints.UpperLeftFossaX(i-1), keyGeomagicPoints.UpperRightFossaX(i-1);
            keyGeomagicPoints.UpperIncisorY(i-1), keyGeomagicPoints.UpperLeftFossaY(i-1), keyGeomagicPoints.UpperRightFossaY(i-1);
            keyGeomagicPoints.UpperIncisorZ(i-1), keyGeomagicPoints.UpperLeftFossaZ(i-1), keyGeomagicPoints.UpperRightFossaZ(i-1);];

        newUpperKeyPointsPosition = skullRotationMatrix * upperKeyPointsPosition + skullTranslationVector;

        keyGeomagicPoints.UpperIncisorX(i,1)    = newUpperKeyPointsPosition(1,1);
        keyGeomagicPoints.UpperIncisorY(i,1)    = newUpperKeyPointsPosition(2,1);
        keyGeomagicPoints.UpperIncisorZ(i,1)    = newUpperKeyPointsPosition(3,1);
        keyGeomagicPoints.UpperLeftFossaX(i,1)  = newUpperKeyPointsPosition(1,2);
        keyGeomagicPoints.UpperLeftFossaY(i,1)  = newUpperKeyPointsPosition(2,2);
        keyGeomagicPoints.UpperLeftFossaZ(i,1)  = newUpperKeyPointsPosition(3,2);
        keyGeomagicPoints.UpperRightFossaX(i,1) = newUpperKeyPointsPosition(1,3);
        keyGeomagicPoints.UpperRightFossaY(i,1) = newUpperKeyPointsPosition(2,3);
        keyGeomagicPoints.UpperRightFossaZ(i,1) = newUpperKeyPointsPosition(3,3);

        % Mandible related
        mandibleSourcePosition = [
            motionData.RigidBodyMarkerMandibleMarker1PositionX(i-1), motionData.RigidBodyMarkerMandibleMarker2PositionX(i-1), motionData.RigidBodyMarkerMandibleMarker3PositionX(i-1), motionData.RigidBodyMarkerMandibleMarker4PositionX(i-1), motionData.RigidBodyMarkerMandibleMarker5PositionX(i-1), motionData.RigidBodyMarkerMandibleMarker6PositionX(i-1);
            motionData.RigidBodyMarkerMandibleMarker1PositionY(i-1), motionData.RigidBodyMarkerMandibleMarker2PositionY(i-1), motionData.RigidBodyMarkerMandibleMarker3PositionY(i-1), motionData.RigidBodyMarkerMandibleMarker4PositionY(i-1), motionData.RigidBodyMarkerMandibleMarker5PositionY(i-1), motionData.RigidBodyMarkerMandibleMarker6PositionY(i-1);
            motionData.RigidBodyMarkerMandibleMarker1PositionZ(i-1), motionData.RigidBodyMarkerMandibleMarker2PositionZ(i-1), motionData.RigidBodyMarkerMandibleMarker3PositionZ(i-1), motionData.RigidBodyMarkerMandibleMarker4PositionZ(i-1), motionData.RigidBodyMarkerMandibleMarker5PositionZ(i-1), motionData.RigidBodyMarkerMandibleMarker6PositionZ(i-1);];
        
        mandibleTargetPosition = [
            motionData.RigidBodyMarkerMandibleMarker1PositionX(i), motionData.RigidBodyMarkerMandibleMarker2PositionX(i), motionData.RigidBodyMarkerMandibleMarker3PositionX(i), motionData.RigidBodyMarkerMandibleMarker4PositionX(i), motionData.RigidBodyMarkerMandibleMarker5PositionX(i), motionData.RigidBodyMarkerMandibleMarker6PositionX(i);
            motionData.RigidBodyMarkerMandibleMarker1PositionY(i), motionData.RigidBodyMarkerMandibleMarker2PositionY(i), motionData.RigidBodyMarkerMandibleMarker3PositionY(i), motionData.RigidBodyMarkerMandibleMarker4PositionY(i), motionData.RigidBodyMarkerMandibleMarker5PositionY(i), motionData.RigidBodyMarkerMandibleMarker6PositionY(i);
            motionData.RigidBodyMarkerMandibleMarker1PositionZ(i), motionData.RigidBodyMarkerMandibleMarker2PositionZ(i), motionData.RigidBodyMarkerMandibleMarker3PositionZ(i), motionData.RigidBodyMarkerMandibleMarker4PositionZ(i), motionData.RigidBodyMarkerMandibleMarker5PositionZ(i), motionData.RigidBodyMarkerMandibleMarker6PositionZ(i);];

        [mandibleRotationMatrix, mandibleTranslationVector, accuracy] = svdRigidMotion(mandibleSourcePosition, mandibleTargetPosition);

        fprintf('Frame %d, Alignment accuracy: %f\n', i, accuracy);

        lowerKeyPointsPosition = [
            keyGeomagicPoints.LowerIncisorX(i-1), keyGeomagicPoints.LowerLeftCondyleX(i-1), keyGeomagicPoints.LowerRightCondyleX(i-1);
            keyGeomagicPoints.LowerIncisorY(i-1), keyGeomagicPoints.LowerLeftCondyleY(i-1), keyGeomagicPoints.LowerRightCondyleY(i-1);
            keyGeomagicPoints.LowerIncisorZ(i-1), keyGeomagicPoints.LowerLeftCondyleZ(i-1), keyGeomagicPoints.LowerRightCondyleZ(i-1);];

        newLowerKeyPointsPosition = mandibleRotationMatrix * lowerKeyPointsPosition + mandibleTranslationVector;

        keyGeomagicPoints.LowerIncisorX(i,1)      = newLowerKeyPointsPosition(1,1);
        keyGeomagicPoints.LowerIncisorY(i,1)      = newLowerKeyPointsPosition(2,1);
        keyGeomagicPoints.LowerIncisorZ(i,1)      = newLowerKeyPointsPosition(3,1);
        keyGeomagicPoints.LowerLeftCondyleX(i,1)  = newLowerKeyPointsPosition(1,2);
        keyGeomagicPoints.LowerLeftCondyleY(i,1)  = newLowerKeyPointsPosition(2,2);
        keyGeomagicPoints.LowerLeftCondyleZ(i,1)  = newLowerKeyPointsPosition(3,2);
        keyGeomagicPoints.LowerRightCondyleX(i,1) = newLowerKeyPointsPosition(1,3);
        keyGeomagicPoints.LowerRightCondyleY(i,1) = newLowerKeyPointsPosition(2,3);
        keyGeomagicPoints.LowerRightCondyleZ(i,1) = newLowerKeyPointsPosition(3,3);
    end
end
