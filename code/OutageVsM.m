clc
close all;
d=0.5; alpha=2;
r=1;
gamma_th=2^r-1; %%% Threshold for SNR detection 
sigma_g=d^-alpha; sigma_r=(1-d)^-alpha;    %%% distance parameter 
beta=0.5  %%%Reflection co-efficient (in you derivation it is given as alpha)
snr_dB=0:10:50;
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
% % %%% Average Outage performance
% % poutt_M_case = zeros(10,51);
% % disp("Outt_M CASE");
% % %disp(poutt_M_case(:,1));
% %  %disp(M);
% % for M=1:10
% %     poutt_M_case(M,:)=1./M.*(pout); 
% %     disp("M");
% %     disp(M);
% %     if M==3
% %         disp("HEY ITS m=3")
% %         disp(poutt_M_case(M,:));
% %     end
% % end
% % %Scatter plot
% % %X = randn(50,3);
% % %Y = reshape(1:150,50,3);  
% % poutt_M_case = reshape(10,1);
% % plotmatrix(M,poutt_M_case)
M=3;
% % for i=1:6
% %     disp(i);
% %     disp(pout(i));
% % end
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
for i=1:3
    %disp(pout(i));
    pout_M_case=1./M.*(pout(i)); %%% outage probability for M user case, Let say M=3 dictates average outage performance for 3 transmitter scenario (if TDMA used).
    disp("Pout");
    disp(i);
    disp(pout_M_case);
    pecu1 ='g--x';
    pecu2 = 'b--o';
    pecu3 = 'k--s';
    if i==1
        semilogy(M,pout_M_case,pecu1, 'LineWidth',2,'MarkerSize',7,'MarkerFaceColor','y','MarkerEdgeColor','m');
    elseif i==2
        semilogy(M,pout_M_case,pecu2, 'LineWidth',2,'MarkerSize',7,'MarkerFaceColor','b','MarkerEdgeColor','k');
    else
        semilogy(M,pout_M_case,pecu3, 'LineWidth',2,'MarkerSize',7,'MarkerFaceColor','k','MarkerEdgeColor','r');
    end
end
title('Plot of OutageProbability and Number of Secondary users')
xlabel('Number of Secondary users') 
ylabel('Outage Probability') 
%hold on grid on
legend('SNR = 0 dB','SNR = 10 dB','SNR = 20 dB');    
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


