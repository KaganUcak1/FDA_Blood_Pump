%% Velocity Plot Dimensional Comparision
% Last edit: 11.03.2023, Created: 08.03.2023
clc; clear all;

lw = "LineWidth";
fsize = "FontSize";
start = 26;
final =6;
xAxisScaling = 24.3/55;

figure
%% Standar Error Plot 1
myTableTry1 = table2array(readtable("angle3-1.txt"))';
myTableTry2 = table2array(readtable("angle3-2.txt"))';
myTableTry3 = table2array(readtable("angle3-3.txt"))';
final =final+1; start = start +1;
dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1)];
stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
stdErrMatrix(:,1) = stdError; 
xAxis = myTableTry2(start:end-final,2)*xAxisScaling;
avarageData = dataSet*[1;1;1]/3;
hold on;
errorbar(xAxis+1*xAxisScaling,avarageData,stdError,"o-",lw,1.5); 
final =final-1;  start = start -1; 
%% Standar Error Plot 2
myTableTry1 = table2array(readtable("angle1-1.txt"))';
myTableTry2 = table2array(readtable("angle1-2.txt"))';
myTableTry3 = table2array(readtable("angle1-3.txt"))';
myTableTry4 = table2array(readtable("angle1-4.txt"))';

final =final+1; start = start+1;
dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1) myTableTry4(start:end-final,1)];


stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
stdErrMatrix(:,2) = stdError; 
xAxis = myTableTry2(start:end-final,2)*xAxisScaling;
avarageData = dataSet*[1;1;1;1]/4;
hold on
errorbar(xAxis+1*xAxisScaling,avarageData,stdError,"o-",lw,1.5); 

final =final-1; start = start+1;
%% Standar Error Plot 3
myTableTry1 = table2array(readtable("angle4-1.txt"))';
myTableTry2 = table2array(readtable("angle4-2.txt"))';
myTableTry3 = table2array(readtable("angle4-3.txt"))';
myTableTry4 = table2array(readtable("angle4-4.txt"))';
myTableTry5 = table2array(readtable("angle4-5.txt"))';
start = start +1; final = final -1;
dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1) myTableTry4(start:end-final,1) myTableTry5(start:end-final,1)];

stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
stdErrMatrix(:,3) = stdError; 
xAxis = myTableTry2(start:end-final,2)*xAxisScaling;
avarageData = dataSet*[1;1;1;1;1]/5;
hold on;
errorbar(xAxis-1*xAxisScaling,avarageData,stdError,"o-",lw,1.5); 
start = start -1; final = final +1;
%% Standar Error Plot 4
myTableTry1 = table2array(readtable("angle5-1.txt"))';
myTableTry2 = table2array(readtable("angle5-2.txt"))';
myTableTry3 = table2array(readtable("angle5-3.txt"))';
myTableTry4 = table2array(readtable("angle5-4.txt"))';
myTableTry5 = table2array(readtable("angle5-5.txt"))';
final =final+1;
dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1) myTableTry4(start:end-final,1) myTableTry5(start:end-final,1)];

stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
stdErrMatrix(:,4) = stdError; 
xAxis = myTableTry2(start:end-final,2)*xAxisScaling;
avarageData = dataSet*[1;1;1;1;1]/5;
hold on;
errorbar(xAxis,avarageData,stdError,"o-",lw,1.5); 
final =final-1;

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
stdErrMatrix(:,5) = stdError; 
xAxis = myTableTry2(start:end-final,2)*xAxisScaling;
avarageData = dataSet*[1;1;1;1;1]/5;
hold on;
errorbar(xAxis,avarageData,stdError,"o-",lw,1.5); 

legend("20"+char(176),"30"+char(176),"45"+char(176),"60"+char(176),"70"+char(176),fsize,15,"Location","northwest")
title("Velocity Comparision",fsize,15)
ylim([1.6 3.2]);xlim([11.2 28]);
dimensionalPlotSettings