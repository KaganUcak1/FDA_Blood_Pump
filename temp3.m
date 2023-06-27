clc;clear

data = [1.2	560
        1.6	640
        2	870
        2.4	1030];
x = data(1,1):0.05:data(end,1);
y = spline(data(:,1),data(:,2),x);

plot(data(:,1),data(:,2),"ro","LineWidth",2);hold on
plot(x,y,"-","LineWidth",1.5); grid on; xlabel("Flow rate (LPM)"); ylabel("Turbine Speed (RPM)");
title("iATVA Experiment 1","FontSize",20)
