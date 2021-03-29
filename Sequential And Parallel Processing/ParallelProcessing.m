function [T3] = ParallelProcessing(SelectedElement, idxTime, Data2Process,...
    LatLon, RadLat, RadLon, RadO3, T4)
% Ensemble value is a function defined by the customer to calculate the
% ensemble value at each location. Understanding this function is not
% required for the module or the assessment, but it is the reason for
% this being a 'big data' project due to the processing time (not the
% pure volume of raw data alone).
parfor idx = 1: SelectedElement % size(Data2Process,1)
    [EnsembleVectorPar(idx, idxTime)] = EnsembleValue(Data2Process(idx,:,:,:),...
        LatLon, RadLat, RadLon, RadO3);
end

T3(idxTime) = toc - T4; % record the parallel processing time for this hour of data
fprintf('Parallel processing time for hour %i : %.1f s\n', idxTime, T3(idxTime))
end
