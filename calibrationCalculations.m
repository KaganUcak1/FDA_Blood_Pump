%% calibration calculations
% Last edit: 27.03.2023,  Created: 25.03.2023 
xScale = 103.78/1285;
yScale = 65.05/805;
ourScale = 0.054;
line1 = [(37.3-30.5) 0.75
        (37.66-30.25) 0.59
        (37.58-30.32) 0.26];

diameter= line1(3,1);
diameterScaled = diameter/xScale*ourScale

avgVelocity = line1(3,2);
avgVelocityScaled = avgVelocity/xScale*ourScale 

Q = avgVelocityScaled*pi*(diameterScaled/2/1000)^2*1000*60*60

35/60/60/1000/pi/(4.85/2/1000)^2