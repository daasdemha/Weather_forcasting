%% Script to examine NetCDF data formats and check for NaN
% Note, you would carry out this test each time you load data.
% You should NOT test the whole file at the start
function TestNaN(LogID2, DataFileName)% define our test file as function
fprintf(LogID2,'Testing file %s', DataFileName);
fprintf(LogID2,'\n');
%% Test File with Errors
NaNErrors = 0;
%% Set file to test
Contents = ncinfo(DataFileName); % Store the file content information in a variable.

StartLat = 1;
StartLon = 1;

fprintf('Testing files: %s\n', DataFileName)
for idxHour = 1:25
    
    for idxModel = 1:8
        Data(idxModel,:,:) = ncread(DataFileName, Contents.Variables(idxModel).Name,...
            [StartLat, StartLon, idxHour], [inf, inf, 1]); % 'inf' reads all the data
    end
    
    % check for NaNs
    if any(isnan(Data), 'All')
        NaNErrors = 1;
        %% display warning
        fprintf('NaNs present\n')
        ErrorModel = find(isnan(Data), 1, 'first');
        %% find first error:
        fprintf('Analysis for hour %i is invalid, NaN errors recorded in model %s\n',...
            idxHour, Contents.Variables(ErrorModel).Name)
        
        % Write to log file
        fprintf(LogID2,'\n');
        fprintf(LogID2, 'NaN Error Present in  %s at hour %i\n',DataFileName, idxHour);
        fprintf(LogID2,'\n');
    else
        % write to log file
        fprintf(LogID2, 'No Error Present in %s  at hour %i\n',DataFileName, idxHour);
    end   
end
if ~NaNErrors
    fprintf('No errors!\n')
end