function  InterpExtrap(x1Vals, y1Vals, y2Vals, ElementsToGoThrough, ProcessorsToProcessFrom, Data2Process)

%% calculating the mean for the x1Vals, Totaly1Vals and Totaly2Vals
MeanOfx1Vals = sum(x1Vals,'all')/ numel(x1Vals);
MeanOfy1Vals = sum(Totaly1Vals,'all')/ numel(Totaly1Vals);
MeanOfy2Vals = sum(Totaly2Vals,'all')/ numel(Totaly2Vals);

%% Time taken to analyise the whole data for y1Vals and y2Vals.
Totaly1Vals = [];
Totaly2Vals = [];
%% 1) x1Vals - MeanOfx1Vals
x1ValsMinusMean = [];
Totaly1ValsMinusMean = [];
Totaly2ValsMinusMean = [];

%% 2) Square of x1ValsMinusMean
x1ValsMinusMeanSquared = x1ValsMinusMean.^2;

%% 3) x1ValsMinusMean * Totaly1ValsMinusMean and x1ValsMinusMean * Totaly2ValsMinusMean
x1ValsMinusMeanTotaly1ValsMinusMean = [];
x1ValsMinusMeanTotaly2ValsMinusMean = [];

for EachInVals = 1 :length(x1Vals)
%% Time taken to analyise the whole data for y1Vals and y2Vals.   
Requiredy1Vals = round(25*(y1Vals(EachInVals)*(size(Data2Process,1)/ElementsToGoThrough(1))));
Requiredy2Vals = round(25*(y2Vals(EachInVals)*(size(Data2Process,1)/ElementsToGoThrough(2))));
Totaly1Vals(end+1) = Requiredy1Vals;
Totaly2Vals(end+1) = Requiredy2Vals;

%% x1Vals - MeanOfx1Vals
x1ValsMinusMean(end+1) = x1Vals(EachInVals) - MeanOfx1Vals;
Totaly1ValsMinusMean(end+1) = Totaly1Vals(EachInVals) - MeanOfy1Vals;
Totaly2ValsMinusMean(end+1) = Totaly2Vals(EachInVals) - MeanOfy2Vals;

%% x1ValsMinusMean * Totaly1ValsMinusMean and x1ValsMinusMean * Totaly2ValsMinusMean
x1ValsMinusMeanTotaly1ValsMinusMean(end+1) = x1ValsMinusMean(EachInVals)* Totaly1ValsMinusMean(EachInVals);
x1ValsMinusMeanTotaly2ValsMinusMean(end+1) = x1ValsMinusMean(EachInVals)* Totaly2ValsMinusMean(EachInVals);
end
%% getting the equation for the graph
b1 = x1ValsMinusMeanTotaly1ValsMinusMean/sum(x1ValsMinusMeanSquared,'all');
b2 = x1ValsMinusMeanTotaly2ValsMinusMean/sum(x1ValsMinusMeanSquared,'all');

b01 = MeanOfy1Vals + (-(b1*MeanOfx1Vals));
b02 = MeanOfy2Vals + (-(b1*MeanOfx1Vals));


end