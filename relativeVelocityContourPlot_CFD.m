%% FDA PUMP-CFD DATA, Impellar passage region relative velocity plotting
% Last edit: 27.06.2023, Created 09.05.2023,

clc; clear

clrMapCustom = load("colorMap2.mat");
filename = 'fda_cfd_result_animation_4-5.gif';  % Output filename
flag0 = 0;
f1 = figure;
resultant_line = zeros(22,100);
for t = 22:-1:1
myTable0 = readmatrix("FDA_951rpm_Data\FDA_"+num2str(t)+".csv");
myTable0 = myTable0*1000;

myTable1 = myTable0(1:1:end,:);


set(gcf, 'WindowState', 'maximized'); pause(0.2)

myTable = zeros(length(myTable1),4);
myTable(:,1)  = -myTable1(:,1);
myTable(:,2)  =  myTable1(:,2);
myTable(:,3)  = -myTable1(:,4);
myTable(:,4)  =  myTable1(:,5);
% quiver(myTable(:,1),myTable(:,2),myTable(:,3),myTable(:,4),0.4)
% 
% axis equal;xlim([-3.5 3.5]*10);ylim([-3.5 3.5]*10)
% title("Frame Num: " +num2str(t), 'FontSize',20);


angularVelocity = 15.85;
xScale = 1;
ourScale = 1;

relative_table = zeros(length(myTable),4);
contourTable = zeros(length(myTable),4);
blade_passage_Table = zeros(length(myTable),4);
for i=1:length(myTable)
    x = myTable(i,1);
    y = myTable(i,2);
    r = sqrt(x^2+y^2);
    contourTable(i,:) = [x,y,0,0];
    relative_table(i,:) = [x,y,0,0];
    if r < 26 && (myTable(i,3) ~=0 || myTable(i,4) ~=0)
        bladeVelocityMagnitude = angularVelocity*r*2*pi;
        angle = atan2(y,x);
        blade_passage_Table(i,:) = [x,y,myTable(i,3)/1000,myTable(i,4)/1000];
        myTable(i,3) = myTable(i,3)/xScale*ourScale+bladeVelocityMagnitude*sin(angle);
        myTable(i,4) = myTable(i,4)/xScale*ourScale-bladeVelocityMagnitude*cos(angle);
        relative_table(i,:) =     [x,y,myTable(i,3),myTable(i,4)];
        contourTable(i,:) = [x,y,myTable(i,3),myTable(i,4)];
    elseif r>=26
        relative_table(i,:) = [x,y,0,0];
        blade_passage_Table(i,:) = [x,y,0,0];
    end
end

xGrid = linspace(-26, 26, 300);
yGrid = linspace(-26, 26, 300);
[xGrid, yGrid] = meshgrid(xGrid, yGrid);

resultantGrid = griddata(blade_passage_Table(2:end,1), blade_passage_Table(2:end,2), sqrt(blade_passage_Table(2:end,3).^2+blade_passage_Table(2:end,4).^2), xGrid, yGrid);

contourf(xGrid, yGrid, resultantGrid,40);
axis equal; 
colorbar; new_cmap = jet(32);
colormap(clrMapCustom.CustomColormap2);
%colormap(new_cmap);
arrowDensity = 1;
hold on;
quiver(blade_passage_Table(1:arrowDensity:end,1),blade_passage_Table(1:arrowDensity:end,2),blade_passage_Table(1:arrowDensity:end,3),blade_passage_Table(1:arrowDensity:end,4),0.2,"k","LineWidth",1);
axis equal;xlim([-2.6 2.6]*10);ylim([-2.6 2.6]*10)
title("Frame Num: " +num2str(t), 'FontSize',20);

x_start = 0;  % x-coordinate of the starting point of the line
y_start = 0;  % y-coordinate of the starting point of the line
angle_for_line = -45+(22-t)*4;

x_end = 26*cosd(angle_for_line);    % x-coordinate of the ending point of the line
y_end = 26*sind(angle_for_line);    % y-coordinate of the ending point of the line

% Generate the x and y coordinates along the line segment
num_points = 100;  % Number of points along the line
x_line = linspace(x_start, x_end, num_points);
y_line = linspace(y_start, y_end, num_points);

