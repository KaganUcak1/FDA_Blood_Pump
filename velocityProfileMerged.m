%% Nozzle Velocity Plot Dimensional Comparision
% Last edit: 11.03.2023, Created: 11.03.2023
clc; clear all; close all

%  nozzle2 > 30 degree 
%  nozzle3 > 45 degree
%  nozzle1 > 60 degree

lw = "LineWidth";
fsize = "FontSize";
xAxisScaling = 5/16;
start = 26;
final =6;

figure
yIdx = 1;
for k = ["15" "12-5" "10" ]
    yShift = [0 1 2];
    subplot(3,1,yIdx);
    for  i = ["2" "3" "1"]
        myTable1 =table2array(readtable("./nozzleLine10-12.5-15/nozzle"+i+"-1-"+k+".txt"))';
        myTable2 =table2array(readtable("./nozzleLine10-12.5-15/nozzle"+i+"-2-"+k+".txt"))';
        myTable3 =table2array(readtable("./nozzleLine10-12.5-15/nozzle"+i+"-3-"+k+".txt"))';
        myTable4 =table2array(readtable("./nozzleLine10-12.5-15/nozzle"+i+"-4-"+k+".txt"))';
        myTable5 =table2array(readtable("./nozzleLine10-12.5-15/nozzle"+i+"-5-"+k+".txt"))';

        dataSet = [myTable1(:,1) myTable2(:,1) myTable3(:,1) myTable4(:,1) myTable5(:,1)];
        
        stdError = zeros(length(dataSet),1);
        for j = 1:length(dataSet)
            stdError(j) = std(dataSet(j,:))/sqrt(length(dataSet(j,:)));
        end
        xAxis = myTable2(:,2)*xAxisScaling-myTable2(ceil(length(myTable2)/2),2)*xAxisScaling;
        avarageData = dataSet*[1;1;1;1;1]/5;
        hold on;
        if i == "1"
            errorbar(xAxis,avarageData,stdError,"bo-",lw,1.5); 
        elseif i == "2"
            errorbar(xAxis,avarageData,stdError,"ro-",lw,1.5); 
        elseif i == "3"
            errorbar(xAxis,avarageData,stdError,"ko-",lw,1.5); 
        end
        if yIdx == 1; 
            title("Velocity Profiles in The Nozzle",fsize,20); 
            legend("30"+char(176),"45"+char(176),"60"+char(176),fsize,13)
        end
    end
    xlim([-4 4]); ylabel("Velocity (m/s)");
    yIdx = yIdx +1;
end
box off
xlim([-4 4]); %ylim([-0.4 3]);
xlabel("Distance X (mm)");