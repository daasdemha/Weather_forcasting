function SequentialAndParallelProcessing
%% 0: Prepration before running code
clear all
close all

ElementsToGoThrough = [123]; % The size of data to process

ProcessorsToProcessFrom = [1,2]; % The number of processors used
HoursToProcess = 1; %how many hours worth of data we would like to process
% create new log file, 'w' replaces the file if present.
% To continually append, use 'a'
LogID = fopen('AnalysisLog.txt', 'a');
fprintf(LogID,'Test recorded on: %s\n', datestr(now, 0)); %recording the date and time of the test.

%The data entred in x1vals and y1Vals will be used to plot a graph.
%The data will only include the only first two processor sizes.
x1Vals = ProcessorsToProcessFrom;
y1Vals = [];

x2Vals = ProcessorsToProcessFrom;
y2Vals = [];


%% 1: Load Data


FileName = '..\Model\o3_surface_20180701000000.nc'; %the file we would like
%to process the data from

Contents = ncinfo(FileName);

Lat = ncread(FileName, 'lat');
Lon = ncread(FileName, 'lon');
NumHours = 25;

%% 2: Processing parameters
% ##  provided by customer  ##
RadLat = 30.2016;
RadLon = 24.8032;
RadO3 = 4.2653986e-08;

StartLat = 1;
NumLat = 400;
StartLon = 1;
NumLon = 700;

%% 3: Pre-allocate output array memory
% the '-4' value is due to the analysis method resulting in fewer output
% values than the input array.
NumLocations = (NumLon - 2) * (NumLat - 2);
EnsembleVectorPar = zeros(NumLocations, NumHours); % pre-allocate memory

%% 4: Cycle through the hours and load all the models for each hour and record memory use
% We use an index named 'NumHour' in our loop
% The section 'parallel processing' will process the data location one
% after the other, reporting on the time involved.
tic
for idxTime = 1:HoursToProcess %processing from 1 to the ammount of hours 
    %have entre to process

    %% 5: Load the data for each hour
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
    
    %% 6: Pre-process the data for parallel processing
    % This takes the 3D array of data [model, lat, lon] and generates the
    % data required to be processed at each location.
    % ## This process is defined by the customer ##
    % If you want to know the details, please ask, but this is not required
    % for the module or assessment.
    [Data2Process, LatLon] = PrepareData(HourlyData, Lat, Lon);
   
    
%% Parallel Analysis
    %% 7: Create the parallel pool and attache files for use

    for SelectedProcessor = ProcessorsToProcessFrom %Selecting a sinlgle 
        %processor at a time from a list of prossors entred by the user to
        %process the data.
    for SelectedElement = ElementsToGoThrough 
    PoolSize = SelectedProcessor ; % define the number of processors to use 
    %in parallel
    if isempty(gcp('nocreate'))
        parpool('local',PoolSize);
    end
    poolobj = gcp;
    % attaching a file allows it to be available at each processor without
    % passing the file each time. This speeds up the process. For more
    % information, ask your tutor.
    addAttachedFiles(poolobj,{'EnsembleValue'});
    
%     %% 8: Parallel processing is difficult to monitor progress so we define a
%     % special function to create a wait bar which is updated after each
%     % process completes an analysis. The update function is defined at the
%     % end of this script. Each time a parallel process competes it runs the
%     % function to update the waitbar.
    DataQ = parallel.pool.DataQueue; % Create a variable in the parallel pool
%     
%     % Create a waitbar and handle top it:
    hWaitBar = waitbar(0, sprintf('Time period %i, Please wait ...', idxTime));
%     % Define the function to call when new data is received in the data queue
%     % 'DataQ'. See end of script for the function definition.
    afterEach(DataQ, @nUpdateWaitbar);
    N = size(Data2Process,1); % the total number of data to process
    p = 20; % offset so the waitbar shows some colour quickly.
    
    %% 9: The actual parallel processing!
    % Ensemble value is a function defined by the customer to calculate the
    % ensemble value at each location. Understanding this function is not
    % required for the module or the assessment, but it is the reason for
    % this being a 'big data' project due to the processing time (not the
    % pure volume of raw data alone).
    T4 = toc;
    
    parfor idx = 1: SelectedElement %Process the from the fist to the 
        %number of elements entred by the user
        [EnsembleVectorPar(idx, idxTime)] = EnsembleValue(Data2Process(idx,:,:,:), LatLon, RadLat, RadLon, RadO3);
        send(DataQ, idx);
    end
    
    close(hWaitBar); % close the wait bar
    
    T3(idxTime) = toc - T4; % record the parallel processing time for this hour of data
    fprintf('Parallel processing time for hour %i : %.1f s\n', idxTime, T3(idxTime))
    
T2 = toc;
delete(gcp);


%need to fix later
%% 10: Reshape ensemble values to Lat, lon, hour format
EnsembleVectorPar = reshape(EnsembleVectorPar, 698, 398, []);
fprintf('Total processing time for %i workers = %.2f s\n', PoolSize, sum(T3));
%add the current number of running processors and the current data being 
%processed to the log file
fprintf(LogID,'Total processing time for %i workers = %.2f s in processing of first %i elements of Data\n', PoolSize, sum(T3),ElementsToGoThrough);
%To only include the only first two processor sizes and append them to
%y1Vals and y2Vals.
if ElementsToGoThrough(1) == SelectedElement
    y1Vals(end+1) = sum(T3); %appending the time to complete the process using.
elseif ElementsToGoThrough(2) == SelectedElement
    y2Vals(end+1) = sum(T3);
end



    end   
    end
end % end time loop
fprintf(LogID,'\n');
fclose(LogID);

%% 11: ### PROCESSING COMPLETE DATA NEEDS TO BE SAVED  ###

function nUpdateWaitbar(~) % nested function
    waitbar(p/N, hWaitBar,  sprintf('Hour %i, %.3f complete, %i out of %i', idxTime, p/N*100, p, N));
    p = p + 1;
end
%Here the data is used from x1vals and y1Vals to plot a graph
% Show two plots on different y-axes
% first data processed used below
str1 = string(ElementsToGoThrough(1));

if numel(ElementsToGoThrough) == 1 
    figure(1)
    yyaxis left
    plot(x1Vals, y1Vals, '-bd')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    %Here the data is used from x1vals and y1Vals to plot a graph
    %%Secound data entred processed and used below
else
    str2 = string(ElementsToGoThrough(2));

    Data1 = append('Data ',str1);
    Data2 = append('Data ',str2);

    figure(1)
    yyaxis left
    plot(x1Vals, y1Vals, '-bd')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    %Here the data is used from x1vals and y1Vals to plot a graph
    %%Secound data entred processed and used below
    figure(1)
    yyaxis right
    plot(x2Vals, y2Vals, '-rx')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')



    legend(Data1, Data2);

    %% Show two plots on same y-axis
    %% Mean processing time
    y1MeanVals = y1Vals / ElementsToGoThrough(1);
    y2MeanVals = y2Vals / ElementsToGoThrough(2);

    figure(2)
    plot(x1Vals, y1MeanVals, '-bd')
    hold on
    plot(x2Vals, y2MeanVals, '-rx')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Mean Processing time vs number of processors')
    legend(Data1, Data2);


 
end

end % end function

