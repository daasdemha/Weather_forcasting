function  YaxisAndXaxisIfOnlyOneProcessor(xVals,yVals,legendtitle)
%% Plotting graph with only xVals and yVals given.
yyaxis left
plot(xVals, yVals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend(legendtitle)
end