%The Files that need to be tested
function  AutomatedErrorTesting(FilesToBeTested, DataFilesToBeTested)
% create new log file, 'w' replaces the file if present.
% To continually append, use 'a'
LogID2 = fopen('TestAnalysisLog.txt', 'a');
fprintf(LogID2,'Test recorded on: %s\n', datestr(now, 0)); %recording the 
%date and time of the test.
fprintf(LogID2,'\n');
fprintf(LogID2,'Testing for Text');
fprintf(LogID2,'\n');

for SingleFileToTest = FilesToBeTested % picking a file form our files list
TestText(LogID2, SingleFileToTest{1});%Testing one file at a time
end

fprintf(LogID2,'\n');
fprintf(LogID2,'Testing for NaN');
fprintf(LogID2,'\n');
for SingleDataFileToTest = DataFilesToBeTested % picking a file form our files list
TestNaN(LogID2, SingleDataFileToTest{1});%Testing one file at a time
fprintf(LogID2,'\n');
end
fclose(LogID2); %closing the logfile
end
