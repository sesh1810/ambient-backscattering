clc
close all;
d=0.5; alpha=2;
r=1;
gamma_th=2^r-1; %%% Threshold for SNR detection 
sigma_g=d^-alpha; sigma_r=(1-d)^-alpha;    %%% distance parameter 
beta=0:0.05:1  %%%Reflection co-efficient (in you derivation it is given as alpha)
snr_dB=-20;
snr_lin=10.^(snr_dB./10);
M=3;
disp(length(beta));
for i=1:M
    i
    for s=1:length(beta)
        pout(i,s)=1-(2*sqrt(gamma_th./(beta(s).*sigma_g.*sigma_r.*snr_lin))).*besselk(1,2*sqrt(gamma_th./(beta(s).*sigma_g.*sigma_r.*snr_lin)));  
    end
end
pout_M_case=(1./M).*sum(pout) %%% outage probability for M user case, Let say M=3 dictates average outage performance for 3 transmitter scenario (if TDMA used).
% %%% Throughput Performance/Average capacity
Tp=1./M*((1-pout_M_case)*r); %%% Vary M to get different throughput results
% %%% Energy efficiency
disp(snr_lin);
EE=Tp./(snr_lin);

%%% plots set 1
%axis([0 1 0 1.2 ])
% hold on
% plot(beta, pout_M_case)
% title('Plot of Pout and Beta')
% ylabel('Pout') 
% xlabel('Beta')
%hold off
% hold on
% plot(beta, Tp)
% title('Plot of Throughput and Beta')
% ylabel('Througput') 
% xlabel('Beta')
% hold on

plot(beta, EE)
title('Plot of Energy Efficiency and Beta')
ylabel('Energy efficiency') 
xlabel('Beta')
hold on
% grid on