clc
close all;
d=0:0.1:1; alpha=2;
r=1;
gamma_th=2^r-1; %%% Threshold for SNR detection 
sigma_g=d.^-alpha; sigma_r=(1-d).^-alpha;    %%% distance parameter 
beta=0.5  %%%Reflection co-efficient (in you derivation it is given as alpha)
snr_dB=10;
snr_lin=10.^(snr_dB./10);
M=3;
disp(length(d));
for i=1:M
    i
    for s=1:length(d)
        pout(i,s)=1-(2*sqrt(gamma_th./(beta.*sigma_g(s).*sigma_r(s).*snr_lin))).*besselk(1,2*sqrt(gamma_th./(beta.*sigma_g(s).*sigma_r(s).*snr_lin)));  
    end
end
pout_M_case=(1./M).*sum(pout) %%% outage probability for M user case, Let say M=3 dictates average outage performance for 3 transmitter scenario (if TDMA used).
% %%% Throughput Performance/Average capacity
Tp=1./M*((1-pout_M_case)*r); %%% Vary M to get different throughput results
% %%% Energy efficiency
disp(snr_lin);
EE=Tp./(snr_lin);

%%% plots set 1
% plot(d, pout_M_case)
% title('Plot of Pout and d')
% ylabel('Pout') 
% xlabel('distance')
% hold on
% plot(d, Tp)
% title('Plot of Throughput and distance')
% ylabel('Througput') 
% xlabel('distance')
% hold on

plot(d, EE)
title('Plot of Energy Efficiency and distance')
ylabel('Energy efficiency') 
xlabel('distance')
% hold on
% grid on