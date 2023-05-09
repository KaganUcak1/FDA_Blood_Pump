%% Last edit: 28.02.2023, Created: 22.12.2022
%% Re calculation reff: https://link.springer.com/article/10.1007/s13239-018-00378-y
clc; clear;

%% 3 Labin deneyi
rho = 1035;                 % kg/m3
rotaSpeed = 3500/60;        % 1/s
diameter = 0.052;           % m
dynVisco = 3.5 ;            % cP
dynVisco = dynVisco/1000;   % kg/(m/s)
Q = 2.5;                    % L/min
Q = Q/1000/60;              % m^3/s

Re = 2*pi*rho*rotaSpeed*diameter^2/dynVisco
flowCoeff = Q/rotaSpeed/2/pi/diameter^3


%%  Bizim deney
rho = 997.3;             % kg/m3 as water at 24 C   https://www.engineeringtoolbox.com/water-density-specific-weight-d_595.html       
dynVisco = 0.9096;       % cP                       https://www.engineeringtoolbox.com/water-dynamic-kinematic-viscosity-d_596.html
dynVisco = dynVisco/1000 ;  % kg/(m/s)  

rotaSpeedRPM = 60*Re/rho/diameter^2*dynVisco/2/pi

kHz = rotaSpeedRPM/60/1000

Qwater = flowCoeff*rotaSpeedRPM/60*2*pi*diameter^3;
Qwater = Qwater*1000*60