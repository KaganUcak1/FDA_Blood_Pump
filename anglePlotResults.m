%% Velocity Plot Comparision
% Last edit: 02.03.2023, Created: 02.03.2023
clc; clear all;

lw = "LineWidth";
fsize = "FontSize";
start = 25;
figure


myTableTry1 = table2array(readtable("angle3-1.txt"))';
myTableTry2 = table2array(readtable("angle3-2.txt"))';
myTableTry3 = table2array(readtable("angle3-3.txt"))';
%myTableTry4 = table2array(readtable("angle3-4.txt"))';
%myTableTry5 = table2array(readtable("condition2-5.txt"))';

plot(myTableTry1(:,2),myTableTry1(:,1),lw,2); hold on
plot(myTableTry2(:,2),myTableTry2(:,1),lw,2);
plot(myTableTry3(:,2),myTableTry3(:,1),lw,2);
%plot(myTableTry4(:,2),myTableTry4(:,1),lw,2);
%plot(myTableTry5(:,2),myTableTry5(:,1),lw,2);

figure

plot(myTableTry1(start:end-2,2)/max(myTableTry1(:,2)),myTableTry1(start:end-2,1)/max(myTableTry1(:,1)),"o-",lw,1.5); hold on
plot(myTableTry2(start:end-2,2)/max(myTableTry2(:,2)),myTableTry2(start:end-2,1)/max(myTableTry2(:,1)),"o-",lw,1.5);
plot(myTableTry3(start:end-2,2)/max(myTableTry3(:,2)),myTableTry3(start:end-2,1)/max(myTableTry3(:,1)),"o-",lw,1.5);
%plot(myTableTry4(start:end-2,2)/max(myTableTry4(:,2)),myTableTry4(start:end-2,1)/max(myTableTry4(:,1)),"o-",lw,1.5);
%plot(myTableTry5(23:end-2,2)/max(myTableTry5(:,2)),myTableTry5(23:end-2,1)/max(myTableTry5(:,1)),"o-",lw,1.5);
legend("Hariharan",fsize,15,"Location","northwest")
title("Nondimensional Velocity Comparision",fsize,15)
ylim([0.2 1.1]);xlim([0.2 1.1]);
nondimensionalPlotSettings


%% Standar Error Plot
% dataSet = [myTableTry1(24:end-2,1) myTableTry2(24:end-2,1) myTableTry3(24:end-2,1) myTableTry4(24:end-2,1) myTableTry5(24:end-2,1)];
hold on
%dataSet = [myTableTry1(start:end-2,1) myTableTry2(start:end-2,1) myTableTry3(start:end-2,1) myTableTry4(start:end-2,1)];
dataSet = [myTableTry1(start:end-2,1) myTableTry2(start:end-2,1) myTableTry3(start:end-2,1) ];

stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:)/max(dataSet(i,:)))/sqrt(length(dataSet(i,:)));
end
xAxis = myTableTry2(start:end-2,2)/max(myTableTry1(:,2));
avarageData = sum(dataSet')/length(dataSet(1,:));
hold on;
errorbar(xAxis,dataSet(:,2)/max(dataSet(:,2)),stdError,"o-",lw,1.5); 
legend("Angle1","Angle2","Angle4","Angle5","Angle2",fsize,15,"Location","northwest")
title("Nondimensional Velocity Comparision",fsize,15)
ylim([0.2 1.1]);xlim([0.2 1.1]);
nondimensionalPlotSettings