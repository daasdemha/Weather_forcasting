function [HourlyData] = LoadDataHour(FileName, Contents,StartLon, StartLat, idxTime,NumLon, NumLat)
% Each hour we read the data from the required models, defined by the
% index variable. Each model data are placed on a 'layer' of the 3D
% array resulting in a 7 x 700 x 400 array.
% We do this by indexing through the model names, then defining the
% start position as the beginnning of the Lat, beginning of the Lon and
% beginning of the new hour. We then define the number of elements
% along each data dimension, so the total number of Lat, the total
% number of Lon, but only 1 hour.
% You can use these values to select a smaller sub-set of the data if
% required to speed up testing o fthe functionality.

DataLayer = 1;
for idx = [1, 2, 4, 5, 6, 7, 8]
    HourlyData(DataLayer,:,:) = ncread(FileName, Contents.Variables(idx).Name,...
        [StartLon, StartLat, idxTime], [NumLon, NumLat, 1]);
    DataLayer = DataLayer + 1;
end
end