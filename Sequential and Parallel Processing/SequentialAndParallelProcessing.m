function SequentialAndParallelProcessing

clear all
close all

%% 0: Selecting Processors, Number of elements to go through, total number
%%of hours to procees the data from.
% create new log file, 'w' replaces the file if present.
% To continually append, use 'a'
LogID = fopen('AnalysisLog.txt', 'a');
fprintf(LogID,'Test recorded on: %s', datestr(now, 0)); %recording the date and time of the test.

ElementsToGoThrough = [500,200]; % The size of data to process
ProcessorsToProcessFrom = [1,2,3]; % The number of processors used
HoursToProcess = 1; %how many hours worth of data we would like to process
i = 1;
%% 0.1 Initilizing the values before making a graph
%The data entred in x1vals and y1Vals will be used to plot a graph.
%The data will only include the only first two processor sizes.
x1Vals = ProcessorsToProcessFrom;
y1Vals = [];
y2Vals = [];
FileName = '../Model/o3_surface_20180701000000.nc'; % file to process
%% Creating Errors

%Text errors
%CreateTestData_Text(FileName)
%'../Model/TestFileText.nc' is the file with text error data

%NaN errors
NewFileName = '../Model/TestFileNaN.nc';
CreateTestData_NaN(FileName, NewFileName)

%-9999 errors
NewFileName9999 = '../Model/TestFile9999.nc';
CreateTestData_9999(FileName, NewFileName9999)

%% Error Testing

TextFilesToBeTested = {'../Model/TestFileText.nc', FileName};

NaNFilesToBeTested = {'../Model/TestFileNaN.nc', FileName};

FilesToBeTested9999 = {'../Model/TestFile9999.nc', FileName};

%function to test for text, NaN and -9999 errors.
[SkipHours9999, SkipHoursNaN] = AutomatedErrorTesting(TextFilesToBeTested, NaNFilesToBeTested, FilesToBeTested9999, FileName);
%% 1: Load Data
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
[NumLocations] = PreAllocating(NumLon, NumLat);

%% 4: Cycle through the hours and load all the models for each hour and record memory use
% We use an index named 'idxTime' in our loop
% The section 'parallel processing' will process the data location one
% after the other, reporting on the time involved.
tic
for idxTime = 1:HoursToProcess
    
fprintf(LogID,'\nProcessing hour: %i\n', idxTime);
fprintf('\nProcessing hour number: %i from Total %i\n', idxTime, HoursToProcess)

    %% 5: Load the data for each hour
    [HourlyData] = LoadDataHour(FileName, Contents,StartLon, StartLat, idxTime,NumLon, NumLat);

    %% 6: Pre-process the data for parallel processing
     [Data2Process, LatLon] = PreProcessing(HourlyData, Lat, Lon);
     
    %% Slecting current processor procseeing the data and the current data
    %%being processed
    %processor at a time from a list of prossors entred by the user to
    %process the data.
    for SelectedElement = ElementsToGoThrough
        fprintf(LogID,'\nProcessing %i elements of Data\n', SelectedElement);
    for PoolSize = ProcessorsToProcessFrom %Selecting a sinlgle

        
            %%Setting and reseting Values.
            EnsembleVectorPar = zeros(NumLocations, NumHours); % pre-allocate memory
            T3 = 0; %Reseting T3
            
            %% 7: Create the parallel pool and attache files for use
            ParallelPool(PoolSize);
            
            %% 9: The Parallel and Sequential Processing
            T4 = toc;

            if numel(SkipHoursNaN)>= i 
                    if SkipHoursNaN(i) == idxTime
                        continue
                    end
            elseif numel(SkipHours9999) >= i
                    if SkipHours9999(i) == idxTime
                        continue
                    end
            else              
                    if SelectedElement == 1
                        [T3] = SequentialProcessing(idxTime, Data2Process,...
            LatLon, RadLat, RadLon, RadO3, T4); % The Sequential processing!

                    else
                        [T3] = ParallelProcessing(SelectedElement, idxTime, Data2Process,...
            LatLon, RadLat, RadLon, RadO3, T4); % The parallel processing!
                    end
                    
            end

   

            
        T2 = toc;
        delete(gcp);
        
        %% 10: Reshape ensemble values to Lat, lon, hour format
        % Prints results and appends them to Log book 
        ReshapingAndResults(PoolSize, T3, LogID, SelectedElement, EnsembleVectorPar, Data2Process);
        
        %% Appeding value's to y1VAl and y2Val.
        if idxTime == 1
          [y1Vals, y2Vals] = YaxisConstruct(ElementsToGoThrough,SelectedElement, T3, y1Vals, y2Vals);
        end
    
    end %end of Processor Loop
    end %end of Selected Element Loop
    i = i + 1;
end %end of time loop

fprintf(LogID,'\n');
fclose(LogID);

%% Graph Plotting
AutomatedGraphPlotting(x1Vals,y1Vals,y2Vals, ElementsToGoThrough, ProcessorsToProcessFrom, Data2Process)

end % end function