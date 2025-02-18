function viewKeyPointsData(keyGeomagicPoints)
    switchUpperIncisor = 1;
    switchLowerIncisor = 1;

    if switchUpperIncisor == 1
        figure
        plot(keyGeomagicPoints.UpperIncisorX-keyGeomagicPoints.UpperIncisorX(1)); title("UpperIncisorX");
        figure
        plot(keyGeomagicPoints.UpperIncisorY-keyGeomagicPoints.UpperIncisorY(1)); title("UpperIncisorY");
        figure
        plot(keyGeomagicPoints.UpperIncisorZ-keyGeomagicPoints.UpperIncisorZ(1)); title("UpperIncisorZ");
        figure
        plot3(keyGeomagicPoints.UpperIncisorX, keyGeomagicPoints.UpperIncisorY, keyGeomagicPoints.UpperIncisorZ);
        xlabel('X'); ylabel('Y'); zlabel('Z');
        title('Trajectory of upper incisor');
        grid on; axis equal;
    end

    if switchLowerIncisor == 1
        figure
        plot(keyGeomagicPoints.LowerIncisorX-keyGeomagicPoints.LowerIncisorX(1)); title("LowerIncisorX");
        figure
        plot(keyGeomagicPoints.LowerIncisorY-keyGeomagicPoints.LowerIncisorY(1)); title("LowerIncisorY");
        figure
        plot(keyGeomagicPoints.LowerIncisorZ-keyGeomagicPoints.LowerIncisorZ(1)); title("LowerIncisorZ");
        figure
        plot3(keyGeomagicPoints.LowerIncisorX, keyGeomagicPoints.LowerIncisorY, keyGeomagicPoints.LowerIncisorZ);
        xlabel('X'); ylabel('Y'); zlabel('Z');
        title('Trajectory of lower incisor');
        grid on; axis equal;
    end
end
