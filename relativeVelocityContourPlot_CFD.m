%% FDA PUMP-CFD DATA, Impellar passage region relative velocity plotting
% Last edit: 09.05.2023, Created 09.05.2023,

clc; clear

clrMap = load("colorMap2.mat");
myTable0 = readmatrix("Plane1_Velocity.csv");
myTable0 = readmatrix("FDA_951rpm_Data\FDA_0.csv");
myTable0 = myTable0*1000;

myTable1 = myTable0(1:1:end,:);
f1 = figure;
myTable = zeros(length(myTable1),4);
myTable(:,1)  = -myTable1(:,1);
myTable(:,2)  =  myTable1(:,2);
myTable(:,3)  = -myTable1(:,7);
myTable(:,4)  =  myTable1(:,8);
quiver(myTable(:,1),myTable(:,2),myTable(:,3),myTable(:,4),0.4)

axis equal;xlim([-3.5 3.5]*10);ylim([-3.5 3.5]*10)



angularVelocity = 15.85;
xScale = 1;
ourScale = 1;

newTable = zeros(length(myTable),4);
contourTable = zeros(length(myTable),4);
for i=1:length(myTable)
    x = myTable(i,1);
    y = myTable(i,2);
    r = sqrt(x^2+y^2);
    contourTable(i,:) = [x,y,0,0];
    newTable(i,:) = [x,y,0,0];
    if r < 25 && r>11.75 && (myTable(i,3) ~=0 || myTable(i,4) ~=0)
        bladeVelocityMagnitude = angularVelocity*r*2*pi;
        angle = atan2(y,x);
        myTable(i,3) = myTable(i,3)/xScale*ourScale+bladeVelocityMagnitude*sin(angle);
        myTable(i,4) = myTable(i,4)/xScale*ourScale-bladeVelocityMagnitude*cos(angle);
        newTable(i,:) =     [x,y,myTable(i,3),myTable(i,4)];
        contourTable(i,:) = [x,y,myTable(i,3),myTable(i,4)];
    elseif r>=26
        newTable(i,:) = [x,y,0,0];
    end
end
%% contour
f2 = figure;
pause(1)
set(gcf, 'WindowState', 'maximized'); pause(0.5)
xGrid = linspace(-25, 25, 100);
yGrid = linspace(-25, 25, 100);
[xGrid, yGrid] = meshgrid(xGrid, yGrid);

resultantGrid = griddata(newTable(2:end,1), newTable(2:end,2), sqrt(newTable(2:end,3).^2+newTable(2:end,4).^2), xGrid, yGrid);

contourf(xGrid, yGrid, resultantGrid,50);
axis equal; 
colorbar; new_cmap = jet(32);
colormap(clrMap.CustomColormap2);
clim([0 500])
% colormap(new_cmap);
arrowDensity = 1;
hold on;
quiver(newTable(1:arrowDensity:end,1),newTable(1:arrowDensity:end,2),newTable(1:arrowDensity:end,3),newTable(1:arrowDensity:end,4),0.2,"k","LineWidth",1);
axis equal;xlim([-3.5 3.5]*10);ylim([-3.5 3.5]*10)
