%% Nozzle Velocity Plot Dimensional Comparision V2
% Last edit: 02.04.2023, Created: 11.03.2023
clc; clear all;


lw = "LineWidth";
fsize = "FontSize";
xAxisScaling = 5/16;

figure
yIdx = 1;
for k = [ "" "_01" "_02" ]
    yShift = [0 1 2];
%     subplot(3,1,yIdx);
    for  i = ["A-2" "C" "B" "D" "E" "F"]
        myTable1 =table2array(readtable("./_nozzleLines24-26-30mm/exp4-angle"+i+"-1"+k+"/B00001.txt"))';
        myTable2 =table2array(readtable("./_nozzleLines24-26-30mm/exp4-angle"+i+"-2"+k+"/B00001.txt"))';
        myTable3 =table2array(readtable("./_nozzleLines24-26-30mm/exp4-angle"+i+"-3"+k+"/B00001.txt"))';
        myTable4 =table2array(readtable("./_nozzleLines24-26-30mm/exp4-angle"+i+"-4"+k+"/B00001.txt"))';
        myTable5 =table2array(readtable("./_nozzleLines24-26-30mm/exp4-angle"+i+"-5"+k+"/B00001.txt"))';
        if i == "C"
            myTable2 = [0 0; myTable3];
            myTable4 = [0 0; 0 0; myTable4];
            myTable5 = [0 0; 0 0; myTable5];
        end
        idx = find(abs(myTable1(:,1))>0);
        
        dataSet = [myTable1(idx,1) myTable2(idx,1) myTable3(idx,1) myTable4(idx,1) myTable5(idx,1)];
        
        stdError = zeros(length(dataSet),1);
        for j = 1:length(dataSet)
            stdError(j) = std(dataSet(j,:))/sqrt(length(dataSet(j,:)));
        end
        xAxis = myTable2(idx,2)*xAxisScaling-myTable2(ceil(length(myTable2)/2),2)*xAxisScaling;
        if i == "D" || i =="E" || i == "F"
            xAxis = xAxis + 3*(xAxis(2)-xAxis(1));
        elseif i == "C"
            xAxis = xAxis + 2*(xAxis(2)-xAxis(1));
        end
        avarageData = dataSet*[1;1;1;1;1]/5;
        hold on;
        if i =="A-2" 
            errorbar(xAxis,avarageData+yShift(yIdx),stdError,"bo-",lw,1.5); 
        elseif i == "B" 
            errorbar(xAxis,avarageData+yShift(yIdx),stdError,"ro-",lw,1.5); 
        elseif i == "C" 
            errorbar(xAxis,avarageData+yShift(yIdx),stdError,"ko-",lw,1.5); 
        elseif i == "D" 
            errorbar(xAxis,avarageData+yShift(yIdx),stdError,"yo-",lw,1.5); 
        elseif i == "E"
            errorbar(xAxis,avarageData+yShift(yIdx),stdError,"mo-",lw,1.5); 
        elseif i == "F"
            errorbar(xAxis,avarageData+yShift(yIdx),stdError,"co-",lw,1.5); 
        end
        if yIdx == 1 
            title("Velocity Profiles in The Nozzle",fsize,20); 
        end
    end
%     xlim([-4 4]); ylabel("Velocity (m/s)");
    yIdx = yIdx +1;
end
legend(["A" "B" "C" "D" "E" "F"],fsize,13)
box off
% xlim([-4 4]); %ylim([-0.4 3]);
xlabel("Distance X (mm)");