% Interpolate the resultant values along the line segment

resultant_line(23-t,:) = interp2(xGrid, yGrid, resultantGrid, x_line, y_line);

hold on;
plot(x_line, y_line, 'k', 'LineWidth', 4);


% Capture the current figure as an image
 frameImage = getframe(gcf);
 [imageData, clrMap] = rgb2ind(frameImage.cdata, 256);
    
% Write the image data to the GIF file
if flag0 == 0
    flag0 = 1;
    imwrite(imageData, clrMap, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.2);
else
    imwrite(imageData, clrMap, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.2);
end

% Clear the figure for the next frame
cla;

end

% plot blade passage region line plot
f4 = figure;
set(gcf, 'WindowState', 'maximized'); pause(0.2)
radius_line = linspace(0,26,100);
label1 = {};
for anglePlot = 1:4:22
    plot(radius_line, resultant_line(anglePlot,:),"LineWidth",2); hold on    
    label1{end+1} = num2str((anglePlot-1)*4);
end
legend(label1,"FontSize",18); title("CFD Results for Different Angles", "FontSize",18);
saveas(f4,"plotAngle_4-5.png")

%% blade passing region contour
f2 = figure;
pause(1)
set(gcf, 'WindowState', 'maximized'); pause(0.5)
xGrid = linspace(-26, 26, 300);
yGrid = linspace(-26, 26, 300);
[xGrid, yGrid] = meshgrid(xGrid, yGrid);

resultantGrid = griddata(blade_passage_Table(2:end,1), blade_passage_Table(2:end,2), sqrt(blade_passage_Table(2:end,3).^2+blade_passage_Table(2:end,4).^2), xGrid, yGrid);

contourf(xGrid, yGrid, resultantGrid,40);
axis equal; 
colorbar; new_cmap = jet(32);
colormap(clrMapCustom.CustomColormap2);
%colormap(new_cmap);
arrowDensity = 1;
hold on;
quiver(blade_passage_Table(1:arrowDensity:end,1),blade_passage_Table(1:arrowDensity:end,2),blade_passage_Table(1:arrowDensity:end,3),blade_passage_Table(1:arrowDensity:end,4),0.2,"k","LineWidth",1);
axis equal;xlim([-3.5 3.5]*10);ylim([-3.5 3.5]*10)
x_start = 0;  % x-coordinate of the starting point of the line
y_start = 0;  % y-coordinate of the starting point of the line
x_end = 20;    % x-coordinate of the ending point of the line
y_end = 20;    % y-coordinate of the ending point of the line

% Generate the x and y coordinates along the line segment
num_points = 100;  % Number of points along the line
x_line = linspace(x_start, x_end, num_points);
y_line = linspace(y_start, y_end, num_points);

% Interpolate the resultant values along the line segment
resultant_line = interp2(xGrid, yGrid, resultantGrid, x_line, y_line);

hold on;
plot(x_line, y_line, 'k', 'LineWidth', 4);


figure
plot(x_line,resultant_line)


%% Relative Contour
f3 = figure;
pause(1)
set(gcf, 'WindowState', 'maximized'); pause(0.5)
xGrid = linspace(-25, 25, 100);
yGrid = linspace(-25, 25, 100);
[xGrid, yGrid] = meshgrid(xGrid, yGrid);

resultantGrid = griddata(relative_table(2:end,1), relative_table(2:end,2), sqrt(relative_table(2:end,3).^2+relative_table(2:end,4).^2), xGrid, yGrid);

contourf(xGrid, yGrid, resultantGrid,40);
axis equal; 
colorbar; new_cmap = jet(32);
colormap(clrMapCustom.CustomColormap2);
clim([0 500])
%colormap(new_cmap);
arrowDensity = 1;
hold on;
quiver(relative_table(1:arrowDensity:end,1),relative_table(1:arrowDensity:end,2),relative_table(1:arrowDensity:end,3),relative_table(1:arrowDensity:end,4),0.2,"k","LineWidth",1);
axis equal;xlim([-3.5 3.5]*10);ylim([-3.5 3.5]*10)