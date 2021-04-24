function ReshapingAndResults(PoolSize, T3, LogID, SelectedElement, EnsembleVectorPar, Data2Process)

EnsembleVectorPar = reshape(EnsembleVectorPar, 696, 396, []);
fprintf('Total processing time for %i workers = %.2f s in processing of first %i elements of Data.\n', PoolSize, sum(T3),SelectedElement);
%add the current number of running processors and the current data being
%processed to the log file

fprintf('Predicted processing time for %i workers = %.1f s in processing of all %i elements of Data.\n\n',PoolSize, 25*(T3 * (size(Data2Process,1)/SelectedElement)),size(Data2Process,1))

fprintf(LogID,'Total processing time for %i workers = %.2f s in processing of first %i elements of Data\n', PoolSize, sum(T3),SelectedElement);

    

end