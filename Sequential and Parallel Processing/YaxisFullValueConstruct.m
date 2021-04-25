function  [Totaly1Vals, Totaly2Vals] = YaxisFullValueConstruct(x1Vals, y1Vals,y2Vals, ElementsToGoThrough, Data2Process)

%% Pridicted time to analyise the whole data for y1Vals and y2Vals. 
Totaly1Vals = [];
Totaly2Vals = [];


if numel(ElementsToGoThrough)== 1
for EachInVals = 1 :length(y1Vals)
%% Pridicted time to analyise the whole data for y1Vals and y2Vals.   
Totaly1Vals(end+1) = round(25*(y1Vals(EachInVals)*(size(Data2Process,1)/ElementsToGoThrough(1))));
end
elseif numel(ElementsToGoThrough)== 2
for EachInVals = 1 :length(x1Vals)
%% Pridicted time to analyise the whole data for y1Vals and y2Vals.   
Totaly1Vals(end+1) = round(25*(y1Vals(EachInVals)*(size(Data2Process,1)/ElementsToGoThrough(1))));
Totaly2Vals(end+1) = round(25*(y2Vals(EachInVals)*(size(Data2Process,1)/ElementsToGoThrough(2))));
end
end
end