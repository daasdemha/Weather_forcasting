% %% Plotting graphs in Matlab
% %% Show two plots on different y-axes
% %% 69,451 data processed
x1Vals = [1, 2, 3, 4, 5, 6, 7, 8]; % number of processors
y1Vals = [925, 510, 354, 270, 245, 236, 221, 212]; %% 69,451 data processed
figure(1)
tiledlayout(2,2)%creates a tiled chart layout for displaying multiple
                %plots in the current figure. 
yyaxis left
nexttile
plot(x1Vals, y1Vals, '-bd')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('69,451 Data')
nexttile %creates an axes object and places it into the next empty tile 
         %of the tiled chart layout that is in the current figure. 
bar(x1Vals,y1Vals,'r')%draws the columns of the M-by-N matrix Y as M groups of N
                   %vertical bars.
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('69,451 Data')


% %% 69,451 data processed
x2Vals = [4, 5, 6, 7, 8];
y12Vals = [270, 245, 236, 221, 212];
figure('Name','1.1','Color','white')
tiledlayout(2,2)
yyaxis left
nexttile
plot(x1Vals, y1Vals, '-bd')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('69,451 Data')
nexttile
plot(x2Vals, y12Vals, '-rd')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors','Removing the first 3 processors')
legend('69,451 Data')


% %% 69,451 * 4 data processed
y2Vals = [1080, 980, 944, 884, 848];
figure(2)
yyaxis left
 colors = ('#0000FF'); % Adds RGB colours
colororder(colors)  % The Order for the colours is decided
plot(x2Vals, y2Vals, '-d')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('277,804 Data')


% %% 69,451 * 4 * 25 data processed
y3Vals = [27000, 24500, 23600, 22100, 21200];
figure(3)
yyaxis left
plot(x2Vals, y3Vals, '-bd')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('6,945,100 (69,451 * 4 * 25) Data')

% %% 69,451 * 4 data processed vs 277,804
y4Vals = [3700,2040,1416,1080, 980, 944, 884, 848];
y4Vals2 = [3680, 2059, 1457, 1163, 925, 917, 813, 800];
figure(4)
yyaxis left
plot(x1Vals, y4Vals, '--r*')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
figure(4)
yyaxis right
plot(x1Vals, y4Vals2, ':bd')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('277,804 (69,451 * 4) Data', '277,804 Data')

% %% 69,451 * 4 data processed vs 277,804
figure(5)
tiledlayout(2,2)
yyaxis left
nexttile
plot(x1Vals, y4Vals, '--r*')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('277,804 (69,451 * 4) Data')
nexttile
plot(x1Vals, y4Vals2, ':bd')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('277,804 Data')

% %% 199 data processed vs 1396
y5Vals = [1.83, 1.20, 1.32, 1.18, 1.42, 1.48, 1.60, 1.84];
y5Vals5 = [13.90, 7.52, 5.61, 6.82, 6.21, 7.03, 7.30, 8.56];
figure(6)
tiledlayout(2,2)
yyaxis left
nexttile
plot(x1Vals, y5Vals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('199 Data')
nexttile
plot(x1Vals, y5Vals5, '-rd')
grid on;
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('1396 Data')

% %% 10000 data processed my computer vs matlab online
x3Vals = [1, 2, 3, 4];
y7Vals = [347, 178, 120, 119]; % elememnts measured using my pc
y7vals2 = [127, 66, 47, 42]; % elements measured using matlab online 
figure(7)
tiledlayout(2,2)
yyaxis left
nexttile
plot(x3Vals, y7Vals, '-bd')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processed using my computer','Processing time vs number of processors')
legend('10000 Data')
nexttile
plot(x3Vals, y7vals2, '-rd')
grid on; 
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processed using MATLAB online','Processing time vs number of processors')
legend('10000 Data')


% % figure(8)
% % Poly = polyfit(x2Vals,y2Vals,1); 
% % Poly2 = polyval(Poly,x2Vals);
% % plot(x2Vals, y2Vals, x2Vals, Poly2)
% %  colors = [0.8157 0.1255 0.5647  % Adds RGB colours
% %               0.1843 0.3098 0.3098
% %                ];
% % colororder(colors)  % The Order for the colours is decided
% % plot(x2Vals,y2Vals,x2Vals, Poly2, 'lineWidth',2); % plots the data 
% % grid on; 
% % hold on
% % title("Processing time vs number of processors"); 
% % legend('Location','northwest'); 
% % 
% % xlabel('Number of Processors'); 
% % ylabel('Processing time (s)'); 
% % legend('Our values','Average'); 

