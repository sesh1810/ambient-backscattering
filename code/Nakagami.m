mf = 2; sigma_f = 1; %phase3 parameters
d_rd=0.5; %phase3 parameter
r=1;
mu=2;md=4; %shape parameters for both channels - phase2
gamma_th=2^r-1; %%% Threshold for SNR detection
sigma_u=1; sigma_d=1;    %spread parameters for both channels - phase 2
alpha=0.5;  %%%Reflection co-efficient
snr_dB=-20:40;
snr_lin=10.^(snr_dB./10);
rho = (snr_lin)./(d_rd.^mf); % phase 3 parameter
% formula for incomplete gamma function
%gamma(s,x)= (s-1)! * e(^-x)* sigma from (k=0 to s-1) of x^k/k!
 
sig = sqrt((mu.*md.*gamma_th)./(sigma_u.*sigma_d.*alpha.*snr_lin)); %phase 2 compute
%disp(sig);
M=3;
%disp(sig.^mu);
%disp(length(snr_dB));
for i=1:M
    i
    for s=1:length(snr_dB)
        % finding the inner summation involving bessel - phase 2
        summ=0;
        for k=0:md-1
            %disp("IDHU oru besel");
            %disp(besselk(mu-k,2*sig));
            summ = summ + ((1./factorial(k)).*(sig(s).^k).*besselk(mu-k,2*sig(s)));
        end
        pout_sr(i,s)=1-((2*(factorial(md-1)).*(sig(s).^mu).*(summ))/(gamma(md).*gamma(mu)));
        %pout(i,s)=1-(2*sqrt(gamma_th./(beta.*sigma_g.*sigma_r.*snr_lin(s)))).*besselk(1,2*sqrt(gamma_th./(beta.*sigma_g.*sigma_r.*snr_lin(s))));      
        %pout rd phase 3
        summm = 0;
        for l=0:mf-1
            summm = summm + (((mf*gamma_th/(sigma_f*rho(s))).^l)./factorial(l));
        end
        summm = summm.*(factorial(mf-1)).*(exp(-((mf*gamma_th)/(sigma_f*rho(s)))));
        pout_rd(i,s)=1-((1./gamma(mf)).*(summm));
       
    end

end
%disp("POUT");
%disp((pout))
pout_combined = (pout_sr.*pout_rd);
pout_M_case=(1./M).*sum(pout_combined) %%% outage probability for M user case, Let say M=3 dictates average outage performance for 3 transmitter scenario (if TDMA used).
%disp("Pout-3");
disp(pout_M_case);

% % % %%% Throughput Performance/Average capacity
disp("TP");Tp=1./M*((1-pout_M_case)*r) %%% Vary M to get different throughput results
% %%% Energy efficiency
%disp(snr_lin);
EE=Tp./(snr_lin)
% %
% % %%% plots set 1
% % %hold on
% % %grid on
% %
% % % disp(length(snr_dB));
% % % disp(length(pout_M_case));

semilogy(snr_dB, pout_M_case)
title('Outage Probability vs SNR')
xlabel('SNR')
ylabel('Outage Probability')
% % hold off
% %
% %
plot(snr_dB, Tp)
title('Plot of SNR and Throughput')
xlabel('SNR')
ylabel('Throughput')
% %
plot(snr_dB, EE)
title('Plot of SNR and Energy Efficiency')
xlabel('SNR')
ylabel('EE') 