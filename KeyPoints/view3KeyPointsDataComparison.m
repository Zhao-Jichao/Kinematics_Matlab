function view3KeyPointsDataComparison(preopKeyGeomagicPoints, postopKeyGeomagicPoints, postop2KeyGeomagicPoints)
    switchUpperIncisor = 0;
    switchLowerIncisor = 1;

    if switchUpperIncisor == 1
        figure; hold on;
        plot(preopKeyGeomagicPoints.UpperIncisorX-preopKeyGeomagicPoints.UpperIncisorX(1), 'LineWidth',1.5);
        plot(postopKeyGeomagicPoints.UpperIncisorX-postopKeyGeomagicPoints.UpperIncisorX(1), 'LineWidth',1.5);
        plot(postop2KeyGeomagicPoints.UpperIncisorX-postop2KeyGeomagicPoints.UpperIncisorX(1), 'LineWidth',1.5); 
        title("UpperIncisorX");

        figure; hold on;
        plot(preopKeyGeomagicPoints.UpperIncisorY-preopKeyGeomagicPoints.UpperIncisorY(1), 'LineWidth',1.5);
        plot(postopKeyGeomagicPoints.UpperIncisorY-postopKeyGeomagicPoints.UpperIncisorY(1), 'LineWidth',1.5);
        plot(postop2KeyGeomagicPoints.UpperIncisorY-postop2KeyGeomagicPoints.UpperIncisorY(1), 'LineWidth',1.5); 
        title("UpperIncisorY");

        figure; hold on;
        plot(preopKeyGeomagicPoints.UpperIncisorZ-preopKeyGeomagicPoints.UpperIncisorZ(1), 'LineWidth',1.5);
        plot(postopKeyGeomagicPoints.UpperIncisorZ-postopKeyGeomagicPoints.UpperIncisorZ(1), 'LineWidth',1.5);
        plot(postop2KeyGeomagicPoints.UpperIncisorZ-postop2KeyGeomagicPoints.UpperIncisorZ(1), 'LineWidth',1.5); 
        title("UpperIncisorZ");
        
        figure; hold on;
        plot3(preopKeyGeomagicPoints.UpperIncisorX, preopKeyGeomagicPoints.UpperIncisorY, preopKeyGeomagicPoints.UpperIncisorZ, 'LineWidth',1.5);
        plot3(postopKeyGeomagicPoints.UpperIncisorX, postopKeyGeomagicPoints.UpperIncisorY, postopKeyGeomagicPoints.UpperIncisorZ, 'LineWidth',1.5);
        plot3(postop2KeyGeomagicPoints.UpperIncisorX, postop2KeyGeomagicPoints.UpperIncisorY, postop2KeyGeomagicPoints.UpperIncisorZ, 'LineWidth',1.5);
        legend('pre-op', 'post-op', 'post-op2');
        xlabel('X'); ylabel('Y'); zlabel('Z');
        title('Trajectory of upper incisor');
        grid on; axis equal; box on;
    end

    if switchLowerIncisor == 1
        figure; hold on;
        plot(preopKeyGeomagicPoints.LowerIncisorX-preopKeyGeomagicPoints.LowerIncisorX(1), 'LineWidth',1.5);
        plot(postopKeyGeomagicPoints.LowerIncisorX-postopKeyGeomagicPoints.LowerIncisorX(1), 'LineWidth',1.5);
        plot(postop2KeyGeomagicPoints.LowerIncisorX-postop2KeyGeomagicPoints.LowerIncisorX(1), 'LineWidth',1.5); 
        title("LowerIncisorX");

        figure; hold on;
        plot(preopKeyGeomagicPoints.LowerIncisorY-preopKeyGeomagicPoints.LowerIncisorY(1), 'LineWidth',1.5);
        plot(postopKeyGeomagicPoints.LowerIncisorY-postopKeyGeomagicPoints.LowerIncisorY(1), 'LineWidth',1.5);
        plot(postop2KeyGeomagicPoints.LowerIncisorY-postop2KeyGeomagicPoints.LowerIncisorY(1), 'LineWidth',1.5); 
        title("LowerIncisorY");

        figure; hold on;
        plot(preopKeyGeomagicPoints.LowerIncisorZ-preopKeyGeomagicPoints.LowerIncisorZ(1), 'LineWidth',1.5);
        plot(postopKeyGeomagicPoints.LowerIncisorZ-postopKeyGeomagicPoints.LowerIncisorZ(1), 'LineWidth',1.5);
        plot(postop2KeyGeomagicPoints.LowerIncisorZ-postop2KeyGeomagicPoints.LowerIncisorZ(1), 'LineWidth',1.5); 
        title("LowerIncisorZ");

        figure; hold on;
        plot3(preopKeyGeomagicPoints.LowerIncisorX, preopKeyGeomagicPoints.LowerIncisorY, preopKeyGeomagicPoints.LowerIncisorZ, 'LineWidth',1.5);
        plot3(postopKeyGeomagicPoints.LowerIncisorX, postopKeyGeomagicPoints.LowerIncisorY, postopKeyGeomagicPoints.LowerIncisorZ, 'LineWidth',1.5);
        plot3(postop2KeyGeomagicPoints.LowerIncisorX, postop2KeyGeomagicPoints.LowerIncisorY, postop2KeyGeomagicPoints.LowerIncisorZ, 'LineWidth',1.5);
        legend('pre-op', 'post-op', 'post-op2');
        xlabel('X'); ylabel('Y'); zlabel('Z');
        title('Trajectory of lower incisor');
        grid on; axis equal; box on;
    end
end
