function ReshapingAndResults(PoolSize, T3, LogID, SelectedElement, EnsembleVectorPar)
EnsembleVectorPar = reshape(EnsembleVectorPar, 696, 396, []);
fprintf('Total processing time for %i workers = %.2f s\n', PoolSize, sum(T3));
%add the current number of running processors and the current data being
%processed to the log file
fprintf(LogID,'Total processing time for %i workers = %.2f s in processing of first %i elements of Data\n', PoolSize, sum(T3),SelectedElement);

end