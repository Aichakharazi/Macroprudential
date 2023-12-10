
% Unconstrained household sector
bbeta         =   0.99;
ssigl      =   1; 
bb            =   0.63; 
nnul     =   1.05;

% Collateral constrained household sector 2
bbeta2         =   0.95;
ssigl2      =   1; 
bb2            =   0.63; 
nnul2     =   1.05;
Qhss = 1;
chih = 1.5;

% Goods producing sector 
ddelta        =   0.025; 
aalpha       =   0.4; 
nnup_pSS     =   0.2; % 1.2; 

% Entrepreneurs
muE         =   0.94;

sigmaomegae_ss       = 2.5; % 4.18 2.5
sigmaomegah_ss       = 2.5; % 5.8  5.8
sigmakappae_ss       =  4;
sigmakappah_ss       =  4;


%L_E = 0.01; %Entrepreneurs’ labor supply
ggammaE = 0.95; % of firm’s retained earnings 0.68


% Policy 
%poli           =   3.71/400;

muH         =   0.94;


%% solve for x : idiosyncratic shock   delinquency rate 1.5%  == 0.015
omegae_ss = 1/(1+exp(sigmaomegae_ss));
% in this case default probabilty  equal to 8 percent
%% solve for x : households idiosyncratic shock    delinquency rate 0.3% ==0.003
omegah_ss =  1/(1+exp(sigmaomegah_ss));
% in this case default probabilty equal to 8 percent
%% solve for epsilon : entrepreneur credit constraint shock
kappae_ss =1/(1+exp(-sigmakappae_ss));
% loan to value ratio 0.98


%% solve for epsilon : household credit constraint shock
kappah_ss =1/(1+exp(-sigmakappah_ss));
% loan to value ratio 0.98
% In iacoviello (ltv = 0.85)
% Journal of Monetary Economics  2013 
%Housing and debt over the life cycle and over the business cycle
% Matteo Iacoviello Marina Pavan

%%  Calvo parameters
zetap       =  0.702;  % Calvo SP  
zetal       =  0.771; % Calvo SW

%% Taylor rule parameters
ssii        =  5; %29.31; % Investment adjustament cost
%sigaa       =  1; %18.85;% Capacity utilization
alphpi      =  1.817; % Weight on inflation in Taylor rule
alphdey     =  0.310; % Weight on output growth in Taylor rule
rhop        =  0.877;  % Coefficient on lagged interest rate

%% OTHER STEADY-STATE PARAMETERS
nng           = 0.18; % 
z_ss          =   1;
zetc_ss       =   1;

%% Shock parameters

rhoggg      = 0.730;
rhozz       = 0.98; % shock to the prodcuction function
rhozetc     = 0.721;

rhosigmaomegae_ss  = 0.522;
rhosigmaomegah_ss  = 0.522;
rhosigmakappae_ss  = 0.522;
rhosigmakappah_ss  = 0.522;


rhoQh_ss  = 0.522;

std1_ggg       = 0.021;
std1_zz  = 0.03;
std1_zetc   = 0.09;

std1_sigmaomegae_ss  = 0.06;
std1_sigmaomegah_ss  = 0.06;
std1_sigmakappae_ss  = 0.06;
std1_sigmakappah_ss  = 0.06;

std1_Qh_ss  = 0.06;


alphakomegae      =  1.817; % Weight on default rate in Taylor rule

alphakomegah      =  1.817; % Weight on default rate in Taylor rule


%% -------------- COMPUTE THE SS for some endogenous variables -------------------------------
PP_ss             =  1;
WW_ss             =  1;
%Pstar_ss =1
%WstarSS =1
Pstar_ss          =  ( ( (PP_ss)^(nnup_pSS/(1-nnup_pSS)) - (1-zetap)*(PP_ss)^(nnup_pSS/(1-nnup_pSS)) )/zetap)^((1-nnup_pSS)/nnup_pSS);
Wstar_ss          =  ( ( (WW_ss)^(1/(1-nnul)) - (1-zetal)*(WW_ss)^(1/(1-nnul)) )/zetal)^(1-nnul);
%LAM1_ss           =  1/(1+nnup_pSS);
LAM1_ss= (Pstar_ss /((1+nnup_pSS)*PP_ss)) ;

