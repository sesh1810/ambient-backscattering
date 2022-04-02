clc
close all;
d=0.5; alpha=2;
r=1;
gamma_th=2^r-1; %%% Threshold for SNR detection 
sigma_g=d^-alpha; sigma_r=(1-d)^-alpha;    %%% distance parameter 
beta = 0:0.05:1;  %%%Reflection co-efficient (in you derivation it is given as alpha)
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
axis([1 10 0 1.2 ])
hold on
j=1;
for i=1:5:21
    %disp(pout(i));
    disp("LOOP IN");
    
    pout_M_case=1./M.*(pout(i)); %%% outage probability for M user case, Let say M=3 dictates average outage performance for 3 transmitter scenario (if TDMA used).
    disp("Beta Bro");
    disp(beta(i));
    disp(pout_M_case);
    pecu1 ='y--d';
    pecu2 = 'm--s';
    pecu3 = 'k--p';
    pecu4 = 'b--*';
    pecu5 = 'y--d';
    if j==1
        semilogy(M,pout_M_case,pecu1, 'LineWidth',1,'MarkerSize',7,'MarkerFaceColor','y','MarkerEdgeColor','m');
    elseif j==2
        semilogy(M,pout_M_case,pecu2, 'LineWidth',1,'MarkerSize',7,'MarkerFaceColor','b','MarkerEdgeColor','k');
    elseif j==3
        semilogy(M,pout_M_case,pecu3, 'LineWidth',1,'MarkerSize',7,'MarkerFaceColor','k','MarkerEdgeColor','g');
    elseif j==4
        semilogy(M,pout_M_case,pecu4, 'LineWidth',1,'MarkerSize',7,'MarkerFaceColor','w','MarkerEdgeColor','k');
    else
        semilogy(M,pout_M_case,pecu5, 'LineWidth',1,'MarkerSize',7,'MarkerFaceColor','k','MarkerEdgeColor','r');
    end
    j=j+1;
    disp(j);
    
end
title('Plot of OutageProbability and Number of Secondary users')
xlabel('Number of Secondary users') 
ylabel('Outage Probability') 
%hold on grid on
legend('Beta = 0.25','Beta = 0.5', 'Beta = 0.75', 'Beta = 1');    
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


