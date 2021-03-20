%% Plotting graphs in Matlab
clear all
close all
%if the user would like to plot graphs on a later date they can by entring
%the values of time of processors and time taken to complete the task.
%in the x1Vals and y1Vals below
%% Show two plots on different y-axes
%% 250 data processed
x1Vals = [1, 2, 3, 4, 5, 6]; %Number of processors used
y1Vals = [95.52, 39.00, 47, 44, 40, 39];%The Time taken
figure(1)
yyaxis left
plot(x1Vals, y1Vals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')


%% 5,000 data processed
x2Vals = [2, 3, 4, 5, 6, 7, 8];
y2Vals = [1560, 1077, 945, 838, 852, 725, 707];
figure(1)
yyaxis right
plot(x2Vals, y2Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

legend('250 Data', '5,000 Data')


%% Show two plots on same y-axis
%% Mean processing time
y1MeanVals = y1Vals / 250;
y2MeanVals = y2Vals / 5000;

figure(2)
plot(x1Vals, y1MeanVals, '-bd')
hold on
plot(x2Vals, y2MeanVals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend('250 Data', '5,000 Data')