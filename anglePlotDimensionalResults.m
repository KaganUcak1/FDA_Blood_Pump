%% Velocity Plot Dimensional Comparision
% Last edit: 08.03.2023, Created: 08.03.2023
clc; clear all;

lw = "LineWidth";
fsize = "FontSize";
start = 26;
final = 4;
figure
%% Standar Error Plot 1
myTableTry1 = table2array(readtable("angle3-1.txt"))';
myTableTry2 = table2array(readtable("angle3-2.txt"))';
myTableTry3 = table2array(readtable("angle3-3.txt"))';

dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1)];
stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
xAxis = myTableTry2(start:end-final,2);
avarageData = sum(dataSet')/length(dataSet(1,:));
hold on;
errorbar(xAxis,dataSet(:,2),stdError,"o-",lw,1.5); 

%% Standar Error Plot 2
myTableTry1 = table2array(readtable("angle1-1.txt"))';
myTableTry2 = table2array(readtable("angle1-2.txt"))';
myTableTry3 = table2array(readtable("angle1-3.txt"))';
myTableTry4 = table2array(readtable("angle1-4.txt"))';


dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1) myTableTry4(start:end-final,1)];


stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
xAxis = myTableTry2(start:end-final,2);
hold on
errorbar(xAxis,dataSet(:,2),stdError,"o-",lw,1.5); 


%% Standar Error Plot 3
myTableTry1 = table2array(readtable("angle4-1.txt"))';
myTableTry2 = table2array(readtable("angle4-2.txt"))';
myTableTry3 = table2array(readtable("angle4-3.txt"))';
myTableTry4 = table2array(readtable("angle4-4.txt"))';
myTableTry5 = table2array(readtable("angle4-5.txt"))';

dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1) myTableTry4(start:end-final,1) myTableTry5(start:end-final,1)];

stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
xAxis = myTableTry2(start:end-final,2);
avarageData = sum(dataSet')/length(dataSet(1,:));
hold on;
errorbar(xAxis,dataSet(:,2),stdError,"o-",lw,1.5); 

%% Standar Error Plot 4
myTableTry1 = table2array(readtable("angle5-1.txt"))';
myTableTry2 = table2array(readtable("angle5-2.txt"))';
myTableTry3 = table2array(readtable("angle5-3.txt"))';
myTableTry4 = table2array(readtable("angle5-4.txt"))';
myTableTry5 = table2array(readtable("angle5-5.txt"))';

dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1) myTableTry4(start:end-final,1) myTableTry5(start:end-final,1)];

stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
xAxis = myTableTry2(start:end-final,2);
hold on;
errorbar(xAxis,dataSet(:,2),stdError,"o-",lw,1.5); 


%% Standar Error Plot 5
myTableTry1 = table2array(readtable("angle2-1.txt"))';
myTableTry2 = table2array(readtable("angle2-2.txt"))';
myTableTry3 = table2array(readtable("angle2-3.txt"))';
myTableTry4 = table2array(readtable("angle2-4.txt"))';
myTableTry5 = table2array(readtable("angle2-5.txt"))';

dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1) myTableTry4(start:end-final,1) myTableTry5(start:end-final,1)];

stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
xAxis = myTableTry2(start:end-final,2);
hold on;
errorbar(xAxis,dataSet(:,2),stdError,"o-",lw,1.5); 

legend("Angle 20","Angle 30","Angle 45","Angle 60","Angle 70",fsize,15,"Location","northwest")
title("Nondimensional Velocity Comparision",fsize,15)
% ylim([0.2 1.1]);xlim([0.2 1.1]);
dimensionalPlotSettings