pi_ss=1;

%% ASSUMPTION to compute the steady state   
%rk_ss          =   0.059; % CMR JMCB 2003 paper

%RKSS, 0.025
%R_ss 0.0127
rk_ss = (LAM1_ss/((1-aalpha)^(aalpha-1)*aalpha^(-aalpha)*((WW_ss)^(1-aalpha))) )^(1/aalpha);

%RKSS = 1/bbeta - (1-ddelta);
RK_ss          = (rk_ss +1-ddelta) -1;


R_ss          =  1/bbeta-1;
QK_ss           =   1;





%%
M_GUESS = 3*0.6; % 1.8  ===> lev = 1.8/3
Lev_ss_GUESS = 0.3;
% 




%% compute entrepreneur's leverage, net worth and capital


x0=[ 4 ; 10];%; 10]; 
%,aalpha,gamma_pSS ,z_ss  ,ggammaE  L_E  Lev_ss
x = fsolve(@(x) solve_kn(x,muE,omegae_ss,kappae_ss,RK_ss,R_ss,QK_ss,ddelta,LAM1_ss,ggammaE), x0, ...
                            optimset('TolFun',1e-10,'MaxIter',100000000,'MaxFunEvals',10000000));


                        
% 'Algorithm', 'levenberg-marquardt',

%Lev_ss = x(1);
Nw_ss= x(1); %(1);
K_ss = x(2);

if Nw_ss>K_ss
    disp('warning: Nw_ss>K_ss')
end

if min(x)<0
    disp('**************************************************');
    disp('this is not the true steady state for the contract');
    disp('**************************************************');
end


%%

%%  Investment 
I_ss = ddelta*K_ss;

%%
m_ss = QK_ss*K_ss - Nw_ss;
%% labor
%L_ss = ( (RK_ss)/(aalpha*LAM1_ss*(K_ss)^(1-aalpha) ) )^(1/(1-aalpha)) *(1/z_ss);

L_ss = ( (WW_ss)/((1-aalpha)*LAM1_ss*(K_ss)^(aalpha) ) )^(1/-aalpha) *(1/z_ss);


DDif = RK_ss- rk_ss;
%% output
Y_ss =  (K_ss)^(aalpha) * (z_ss*L_ss)^(1-aalpha); 
%% government consumption 
gg_ss = nng*Y_ss;

%% to pin down chih
%%phi_l = 0.40;
hss_gdp = 0.5;
hh_SS =  hss_gdp*Y_ss;
%%
re_ss = 1/bbeta - 1;  
%% cih  solve for h  

%equ1 = ( lambda_h_ss*Qhss - bbeta * lambda_h_ss  *  Qhss - (kappah_ss * lambda_h_ss*Qhss )/( 1+re_ss ) );



%hh_SS = -(chih)/(equ1);
%aaa1 = hh_SS/Y_ss
%-1.502076511175053e+04
%% houshold debt

d_h_ss   = ( (1-omegah_ss) *kappah_ss *Qhss *hh_SS + (1-muH) *omegah_ss *kappah_ss *Qhss *hh_SS)/ ((1+R_ss))  ;

%% household deposit
dep_h_ss = d_h_ss;


%% 
f_e_ss = omegae_ss  *muE*kappae_ss* K_ss  * QK_ss *(1+RK_ss);
f_h_ss = omegah_ss  *muH*kappah_ss* Qhss * hh_SS;




%%
xl= 0.3;
%cu_ss = xl * c_ss;
%cc_ss = (1-xl) * c_ss;
%%

Lu_ss = xl * L_ss;
Lc_ss = (1-xl) * L_ss;

%% household budget constraint
cu_ss  = WW_ss*Lu_ss - dep_h_ss  + dep_h_ss  *(1+R_ss);
cc_ss =  WW_ss*Lc_ss  + Qhss * hh_SS + d_h_ss  - Qhss * hh_SS - d_h_ss*(1+re_ss);

%%
c_ss = cc_ss + cu_ss;

c_ss1 = Y_ss - I_ss - f_e_ss  - f_h_ss - gg_ss;

DIFL = c_ss1 - c_ss ;

%%

%cu_ss = WW_ss*Lu_ss - dep_h_ss + dep_h_ss*(1+R_ss);
%cc_ss = WW_ss*Lc_ss  + Qhss * hh_SS + d_h_ss  - Qhss * hh_SS - d_h_ss*(1+re_ss);

