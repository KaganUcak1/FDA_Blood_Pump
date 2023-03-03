%% Velocity Plot Comparision
% Last edit: 22.02.2023, Created: 22.02.2023
clc; clear all; close all

fda = table2array(readtable("fdaFigureDataCondition2.txt"));

lw = "LineWidth";
fsize = "FontSize";
figure
subplot(2,1,1)
plot(fda(:,1),fda(:,2),lw,2); hold on;

myTableDt100 = table2array(readtable("dt100_16x16.txt"))';
myTableDt150 = table2array(readtable("dt150_16x16.txt"))';
myTableDt250 = table2array(readtable("dt250_32x32.txt"))';

subplot(2,1,2)
plot(myTableDt100(:,2),myTableDt100(:,1),lw,2); hold on
plot(myTableDt150(:,2),myTableDt150(:,1),lw,2);
plot(myTableDt250(:,2)*2,myTableDt250(:,1),lw,2);

figure
plot(fda(:,1)/0.03,fda(:,2)/max(fda(:,2)),"o-",lw,1.5); hold on;
plot(myTableDt100(:,2)/38,myTableDt100(:,1)/max(myTableDt100(:,1)),"o-",lw,1.5); hold on
plot(myTableDt150(:,2)/38,myTableDt150(:,1)/max(myTableDt150(:,1)),"o-",lw,1.5);
plot(myTableDt250(:,2)/19,myTableDt250(:,1)/max(myTableDt250(:,1)),"o-",lw,1.5);
legend("Hariharan", "dt100", "dt150", "dt250",fsize,15,"Location","northwest")
title("Nondimensional Velocity Comparision",fsize,15)
ylim([-0.1 1.1]);xlim([-0.1 1.1]);
nondimensionalPlotSettings