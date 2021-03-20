%% Script to examine NetCDF data formats and check for non-numeric values (chars only)

%% Data to test 
function TestText(FileName)% define our test file as function

%% Define plain text variable types
DataTypes = {'NC_Byte', 'NC_Char', 'NC_Short', 'NC_Int', 'NC_Float', 'NC_Double'};

%% Test a good file
%% Set file to tes

Contents = ncinfo(FileName); % Store the file content information in a variable.
FileID = netcdf.open(FileName,'NC_NOWRITE'); % open file read only and create handle

for idx = 0:size(Contents.Variables,2)-1 % loop through each variable
    % read data type for each variable and store
    [~, datatype(idx+1), ~, ~] = netcdf.inqVar(FileID,idx);
end

%% display data types
DataInFile = DataTypes(datatype);

%% find character data types
FindText = strcmp('NC_Char', DataInFile);

%% Create and open log file
% create new log file, 'w' replaces the file if present. To continually
% append, use 'a'
LogID = fopen('AnalysisLog.txt', 'a');

%% print results
fprintf('Testing file: %s\n', FileName)
if any(FindText)
    fprintf('Error, text variables present:\n')
   % Write to log file
    fprintf(LogID, 'Text variables present in %s\n', FileName);
else
    fprintf('All data is numeric, continue analysis.\n')
    % Write to log file
    fprintf(LogID, 'All data is numeric in %s\n', FileName);
end

fclose(LogID);
end
