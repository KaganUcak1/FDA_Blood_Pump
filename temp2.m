%% Nozzle Velocity Plot Dimensional Comparision
% Last edit: 27.03.2023, Created: 27.03.2023
clc; clear all; close all

lw = "LineWidth";
fsize = "FontSize";
xAxisScaling = 5/16;
start = 26;
final =6;

folderStruct = dir(pwd+"\_velocityProfiles");
folderList = {};
for i = 3:52
    path1 = convertCharsToStrings(folderStruct(i).folder);
    path2 = convertCharsToStrings(folderStruct(i).name);
    folderList{i-2} = path1+"\"+path2+"\B00001.txt";
end

yIdx = 0;
stdErrMatrix = zeros(25,9);
for j = [0 1] 
    f = figure;
    for i = 1:10:length(folderList)
        yIdx = yIdx+1;
        myTable1 =table2array(readtable(folderList{i+j}))';
        myTable2 =table2array(readtable(folderList{i+2+j}))';
        myTable3 =table2array(readtable(folderList{i+4+j}))';
        myTable4 =table2array(readtable(folderList{i+6+j}))';
        myTable5 =table2array(readtable(folderList{i+8+j}))';

        dataSet = [myTable1(:,1) myTable2(:,1) myTable3(:,1) myTable4(:,1) myTable5(:,1)];
        
        stdError = zeros(length(dataSet),1);
        for k = 1:length(dataSet)
            stdError(k) = std(dataSet(k,:))/sqrt(length(dataSet(k,:)));
            stdErrMatrix(k,yIdx) = stdError(k);
        end
        xAxis = myTable2(:,2)*xAxisScaling-myTable2(ceil(length(myTable2)/2),2)*xAxisScaling;
        avarageData = dataSet*[1;1;1;1;1]/5;
        hold on;
        if (i-1)/10 == 0
            errorbar(xAxis,avarageData,stdError,"o-","MarkerFaceColor","#0072BD",lw,1.5); 
        elseif (i-1)/10 == 1
            errorbar(xAxis,avarageData,stdError,"o-","MarkerFaceColor","#D95319",lw,1.5); 
        elseif (i-1)/10 == 2
            errorbar(xAxis,avarageData,stdError,"o-","MarkerFaceColor","#EDB120",lw,1.5); 
        elseif (i-1)/10 == 3
            errorbar(xAxis,avarageData,stdError,"o-","MarkerFaceColor","#7E2F8E",lw,1.5); 
        elseif (i-1)/10 == 4
            errorbar(xAxis,avarageData,stdError,"o-","MarkerFaceColor","#77AC30",lw,1.5); 
        end
        title("Velocity Profiles along the Nozzle Line "+j,fsize,13)
    end
end

