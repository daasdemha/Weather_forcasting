
clear all % clear all variables
close all % close all windows
%The Files that need to be tested
FilesToBeTested = {'../Model/TestFileText.nc', '../Model/o3_surface_20180701000000.nc'};

% create new log file, 'w' replaces the file if present.
% To continually append, use 'a'
LogID = fopen('AnalysisLog.txt', 'a');
fprintf(LogID,'Test recorded on: %s\n', datestr(now, 0)); %recording the 
%date and time of the test.

for SingleFileToTest = FilesToBeTested % picking a file form our files list
TestText(SingleFileToTest{1});%Testing one file at a time
end


fprintf(LogID,'\n');
fclose(LogID); %closing the logfile




