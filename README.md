# Kinematics_Matlab

## Added process motion probe data function to get skull markers coordinates 02/22/2025
- Added function 'reorderProbeMarkers.m' to rearrange its order to match the specified order.
- Added function 'getTipOfProbe.m' to get the tip position based on the other four markers.
- Added function 'loadProbeGeomagicTips.m' to load four tips position at Nasion, Subnasale, Left Tragus, Right Tragus in Geomagic coordinates.
- Finally, get the skull markers coordinates in Geomagic coordinates based on the skull markers coordinates in Motive coordinates.
- The saved `Skull_Markers_Coordinates.csv` file also contains the accuracy when calculating the relation between probe tips in Motive coordinates and Geomagic coordinates.
- The validity was also verified based on the trajectory of mandible during maximum open and close oral task.

## Added save index and compare related functions 02/19/2025
- Added function `processMotionDataToSaveIndex.mlx` used to view motion data and manually select oral task index.
- Added function `saveOralTaskIndex.m` to save the index manually selected by function `processMotionDataToSaveIndex.mlx`.
- Added functions `compare3KeyPointsTrajectory.mlx` and `view3KeyPointsDataComparison` to compare three different scenarios of a case: preop, postop, postop2.

## Added motion analysis and key points analysis functions 02/18/2025
- Added motion analysis related function.
- Added key points analysis related function.

## Initiate Whole Project 02/17/2025
- Add `loadMotionCSVData.m` to load motion data.