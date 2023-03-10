%% Velocity Plot Comparision
% Last edit: 11.03.2023, Created: 02.03.2023
clc; clear all; close all

fda = table2array(readtable("fdaFigureDataCondition2.txt"));
start = 24; final = 4;
lw = "LineWidth";
fsize = "FontSize";
figure
subplot(2,1,1)
plot(fda(:,1),fda(:,2),lw,2); hold on;

myTableTry1 = table2array(readtable("condition2-1.txt"))';
myTableTry2 = table2array(readtable("condition2-2.txt"))';
myTableTry3 = table2array(readtable("condition2-3.txt"))';
myTableTry4 = table2array(readtable("condition2-4.txt"))';
myTableTry5 = table2array(readtable("condition2-5.txt"))';

subplot(2,1,2)
plot(myTableTry1(:,2),myTableTry1(:,1),lw,2); hold on
plot(myTableTry2(:,2),myTableTry2(:,1),lw,2);
plot(myTableTry3(:,2)*2,myTableTry3(:,1),lw,2);
plot(myTableTry4(:,2),myTableTry4(:,1),lw,2);
plot(myTableTry5(:,2),myTableTry5(:,1),lw,2);

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
stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:)/max(dataSet(i,:)))/sqrt(length(dataSet(i,:)));
end
scaleFactor = 0.0242/52;
xAxis = myTableTry2(start:end-final,2)*scaleFactor;
avarageData = dataSet*[1;1;1;1;1]/5;
figure
plot(fda(:,1)/0.03,fda(:,2)/max(fda(:,2)),"o-",lw,1.5); hold on;
errorbar(xAxis/0.03,avarageData/max(avarageData),stdError,"o-",lw,1.5); 
legend("Hariharan","Ucak et.al.",fsize,15,"Location","northwest")
title("Nondimensional Velocity Comparision",fsize,15)
ylim([0.35 1.1]);xlim([0.3 1.03]);
nondimensionalPlotSettings