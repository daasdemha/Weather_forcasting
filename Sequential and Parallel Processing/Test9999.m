%% Script to examine NetCDF data formats and check for -9999
% Note, you would carry out this test each time you load data.
% You should NOT test the whole file at the start
function [SkipHours9999] =  Test9999(LogID2,FileName, DataFileName)% define our test file as function
fprintf(LogID2,'Testing file %s', DataFileName);
fprintf(LogID2,'\n');
%% Test File with Errors
Errors9999 = 0;
%% Set file to test
Contents = ncinfo(DataFileName); % Store the file content information in a variable.
SkipHours9999 = [];
StartLat = 1;
StartLon = 1;

fprintf('Testing files: %s\n', DataFileName)
for idxHour = 1:25
    
    for idxModel = 1:8
        Data(idxModel,:,:) = ncread(DataFileName, Contents.Variables(idxModel).Name,...
            [StartLat, StartLon, idxHour], [inf, inf, 1]); % 'inf' reads all the data
    end
    
    % check for NaNs
    if any(Data==-9999, 'All') 
        Errors9999 = 1;
        %% display warning
        fprintf('-9999 present\n')
        %% find first error:
        fprintf('-9999 present during hour %i\n', idxHour)
        
        % Write to log file
        fprintf(LogID2,'\n');
        fprintf(LogID2, '-9999 Error Present in  %s at hour %i\n',DataFileName, idxHour);
        fprintf(LogID2,'\n');
        
        %% to remove the hour the error occured from the main code
        if strcmp(DataFileName,FileName)
            SkipHours9999(end+1) = idxHour;
        end
    else
        % write to log file
        fprintf(LogID2, 'No -9999 Error Present in %s  at hour %i\n',DataFileName, idxHour);
    end   
end
if ~Errors9999
    fprintf('No errors!\n')
end