clc
close all;
d=0:0.1:1; alpha=2;
r=1;
gamma_th=2^r-1; %%% Threshold for SNR detection 
sigma_g=d.^-alpha; sigma_r=(1-d).^-alpha;    %%% distance parameter 
beta = 0.5;  %%%Reflection co-efficient (in you derivation it is given as alpha)
snr_dB=10;
snr_lin=10.^(-snr_dB./10);
disp("Snr(dB)");
disp(snr_dB);
%disp(lol);
%besslk doubt

% disp(snr_lin);
% for i=1:6
%     disp(snr_lin(i));
% end
pout=1-(2*sqrt(gamma_th./(beta.*sigma_g.*sigma_r.*snr_lin))).*besselk(1,2*sqrt(gamma_th./(beta.*sigma_g.*sigma_r.*snr_lin)));                        %%% outage probability for 1 user case

disp("Pout-1 user")
disp(pout)

%%%%%%%%%%%%%%%%%Start of main
% % pout_M_case = zeros(6,10);
% % M=1:1:10;
% % for i=1:6
% %     %disp(pout(i));
% %     pout_M_case(i,:)=1./M.*(pout(i)); %%% outage probability for M user case, Let say M=3 dictates average outage performance for 3 transmitter scenario (if TDMA used).
% %     disp("Pout");
% %     disp(i);
% %     disp(pout_M_case(i,:));
% % end
%%%%%%%%%%%%%%%%%End of main section
M=1:1:10;
axis([1 10 0 0.9 ])
hold on
for i=1:1:11
    %disp(pout(i));
    pout_M_case=1./M.*(pout(i)); %%% outage probability for M user case, Let say M=3 dictates average outage performance for 3 transmitter scenario (if TDMA used).
    disp("Dist Bro");
    disp(d(i));
    disp(pout_M_case);
    pecu1 ='g';
    pecu2 = 'm--o';
    pecu3 = 'k--o';
    semilogy(M,pout_M_case,'g-o', 'LineWidth',1,'MarkerSize',7,'MarkerEdgeColor','b');
    
end
title('Plot of OutageProbability and Number of Secondary users')
xlabel('Number of Secondary users') 
ylabel('Outage Probability') 
%hold on grid on
legend('d=0.1','d=0.3','d=0.5', 'd=0.7', 'd=0.9');    
hold off
%pout_M_case=1./M.*(pout); %%% outage probability for M user case, Let say M=3 dictates average outage performance for 3 transmitter scenario (if TDMA used).
%disp("Pout-3")
%disp(pout_M_case);
% semilogy(M,pout_M_case)
% title('Plot of OutageProbability and Number of Secondary users')
% xlabel('Number of Secondary users') 
% ylabel('Outage Probability') 
% % %hold on
% %%% Throughput Performance/Average capacity


