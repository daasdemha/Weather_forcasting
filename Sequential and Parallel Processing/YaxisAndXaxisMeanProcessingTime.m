function  YaxisAndXaxisMeanProcessingTime(xVals,yVals,yVals2,DataVal1,DataVal2,legendtitle,legendtitle2)

y1MeanVals = yVals / DataVal1;
y2MeanVals = yVals2 / DataVal2;

plot(xVals, y1MeanVals, '-bd')
hold on
plot(xVals, y2MeanVals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend(legendtitle, legendtitle2)
hold off
end