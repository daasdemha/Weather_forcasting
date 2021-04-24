function  AutomatedGraphPlotting(x1Vals, y1Vals,x2Vals,y2Vals, ElementsToGoThrough, ProcessorsToProcessFrom)
%Here the data is used from x1vals and y1Vals to plot a graph
% Show two plots on different y-axes
% first data processed used below

str1 = string(ElementsToGoThrough(1));
Data1 = append('Data ',str1);

x = 1:20;

if numel(ProcessorsToProcessFrom) == 1 && numel(ElementsToGoThrough) == 1
    figure(1)
    yyaxis left
    plot(x1Vals, y1Vals, '-bd')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    legend(Data1)
    
elseif numel(ElementsToGoThrough) == 1 && numel(ProcessorsToProcessFrom) > 1
    figure(1)
    tiledlayout(2,2)
    yyaxis left
    nexttile
    plot(x1Vals, y1Vals, '-bd')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    legend(Data1)
    %Here the data is used from x1vals and y1Vals to plot a graph
    %%Secound data entred processed and used below
    
    nexttile
    %% plot x and interpolated y values

    yInterp = interp1(x1Vals,y1Vals,x,'linear','extrap');
    %plot poriginal data
    plot(x1Vals, y1Vals, '--rx')

    % plot interpolated values
    hold on
    plot(x, yInterp, '-xb')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    legend(Data1)
    hold off
    

elseif numel(ProcessorsToProcessFrom) == 1 && numel(ElementsToGoThrough) == 2
    str2 = string(ElementsToGoThrough(2));
    Data2 = append('Data ',str2);
    figure(1)
    yyaxis left
    plot(x1Vals, y1Vals, '-bd')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    %Here the data is used from x1vals and y1Vals to plot a graph
    %%Secound data entred processed and used below
    legend(Data1)
    
    figure(1)
    yyaxis left
    plot(x2Vals, y2Vals, '-rx')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    legend(Data2)
    
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
    
    
elseif numel(ElementsToGoThrough) == 2 && numel(ProcessorsToProcessFrom) > 1

    str2 = string(ElementsToGoThrough(2));
    Data2 = append('Data ',str2);
    
    figure(1)
    tiledlayout(2,2)
    yyaxis left
    
    nexttile
    plot(x1Vals, y1Vals, '-bd')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    %Here the data is used from x1vals and y1Vals to plot a graph
    %%Secound data entred processed and used below
    legend(Data1)
    
    nexttile
    %% plot x and interpolated y values

    yInterp = interp1(x1Vals,y1Vals,x,'linear','extrap');
    %plot poriginal data
    plot(x1Vals, y1Vals, '--rx')

    % plot interpolated values
    hold on
    plot(x, yInterp, '-xb')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    legend(Data1)
    hold off
    
    
    figure(2)
    tiledlayout(2,2)
    yyaxis left
    
    nexttile
    plot(x2Vals, y2Vals, '-rx')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    legend(Data2)
    
    nexttile
    %% plot x and interpolated y values

    yInterp = interp1(x2Vals,y2Vals,x,'linear','extrap');
    %plot poriginal data
    plot(x2Vals, y2Vals, '--rx')

    % plot interpolated values
    hold on
    plot(x, yInterp, '-xb')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Processing time vs number of processors')
    legend(Data2)
    hold off

    %% Show two plots on same y-axis
    %% Mean processing time
    y1MeanVals = y1Vals / ElementsToGoThrough(1);
    y2MeanVals = y2Vals / ElementsToGoThrough(2);

    figure(3)
    plot(x1Vals, y1MeanVals, '-bd')
    hold on
    plot(x2Vals, y2MeanVals, '-rx')
    xlabel('Number of Processors')
    ylabel('Processing time (s)')
    title('Mean Processing time vs number of processors')
    legend(Data1, Data2);



end
end