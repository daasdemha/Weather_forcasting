function  YaxisAndXaxisAutoConstruct(xVals,TotalVals,legendtitle)
%% constructing a plot to determine the required processors needed.
i = 1;
x = [];
yyaxis left
scatter(xVals,TotalVals,25,'b','*')
P = polyfit(xVals,TotalVals,1);
while i > 0
x(end+1)= i;
i = i + 1;
if round(P(1)*x(end)+P(2)) < 7200
    i = 0;
end
end
yfit = P(1)*x+P(2);
hold on;
plot(x,yfit,'r.-.');
text(x(end), yfit(end),'Required processors \rightarrow', ...
 'HorizontalAlignment', 'right', 'Color', 'red', 'FontName', 'Times')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend(legendtitle, 'Liner regression')
hold off
end