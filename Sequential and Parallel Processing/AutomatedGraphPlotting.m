function  AutomatedGraphPlotting(x1Vals, y1Vals,y2Vals, ElementsToGoThrough, ProcessorsToProcessFrom, Data2Process)
%Here the data is used from x1vals and y1Vals to plot a graph
% Show two plots on different y-axes
% first data processed used below

%% Pridicted time to analyise the whole data for y1Vals and y2Vals. 
[Totaly1Vals, Totaly2Vals] = YaxisFullValueConstruct(x1Vals, y1Vals,y2Vals, ElementsToGoThrough, Data2Process);

%% legend titles
TotalDataNum = size(Data2Process,1) * 25;
TotalData = append('Data ',string(TotalDataNum)); 
Data1 = append('Data ',string(ElementsToGoThrough(1)));

%% Plotting graph if only 1 processor is used with one dataset to analyse
if numel(ProcessorsToProcessFrom) == 1 && numel(ElementsToGoThrough) == 1
    figure(1)
    YaxisAndXaxisIfOnlyOneProcessor(x1Vals,y1Vals,Data1)
    
%% Plotting graph if only 1 processor is used with two dataset to analyse
elseif numel(ProcessorsToProcessFrom) == 1 && numel(ElementsToGoThrough) == 2
    Data2 = append('Data ',string(ElementsToGoThrough(2)));
    figure(1)
    YaxisAndXaxisIfOnlyOneProcessor(x1Vals,y1Vals,Data1)
    figure(2)
    YaxisAndXaxisIfOnlyOneProcessor(x1Vals,y2Vals,Data2)
    figure(3)
    YaxisAndXaxisMeanProcessingTime(x1Vals,y1Vals,y2Vals,ElementsToGoThrough(1),ElementsToGoThrough(2),Data1,Data2)

%% Ploting graph for given data and total data if one dataset is used and the processors are more then one
elseif numel(ElementsToGoThrough) == 1 && numel(ProcessorsToProcessFrom) > 1

    figure(1)
    YaxisAndXaxisScaleUp(x1Vals,y1Vals,Totaly1Vals,Data1,TotalData) 

    
    figure(2)
    YaxisAndXaxisAutoConstruct(x1Vals,Totaly1Vals,TotalData)
    
%% Ploting graph for given data and total data if two datasets are used and the processors are more then one
elseif numel(ProcessorsToProcessFrom) > 1 && numel(ElementsToGoThrough) == 2
    Data2 = append('Data ',string(ElementsToGoThrough(2)));
    
    figure(1)
    YaxisAndXaxisScaleUp(x1Vals,y1Vals,y2Vals,Data1,Data2)
    
    figure(2)
    YaxisAndXaxisMeanProcessingTime(x1Vals,y1Vals,y2Vals,ElementsToGoThrough(1),ElementsToGoThrough(2),Data1,Data2)

   
    figure(3)
    YaxisAndXaxisAutoConstruct(x1Vals,Totaly1Vals,TotalData)
    
    
    figure(4)
    YaxisAndXaxisAutoConstruct(x1Vals,Totaly2Vals,TotalData)
    
    figure(5)
    YaxisAndXaxisMeanProcessingTime(x1Vals,Totaly1Vals,Totaly2Vals,TotalDataNum,TotalDataNum,TotalData,TotalData)
  
end
end