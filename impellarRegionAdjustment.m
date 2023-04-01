%% Impellar passage region relative velocity plotting
% Last edit: 27.03.2023, Created 26.03.2023, 
clear; clc

angularVelocity = 15.6; %hz

myTable = table2array(readtable("./_vectorField/Export_Date=230318_Time=160056nozzleAngleNew1-1/B00002.txt"));
img = imread('fdaRotorimage.png');

figure
subplot(1,2,1)
imageR = 27;
image('CData',img,'XData',[-imageR imageR],'YData',[-imageR imageR])
hold on
quiver(myTable(:,1)-1,-myTable(:,2)-16,myTable(:,3),-myTable(:,4),2)
axis equal
axis([-5 30 -30 5])
xScale = 103.78/1285;
ourScale = 0.054;

newTable = zeros(size(myTable));
for i=1:length(myTable)
    x = myTable(i,1)-1;
    y = -myTable(i,2)-16;
    r = sqrt(x^2+y^2);
    if r < 26 && x >2.08 && y<-2 && r>11.75
        bladeVelocityMagnitude = angularVelocity*r/1000*2*pi;
        angle = atan2(y,x);
        myTable(i,3) = myTable(i,3)/xScale*ourScale+bladeVelocityMagnitude*sin(angle);
        myTable(i,4) = myTable(i,4)/xScale*ourScale+bladeVelocityMagnitude*cos(angle);
        newTable(i,:) = [x,y,myTable(i,3),myTable(i,4)];
    elseif r>=26
        newTable(i,:) = [x,y,0,0];
    end
end


subplot(1,2,2)
image('CData',img,'XData',[-imageR imageR],'YData',[-imageR imageR])
hold on
quiver(newTable(:,1),newTable(:,2),newTable(:,3),-newTable(:,4),3,"r");
axis equal
axis([-5 30 -30 5])

%% single window
figure 
image('CData',img,'XData',[-imageR imageR],'YData',[-imageR imageR])
hold on
quiver(newTable(:,1),newTable(:,2),newTable(:,3),-newTable(:,4),5,"r","LineWidth",1.5);
axis equal
axis([-5 30 -30 5])

%% contour
% figure
% x = unique(myTable(:,1),'rows');
% y = unique(myTable(:,2),'rows');
% z = sqrt(myTable(:,3).^2+myTable(:,4).^2);
% Z = reshape(z,161,101)';
% 
% contourf(x(1:end),-y(1:end),Z,100,"LineColor","none")
% axis equal
% axis([0 33 -16 16])