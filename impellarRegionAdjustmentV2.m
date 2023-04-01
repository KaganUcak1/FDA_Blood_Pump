%% Impellar passage region relative velocity plotting
% Last edit: 27.03.2023, Created 26.03.2023, 
clear; clc; close all

angularVelocity = 15.6; %hz
rotationAngles = [0 -11 -17 -50 -68 -73];
z = 0;
for k = ["A", "B", "C", "D", "E", "F"]
z = z+1;
if z == 1 
    xShift= -1; yShift = -16; axisArray = [-5 30 -27 10];
elseif z == 2
    xShift= -1; yShift = -16; axisArray = [-5 30 -27 10];
elseif z == 3
    xShift= -1; yShift = -16; axisArray = [-5 30 -27 10];
elseif z == 6
    xShift= -3; yShift = 7; axisArray = [-5 30 -10 28];
elseif z == 5
    xShift= -1; yShift = 0; axisArray = [-5 30 -13 25];
else
    xShift= -1.5; yShift = -0.5; axisArray = [-5 30 -18 21];
end
myTable = table2array(readtable("./_vectorFieldImpellarInside/Export_Date=230308_angle"+k+"/B00001.txt"));
img = imread('fdaRotorimage.png');
img =imrotate(img,rotationAngles(z),"bilinear","crop");
f1 = figure;
subplot(1,2,1)
imageR = 26.5;
image('CData',img,'XData',[-imageR imageR],'YData',[-imageR imageR])
hold on
quiver(myTable(:,1)+xShift,-myTable(:,2)+yShift,myTable(:,3),-myTable(:,4))
circle(0,0,11.75);circle(0,0,26);circle(0,0,29.5);
axis equal;axis(axisArray)
title("Angle " +k);
xScale = 103.78/1285;
ourScale = 0.054;

newTable = zeros(size(myTable));
contourTable = zeros(size(myTable));
for i=1:length(myTable)    
    x = myTable(i,1)+xShift;
    y = -myTable(i,2)+yShift;
    r = sqrt(x^2+y^2);
    contourTable(i,:) = [x,y,0,0];
    newTable(i,:) = [x,y,0,0];
    if r < 26 && r>11.75 && (myTable(i,3) ~=0 || myTable(i,4) ~=0)
        bladeVelocityMagnitude = angularVelocity*r/1000*2*pi;
        angle = atan2(y,x);
        myTable(i,3) = myTable(i,3)/xScale*ourScale+bladeVelocityMagnitude*sin(angle);
        myTable(i,4) = -myTable(i,4)/xScale*ourScale-bladeVelocityMagnitude*cos(angle);
        newTable(i,:) =     [x,y,myTable(i,3),myTable(i,4)];
        contourTable(i,:) = [x,y,myTable(i,3),myTable(i,4)];
    elseif r>=26
        newTable(i,:) = [x,y,0,0];
    end
end

subplot(1,2,2)
image('CData',img,'XData',[-imageR imageR],'YData',[-imageR imageR])
hold on
quiver(newTable(:,1),newTable(:,2),newTable(:,3),newTable(:,4),"r");
axis equal;axis(axisArray)
title("Angle " +k);

%% single window
figure 
image('CData',img,'XData',[-imageR imageR],'YData',[-imageR imageR])
hold on
arrowDensity = 1;
quiver(newTable(1:arrowDensity:end,1),newTable(1:arrowDensity:end,2),newTable(1:arrowDensity:end,3),newTable(1:arrowDensity:end,4),2,"r","LineWidth",1);
axis equal;axis(axisArray)
title("Angle " +k);
writematrix(newTable,"angle"+k+"VectorField.txt","Delimiter","tab")


%% contour
figure
x2 = unique(myTable(:,1),'rows');
y2 = unique(myTable(:,2),'rows');
z2 = sqrt(contourTable(:,3).^2+contourTable(:,4).^2);
Z = reshape(z2,161,101)';

contourf(x2(1:end)+xShift,-y2(1:end)+yShift,Z,10,"LineColor","none")
axis equal
colorbar; new_cmap = jet(64); colormap(new_cmap)

hold on; 
quiver(newTable(1:arrowDensity:end,1),newTable(1:arrowDensity:end,2),newTable(1:arrowDensity:end,3),newTable(1:arrowDensity:end,4),2,"k","LineWidth",1);
axis equal;axis(axisArray)
title("Angle " +k);
end


function h = circle(x,y,r)
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,"LineWidth",2.5);
end