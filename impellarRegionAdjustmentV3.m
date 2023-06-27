%% iATVA impellar passage region relative velocity plotting
% Last edit: 23.05.2023, Created 23.05.2023,
clear; clc; close all
clrMap = load("colorMap2.mat");
angularVelocityArray = -[65.5 74.5 101 121 ]/7; %hz
VelocityArray = -angularVelocityArray*60;
z = 0;
numExp = ["6"] %, "4", "3", "5" ];
ang =0;
for k = numExp
    ang = ang+1;
    angularVelocity = angularVelocityArray(ang);

    myTable = table2array(readtable("./iatvaExp1/exp"+k+"-1"+"/B00001.txt"));
    xShift = -12; yShift = -12; axisArray = [-5 30 -18 21];
    xScale = 1;
    ourScale = 1;

    newTable = zeros(size(myTable));
    contourTable = zeros(size(myTable));
    for i=1:length(myTable)
        x = myTable(i,1)+xShift;
        y = myTable(i,2)+yShift;
        r = sqrt(x^2+y^2);
        contourTable(i,:) = [x,y,0,0];
        newTable(i,:) = [x,y,0,0];
        if r < 19 && r>2 && (myTable(i,3) ~=0 || myTable(i,4) ~=0)
            bladeVelocityMagnitude = angularVelocity*r/1000*2*pi;
            angle = atan2(y,x);
            myTable(i,3) = myTable(i,3)/xScale*ourScale+bladeVelocityMagnitude*sin(angle);
            myTable(i,4) = myTable(i,4)/xScale*ourScale-bladeVelocityMagnitude*cos(angle);
            newTable(i,:) =     [x,y,myTable(i,3),myTable(i,4)];
            contourTable(i,:) = [x,y,myTable(i,3),myTable(i,4)];
        elseif r>=19
            newTable(i,:) = [x,y,0,0];
        end
    end


    %% single window
    arrowDensity = 3;

    %% contour
    
    x2 = unique(contourTable(:,1),'rows');
    y2 = unique(contourTable(:,2),'rows');
    z2 = sqrt(contourTable(:,3).^2+contourTable(:,4).^2);
    maxVelDesired = 2.5;
    indx = find(z2>maxVelDesired);
    z2(indx) = 0;
    Z = reshape(z2,length(x2),length(y2))';
    f2 = figure;
    contourf(x2(1:end),-y2(1:end)-5.7,Z,800,"LineColor","none")
    set(gcf, 'WindowState', 'maximized'); pause(0.1)
    hold on
    max(z2)
    axis equal
    colorbar; new_cmap = jet(32);
    colormap(clrMap.CustomColormap2);
    % colormap(new_cmap);

    quiver(newTable(1:arrowDensity:end,1),newTable(1:arrowDensity:end,2),newTable(1:arrowDensity:end,3),newTable(1:arrowDensity:end,4),3.5,"k","LineWidth",1);
    axis equal;axis([-10 25 -20 15])
    title("Angle " +num2str(VelocityArray(ang)));
    %saveas(f2,".\iatvaContours\Exp"+ang+".png");

end



function h = circle(x,y,r)
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,"LineWidth",2.5);
end