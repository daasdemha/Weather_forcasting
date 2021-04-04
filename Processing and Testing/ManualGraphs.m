%% Plotting graphs in Matlab
%% Show two plots on different y-axes
%% 10,000 data processed
x1Vals = [1, 2, 3, 4, 5, 6, 7, 8];
y1Vals = [122, 64, 49, 44, 37, 38, 33, 34];
figure(1)
yyaxis left
plot(x1Vals, y1Vals, '-bd')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')


%% 69,451 data processed
x2Vals = [1, 2, 3, 4, 5, 6, 7, 8];
y2Vals = [925, 510, 354, 270, 245, 236, 221, 212];
figure(1)
yyaxis right
plot(x2Vals, y2Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

legend('10,000 Data', '69,451 Data')


%% Show two plots on same y-axis
%% Mean processing time
y1MeanVals = y1Vals / 69451;
y2MeanVals = y2Vals / 10000;

figure(2)
plot(x1Vals, y1MeanVals, '-bd')
grid on; 
hold on
plot(x2Vals, y2MeanVals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend('10,000 Data', '69,451 Data')

figure(3)
Poly = polyfit(x2Vals,y2Vals,2); 
Poly2 = polyval(Poly,x2Vals);
plot(x2Vals, y2Vals, x2Vals, Poly2)
 colors = [0.8157 0.1255 0.5647  % Adds RGB colours
              0.1843 0.3098 0.3098
               ];
colororder(colors)  % The Order for the colours is decided
plot(x2Vals,y2Vals,x2Vals, Poly2, 'lineWidth',2); % plots the data 
grid on; 
hold on
title("Processing time vs number of processors"); 
legend('Location','northwest'); 

xlabel('Number of Processors'); 
ylabel('Processing time (s)'); 
legend('Our values','Average'); 


