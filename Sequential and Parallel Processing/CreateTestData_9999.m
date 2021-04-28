function CreateTestData_9999(OriginalFileName, NewFileName)
%% Replaces one hours worth of data with -9999
copyfile(OriginalFileName, NewFileName);

C = ncinfo(NewFileName);
ModelNames = {C.Variables(1:8).Name};


%% Change data to -9999
BadData = [700,400,-9999];

%% Write to *.nc file
Hour2Replace = 12;
for idx = 1:8
    ncwrite(NewFileName, ModelNames{idx}, BadData, [1, 1, Hour2Replace]);
end

end