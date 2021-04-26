function  YaxisAndXaxisSequentialVsParallel(xVals,TotalVals)
yyaxis left
bar(xVals(1), TotalVals(1), 'b')
hold on;
bar(xVals(2:end),TotalVals(2:end),'r');
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('Sequential processing', 'Parallel processing')
hold off
end