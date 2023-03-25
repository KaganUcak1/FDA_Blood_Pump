%% Velocity Plot Comparision
% Last edit: 11.03.2023, Created: 02.03.2023
clc; clear all; close all

fda = table2array(readtable("fdaFigureDataCondition2.txt"));
start = 24; final = 4;
lw = "LineWidth";
fsize = "FontSize";

myTableTry1 = table2array(readtable("condition2-1.txt"))';
myTableTry2 = table2array(readtable("condition2-2.txt"))';
myTableTry3 = table2array(readtable("condition2-3.txt"))';
myTableTry4 = table2array(readtable("condition2-4.txt"))';
myTableTry5 = table2array(readtable("condition2-5.txt"))';

figure
plot(fda(:,1)/0.03,fda(:,2)/max(fda(:,2)),"o-",lw,1.5); hold on;

plot(myTableTry1(start:end-final,2)/max(myTableTry1(:,2)),myTableTry1(start:end-final,1)/max(myTableTry1(:,1)),"o-",lw,1.5); hold on
plot(myTableTry2(start:end-final,2)/max(myTableTry2(:,2)),myTableTry2(start:end-final,1)/max(myTableTry2(:,1)),"o-",lw,1.5);
plot(myTableTry3(start:end-final,2)/max(myTableTry3(:,2)),myTableTry3(start:end-final,1)/max(myTableTry3(:,1)),"o-",lw,1.5);
plot(myTableTry4(start:end-final,2)/max(myTableTry4(:,2)),myTableTry4(start:end-final,1)/max(myTableTry4(:,1)),"o-",lw,1.5);
plot(myTableTry5(start:end-final,2)/max(myTableTry5(:,2)),myTableTry5(start:end-final,1)/max(myTableTry5(:,1)),"o-",lw,1.5);
legend("Hariharan",fsize,15,"Location","northwest")
title("Nondimensional Velocity Comparision",fsize,15)
ylim([0.2 1.1]);xlim([0.2 1.1]);
nondimensionalPlotSettings


%% Standar Error Plot
dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1) myTableTry4(start:end-final,1) myTableTry5(start:end-final,1)];
dataSetNormal = dataSet./(max(dataSet));
stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSetNormal(i,:))/sqrt(length(dataSet(i,:)));
end
scaleFactor = 0.0242/52;
xAxis = myTableTry2(start:end-final,2)*scaleFactor;
avarageData = dataSet*[1;1;1;1;1]/5;

normalFDA = [fda(:,1)/0.03,fda(:,2)/max(fda(:,2))];
normalUCAK = [xAxis/0.03,avarageData/max(avarageData)];

figure
plot(normalFDA(:,1),normalFDA(:,2),"o-",lw,1.5); hold on;
errorbar(normalUCAK(:,1),normalUCAK(:,2),stdError,"o-",lw,1.5); 
legend("Hariharan","Ucak et.al.",fsize,15,"Location","northwest")
title("Nondimensional Velocity Comparision",fsize,15)
ylim([0.35 1.1]);xlim([0.3 1.03]);
nondimensionalPlotSettings

x = 0.36:0.01:0.97;
interpFDA = interp1(fda(:,1)/0.03,fda(:,2)/max(fda(:,2)),x);
interpUCAK = interp1(xAxis/0.03,avarageData/max(avarageData),x);
interpStdErr = interp1(xAxis/0.03,stdError,x);
idx = find(interpFDA == max(interpFDA));
coef0 = corrcoef(interpFDA,interpUCAK)
coef1 = corrcoef(interpFDA(1:idx),interpUCAK(1:idx))
figure
plot(interpFDA(1:idx),interpUCAK(1:idx),lw,1.5); hold on;
coef2 = corrcoef(interpFDA(idx:end),interpUCAK(idx:end))
plot(interpFDA(idx:end),interpUCAK(idx:end),lw,1.5)
title("Coefficient of Correlation")