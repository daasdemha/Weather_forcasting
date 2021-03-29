function  AutomatedGraphPlotting(x1Vals, y1Vals,x2Vals,y2Vals, ElementsToGoThrough)
%Here the data is used from x1vals and y1Vals to plot a graph
% Show two plots on different y-axes
% first data processed used below

str1 = string(ElementsToGoThrough(1));

if numel(ElementsToGoThrough) == 1
    figure(1)
    yyaxis left
    plot(x1Vals, y1Vals, '-bd')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    %Here the data is used from x1vals and y1Vals to plot a graph
    %%Secound data entred processed and used below
else
    str2 = string(ElementsToGoThrough(2));

    Data1 = append('Data ',str1);
    Data2 = append('Data ',str2);

    figure(1)
    yyaxis left
    plot(x1Vals, y1Vals, '-bd')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    %Here the data is used from x1vals and y1Vals to plot a graph
    %%Secound data entred processed and used below
    figure(1)
    yyaxis right
    plot(x2Vals, y2Vals, '-rx')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')



    legend(Data1, Data2);

    %% Show two plots on same y-axis
    %% Mean processing time
    y1MeanVals = y1Vals / ElementsToGoThrough(1);
    y2MeanVals = y2Vals / ElementsToGoThrough(2);

    figure(2)
    plot(x1Vals, y1MeanVals, '-bd')
    hold on
    plot(x2Vals, y2MeanVals, '-rx')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Mean Processing time vs number of processors')
    legend(Data1, Data2);



end
end