%LAMZSS = 1/(1+ttaucSS)/CSS*((muzstar_pSS-bbSS*bbetaSS)/(muzstar_pSS-bbSS));
%c_y =  (cc_ss + cu_ss)/Y_ss


%xl= 0.3;
%cu_ss = xl * c_ss;
%cc_ss = (1-xl) * c_ss;




%% lambda_h_ss  
%lambda_hu_ss = (( phi_l* nnul * (Lu_ss)^(1+ssigl)*((WW_ss)^(nnul/(1-nnul)))^(-(1+ssigl)) )/(WstarSS^((ssigl*nnul+nnul-1)/(nnul-1)) * WW_ss^(- nnul/(1-nnul))*L_ss ) ) ;
%lambda_hc_ss = (( phi_l* nnul * (Lc_ss)^(1+ssigl)*((WW_ss)^(nnul/(1-nnul)))^(-(1+ssigl)) )/(WstarSS^((ssigl*nnul+nnul-1)/(nnul-1)) * WW_ss^(- nnul/(1-nnul))*L_ss ) ) ;
% or
lambda_hu_ss = (zetc_ss)/(PP_ss*(cu_ss -cu_ss* bb)) - bbeta*bb* (zetc_ss)/(PP_ss*( cu_ss - bb*cu_ss));
lambda_hc_ss  = (zetc_ss)/(PP_ss *( cc_ss- bb2*cc_ss)) - bbeta2*bb2*(zetc_ss)/(PP_ss *( cc_ss- bb2*cc_ss));
 


%%
phi_l =(WW_ss*lambda_hu_ss)/(Lu_ss )^(ssigl);
phi_l2 =(WW_ss*lambda_hc_ss)/(Lc_ss)^(ssigl2);
%%
%resi_derr_ss= - chih/hh_SS + lambda_hc_ss * Qhss + lambda_hc_ss* bbeta2 *  Qhss - (kappah_ss * Qhss * lambda_hc_ss )/(1+re_ss);


% - lambda_hc_v * Qh_v  + bbeta* lambda_hc_v(+1) * Qh_v(+1) ;
%  Qh_v = 1
QhF_ss = chih/(hh_SS* lambda_hc_ss) + (kappah_ss * Qhss * lambda_hc_ss )/((1+re_ss)*lambda_hc_ss) + bbeta2*lambda_hc_ss/lambda_hc_ss*Qhss ;

resi_derr_ss = QhF_ss - Qhss;

v_h_ss = (chih/(hh_SS*lambda_hc_ss))   + ( ( kappah_ss *  Qhss    ) /(1+re_ss ) )  + resi_derr_ss;


%resi_derr_ss = Qhss - ((chih/hh_SS*lambda_hc_ss)   + ( ( kappah_ss *  Qhss) /(1+re_ss ) ))  + resi_derr_ss


%% v = pi + (1-delta)q k  

%v_ss =( ( (1-omegae_ss) - kappae_ss* (1-omegae_ss) ) * (1+RK_ss) * ( Lev_ss_GUESS +1 ) * Nw_ss *(1+R_ss)/(1+R_ss) + (1-ddelta)*QK_ss*K_ss ) ;
v_ss =( ( (1-omegae_ss) - kappae_ss* (1-omegae_ss) ) * (1+RK_ss) * ( (m_ss/Nw_ss) +1 ) * Nw_ss *(1+R_ss)/(1+R_ss) + (1-ddelta)*QK_ss*K_ss ) ;

%v_ss =( ( (1-omegae_ss) - kappae_ss* (1-omegae_ss) ) * (1+RK_ss) * ( ((QK_ss*K_ss - Nw_ss)/Nw_ss) +1 ) * Nw_ss *(1+R_ss)/(1+R_ss) + (1-ddelta)*QK_ss*K_ss ) ;



%%  v_ss/K_ss = fundamental  
%%  SS_ss  = bubble 
SS_ss = QK_ss - v_ss/K_ss;


%%

IMkappae_ss  = ((1+re_ss)* m_ss)/((1+RK_ss) * QK_ss * K_ss);

