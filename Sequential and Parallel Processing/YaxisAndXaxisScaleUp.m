function  YaxisAndXaxisScaleUp(xVals,yVals,yVals2,legendtitle,legendtitle2)    
tiledlayout(2,2)
yyaxis left
nexttile
plot(xVals, yVals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend(legendtitle)    
nexttile
plot(xVals, yVals2, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Total Data','Processing time vs number of processors')
legend(legendtitle2)
end