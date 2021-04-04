function [Data2Process, LatLon] = PreProcessing(HourlyData, Lat, Lon)
% This takes the 3D array of data [model, lat, lon] and generates the
% data required to be processed at each location.
% ## This process is defined by the customer ##
% If you want to know the details, please ask, but this is not required
% for the module or assessment.
 [Data2Process, LatLon] = PrepareData(HourlyData, Lat, Lon);
end