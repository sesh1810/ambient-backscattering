clc
close all;
d=0.5; alpha=2;
r=1;
gamma_th=2^r-1; %%% Threshold for SNR detection 
sigma_g=d^-alpha; sigma_r=(1-d)^-alpha;  
[X,Y] = meshgrid(1:0.3:30,1:0.5:20);
Z = (1./sigma_g).*exp(-X./sigma_g).*(1./sigma_r).*exp(-Y./sigma_r);
%disp(Y)

PowerSource = 100;
Xparam = 1;
PowerSecondaryRCVR = alpha.*sqrt(PowerSource).*Xparam.*Z;
C=PowerSecondaryRCVR;
surf(X,Y,PowerSecondaryRCVR,C);
title('3D representation of the Power received by the Secondary Transmitters');
xlabel('Channel h')
ylabel('Channel g')
colorbar;

