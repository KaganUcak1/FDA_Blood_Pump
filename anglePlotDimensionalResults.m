%% Velocity Plot Dimensional Comparision
% Last edit: 20.04.2023, Created: 08.03.2023
clc; clear all;

lw = "LineWidth";
fsize = "FontSize";
start = 26;
final =6;
xAxisScaling = 25.3/55;

figure
%% Standar Error Plot 0
myTableTry1 = table2array(readtable("_figure4_data\condition2-1\B00001.txt"))';
myTableTry2 = table2array(readtable("_figure4_data\condition2-2\B00001.txt"))';
myTableTry3 = table2array(readtable("_figure4_data\condition2-3\B00001.txt"))';
myTableTry4 = table2array(readtable("_figure4_data\condition2-4\B00001.txt"))';
myTableTry5 = table2array(readtable("_figure4_data\condition2-5\B00001.txt"))';
start = start ; final = final+1 ;
dataSet = [myTableTry1(start:end-final,1) myTableTry2(start:end-final,1) myTableTry3(start:end-final,1) myTableTry4(start:end-final,1) myTableTry5(start:end-final,1)];

stdError = zeros(length(dataSet),1);
for i = 1:length(dataSet)
    stdError(i) = std(dataSet(i,:))/sqrt(length(dataSet(i,:)));
end
stdErrMatrix(:,3) = stdError; 
xAxis = myTableTry2(start:end-final,2)*xAxisScaling;
avarageData = dataSet*[1;1;1;1;1]/5;
hold on;
errorbar(xAxis+2*xAxisScaling,avarageData,stdError,"o-",lw,1.5); 
start = start ; final = final -1;

%% Standar Error Plot 1
myTableTry1 = table2array(readtable("_figure4_data\angle3-1\B00001.txt"))';
myTableTry2 = table2array(readtable("_figure4_data\angle3-2\B00001.txt"))';
myTableTry3 = table2array(readtable("_figure4_data\angle3-3\B00001.txt"))';
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
myTableTry1 = table2array(readtable("_figure4_data\angle1-1\B00001.txt"))';
myTableTry2 = table2array(readtable("_figure4_data\angle1-2\B00001.txt"))';
myTableTry3 = table2array(readtable("_figure4_data\angle1-3\B00001.txt"))';
myTableTry4 = table2array(readtable("_figure4_data\angle1-4\B00001.txt"))';

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
myTableTry1 = table2array(readtable("_figure4_data\angle4-1\B00001.txt"))';
myTableTry2 = table2array(readtable("_figure4_data\angle4-2\B00001.txt"))';
myTableTry3 = table2array(readtable("_figure4_data\angle4-3\B00001.txt"))';
myTableTry4 = table2array(readtable("_figure4_data\angle4-4\B00001.txt"))';
myTableTry5 = table2array(readtable("_figure4_data\angle4-5\B00001.txt"))';
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
myTableTry1 = table2array(readtable("_figure4_data\angle5-1\B00001.txt"))';
myTableTry2 = table2array(readtable("_figure4_data\angle5-2\B00001.txt"))';
myTableTry3 = table2array(readtable("_figure4_data\angle5-3\B00001.txt"))';
myTableTry4 = table2array(readtable("_figure4_data\angle5-4\B00001.txt"))';
myTableTry5 = table2array(readtable("_figure4_data\angle5-5\B00001.txt"))';
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
myTableTry1 = table2array(readtable("_figure4_data\angle2-1\B00001.txt"))';
myTableTry2 = table2array(readtable("_figure4_data\angle2-2\B00001.txt"))';
myTableTry3 = table2array(readtable("_figure4_data\angle2-3\B00001.txt"))';
myTableTry4 = table2array(readtable("_figure4_data\angle2-4\B00001.txt"))';
myTableTry5 = table2array(readtable("_figure4_data\angle2-5\B00001.txt"))';

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

%legend("20"+char(176),"30"+char(176),"45"+char(176),"60"+char(176),"70"+char(176),fsize,15,"Location","northwest")
legend("A","B","C","D","E","F",fsize,15,"Location","northwest")
title("Velocity Comparision",fsize,15)
ylim([1.0 2.3]);xlim([11.2 30]);
dimensionalPlotSettings