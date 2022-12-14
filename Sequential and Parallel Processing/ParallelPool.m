%% Parallel Analysis
function ParallelPool(PoolSize)
maxNumCompThreads(PoolSize); % ~~~ NEW LINE ADDED FOR MATLAB ONLINE ~~~
if isempty(gcp('nocreate'))
    parpool('threads'); % ~~~ CHANGE TO CODE FOR MATLAB ONLINE ~~~

poolobj = gcp;
% attaching a file allows it to be available at each processor without
% passing the file each time. This speeds up the process. For more
% information, ask your tutor.
addAttachedFiles(poolobj,{'EnsembleValue'});
end
end