function [NumLocations] = PreAllocating(NumLon, NumLat)
% the '-4' value is due to the analysis method resulting in fewer output
% values than the input array.
NumLocations = (NumLon - 4) * (NumLat - 4);
end