IMkappah_ss =  ((1+re_ss) * d_h_ss) / Qhss * hh_SS;



%LAM1_ss=((1-aalpha)^(aalpha-1)*aalpha^(-aalpha))*((rk_ssinit)^aalpha)*((WW_ss)^(1-aalpha));



%%
Fp_ss   =(Y_ss*LAM1_ss)/(1-bbeta+bbeta*zetap);
Kp_ss   =(z_ss*Y_ss*LAM1_ss)/(1-bbeta+bbeta*zetap);
Fpw_ss  =(LAM1_ss*L_ss)/((1-bbeta*zetal)*(nnul)); 

psilSS = Fpw_ss*WW_ss*(1-bbeta*zetal)/(L_ss^(1+ssigl));



%%

muzstar_pSS = 1;

%%


disp('')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('         Table 1: Steady State                      ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

KY = K_ss/Y_ss;
IY = I_ss/Y_ss;
CY = c_ss/Y_ss;
GY = gg_ss/Y_ss;
%HY = HSS/Y_ss;
%AMY = AMSS/Y_ss;
AMEY = m_ss/Y_ss;
%AMWY = AMWSS/Y_ss;
CCE = K_ss/m_ss; 
%CCW = HSS/AMWSS;

Leverage = m_ss/K_ss ;

fprintf('capital to output ratio =%6.2f\n', KY)
fprintf('investment to output ratio =%6.2f\n', IY)
fprintf('consumption to output ratio =%6.2f\n', CY)
fprintf('government consumption to output ratio =%6.2f\n', GY)
fprintf('total entrepreneur debt to output ratio =%6.2f\n', AMEY)
fprintf('entrepreneur leverage =%6.2f\n', ((QK_ss*K_ss -Nw_ss )/Nw_ss)*100 )
fprintf('rental rate of capital =%6.3f\n', RK_ss*100)
fprintf('Interest Rate on Loans to Entrepreneur, RE =%6.2f\n', R_ss*100)
fprintf('Cost of external finance, Z=%6.2f\n', re_ss*100)


disp('')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('           Table 2: Interest Rates        ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
%fprintf('Rate of Return on Capital, RK =%6.2f\n', ((RK_ss+1)^4-1)*100)
%fprintf('Interest Rate on Loans to Entrepreneur, RE =%6.2f\n', ((R_ss+1)^4-1)*100)
%fprintf('Cost of external finance, Z=%6.2f\n', ((1+re_ss)^4-1)*100)

%%  save parameters and variables in steady states


save ss_model_RM bbeta ssigl bb nnul... 
bbeta2 ssigl2 bb2 nnul2 Qhss chih... 
ddelta aalpha nnup_pSS...   
muE sigmaomegae_ss sigmaomegah_ss sigmakappae_ss sigmakappah_ss... 
ggammaE muH...  
omegae_ss omegah_ss kappae_ss kappah_ss...
zetap zetal...  
ssii alphpi alphdey rhop... 
nng z_ss zetc_ss...  
RK_ss R_ss QK_ss... 
PP_ss WW_ss Pstar_ss Wstar_ss LAM1_ss...  
Nw_ss K_ss I_ss m_ss... 
L_ss Y_ss gg_ss...
phi_l phi_l2 hss_gdp hh_SS... 
re_ss d_h_ss dep_h_ss... 
f_e_ss f_h_ss... 
c_ss  xl cu_ss cc_ss...
Lu_ss Lc_ss... 
lambda_hu_ss lambda_hc_ss... 
v_ss SS_ss...
rhoggg rhozz rhozetc...
rhosigmaomegae_ss rhosigmaomegah_ss rhosigmakappae_ss rhosigmakappah_ss...
std1_ggg std1_zz std1_zetc...
std1_sigmaomegae_ss std1_sigmaomegah_ss std1_sigmakappae_ss std1_sigmakappah_ss resi_derr_ss IMkappae_ss IMkappah_ss DDif DIFL...
rhoQh_ss std1_Qh_ss QhF_ss pi_ss rk_ss psilSS Fpw_ss...
Fp_ss Kp_ss muzstar_pSS alphakomegae alphakomegah;


%alphakomega alphakomegah




%% check

ER(1) = -Pstar_ss +  ( ( (PP_ss)^(nnup_pSS/(1-nnup_pSS)) - (1-zetap)*(PP_ss )^(nnup_pSS/(1-nnup_pSS)) )/zetap)^((1-nnup_pSS)/nnup_pSS);

ER(2) = -Fp_ss +  LAM1_ss * Y_ss + bbeta * (PP_ss/PP_ss) *(1-zetap)* Fp_ss;
ER(3) = -Kp_ss + z_ss * LAM1_ss * Y_ss + bbeta *(1-zetap)* Kp_ss;

ER(4) = - LAM1_ss + (Pstar_ss /((1+nnup_pSS)*PP_ss)) ;

ER(5) = - Wstar_ss       +  ( ( (WW_ss)^(1/(1-nnul)) - (1-zetal)*(WW_ss )^(1/(1-nnul)) )/zetal)^(1-nnul);


ER(6) = ((Wstar_ss^(nnul/(nnul-1)))*L_ss*LAM1_ss/nnul) + bbeta * zetal  * ( ( Wstar_ss )^(nnul/(1-nnul)) )  * Fpw_ss - Fpw_ss;
ER(7) = zetc_ss *((Wstar_ss^(nnul/(nnul-1))*L_ss)^(1+ssigl)) + bbeta*zetal * (( Wstar_ss )^(nnul*(1+ssigl)/(1-nnul))) * ( ( ( (1 - zetal * ( ( Wstar_ss ) ^ (1/(1-nnul)) ) ) / (1-zetal) ) ^ (1-nnul*(1+ssigl)) ) * WW_ss * Fpw_ss/psilSS ) - ( ( ( (1 - zetal * ( ( Wstar_ss  ) ^ (1/(1-nnul)) ) ) / (1-zetal) )   ^ (1-nnul*(1+ssigl)) ) * WW_ss   * Fpw_ss/psilSS );

%---- resid e-17
ER(8)  = -K_ss + (1-ddelta)*K_ss + ( 1 - (ssii/2)*( (I_ss/I_ss) - 1 )^(2) )*I_ss ;

ER(9) = - LAM1_ss* QK_ss + LAM1_ss*(1 + (ssii/2)*( (I_ss/I_ss) - 1 )^(2) + ssii * (I_ss/I_ss) * (I_ss/I_ss-1) )- bbeta* LAM1_ss * ssii * (I_ss/I_ss)^(2) *  (I_ss/I_ss -1) ; 


ER(10) = - (1+RK_ss) + (rk_ss   + (1-ddelta)  *  QK_ss)/QK_ss  ; 

ER(11) = -LAM1_ss  +((1-aalpha)^(aalpha-1)*aalpha^(-aalpha))*((rk_ss)^aalpha)*((WW_ss)^(1-aalpha));

%---- resid e-17
ER(12) = -(rk_ss) + aalpha * ((z_ss*L_ss)/K_ss)^(1-aalpha)* LAM1_ss;
ER(13) =  -L_ss + ( (WW_ss)/((1-aalpha)*LAM1_ss*(K_ss)^(aalpha) ) )^(1/-aalpha) *(1/z_ss);

ER(14) = (    ((1-omegae_ss) - kappae_ss*(1-omegae_ss))*(1+RK_ss)*Nw_ss + LAM1_ss *((1-omegae_ss*muE)*kappae_ss* ((1+RK_ss)/(1+R_ss)) -1 )     );

%---- resid e-16

ER(15) = (- Nw_ss + ggammaE*( ( (1-omegae_ss) - kappae_ss* (1-omegae_ss) ) * (1+RK_ss) * ( QK_ss*K_ss )   + (1-ddelta)*QK_ss*K_ss ) );

ER(16) = -Y_ss + (K_ss)^(aalpha) * (z_ss*L_ss)^(1-aalpha); 
ER(17) = -gg_ss + nng*Y_ss; 


ER(18) = -Lu_ss + xl * L_ss;

ER(19) = -Lc_ss  + (1-xl) * L_ss;



ER(20) = - lambda_hu_ss + lambda_hu_ss* bbeta *(1+R_ss);

ER(21) = - lambda_hc_ss + lambda_hc_ss* bbeta2 *(1+re_ss);



%ER(50) = -Fp_ss *  (Pstar_ss/PP_ss) + bbeta * nnup_pSS * Kp_ss ;
