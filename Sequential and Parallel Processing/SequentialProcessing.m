function [T3] = SequentialProcessing(idxTime, Data2Process,...
    LatLon, RadLat, RadLon, RadO3, T4)

[EnsembleVectorPar(1, idxTime)] = EnsembleValue(Data2Process(1,:,:,:), LatLon, RadLat, RadLon, RadO3);

T3(idxTime) = toc - T4; % record the Sequential processing time for this hour of data
fprintf('Sequential processing time for hour %i : %.1f s\n', idxTime, T3(idxTime))

end