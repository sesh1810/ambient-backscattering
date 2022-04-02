clc
close all;
d=0.5; alpha=2;
r=1;
gamma_th=2^r-1; %%% Threshold for SNR detection 
sigma_g=d^-alpha; sigma_r=(1-d)^-alpha;    %%% distance parameter 
beta=0.5  %%%Reflection co-efficient (in you derivation it is given as alpha)
snr_dB=-20:40
snr_lin=10.^(snr_dB./10);
M=3;
disp(length(snr_dB));
for i=1:M
    i
    for s=1:length(snr_dB)
        pout(i,s)=1-(2*sqrt(gamma_th./(beta.*sigma_g.*sigma_r.*snr_lin(s)))).*besselk(1,2*sqrt(gamma_th./(beta.*sigma_g.*sigma_r.*snr_lin(s))));  
    end
end
disp("POUT");
disp(pout)
pout_M_case=(1./M).*sum(pout) %%% outage probability for M user case, Let say M=3 dictates average outage performance for 3 transmitter scenario (if TDMA used).
disp("Pout-3");
disp(pout_M_case);
% %%% Throughput Performance/Average capacity
Tp=1./M*((1-pout_M_case)*r); %%% Vary M to get different throughput results
% %%% Energy efficiency
disp(snr_lin);
EE=Tp./(snr_lin);

%%% plots set 1
disp(length(snr_dB));
disp(length(pout_M_case));
semilogy(snr_dB, pout_M_case)
title('Plot of SNR and Outage Probability')
xlabel('SNR') 
ylabel('Outage Probability') 
hold on

hold on
grid on
plot(snr_dB, Tp)
title('Plot of SNR and Throughput')
xlabel('SNR') 
ylabel('Throughput')

plot(snr_dB, EE)
title('Plot of SNR and Energy Efficiency')
xlabel('SNR') 
ylabel('EE') 
hold off
% grid on