var sigmaomegae_v, sigmaomegah_v, 
omegae_v, omegah_v, kappae_v, kappah_v,
nng_v, z_v, zetc_v,
PP_v, 
Fp_v, Kp_v, Pstar_v, LAM1_v,
Fpw_v, WW_v, Wstar_v,
Y_v,L_v, K_v, rk_v, R_v, Nw_v,
I_v, QK_v, RK_v, gg_v,
Lu_v, Lc_v,
lambda_hu_v, lambda_hc_v,
cc_v, cu_v
hh_v,  hh_c_v, hh_u_v,
dep_h_v
d_h_v
Qh_v
re_v
f_e_v
f_h_v
m_v
c_v
//DIFL_v
v_v
SS_v
QhF_v
resi_derr_v
gdpobs, consumptionobs,
Hloan_obs, CIloan_obs
govobs
default_h_obs default_e_obs
investobs
hours_obs
CIchargoff_obs, Hcharfoff_obs,
outputgap_v,
inflation1_v,
wealth_unconst_v, 
wealth_const_v 
//wealth_social_v
;

//Inflat_obs; 

varexo e4, e5, e6, e7, e1, e2, e3, e8, 
me9 
me13 me14 
me15 me16
e19
;

//me17 me18
//erk
// me17;
//me10 
//me11 me12 


parameters sigmaomegae_ss sigmaomegah_ss
rhosigmaomegae_ss rhosigmaomegah_ss rhosigmakappae_ss rhosigmakappah_ss
omegae_ss omegah_ss kappae_ss kappah_ss
rhoggg rhozz rhozetc
ddelta aalpha nnup_pSS
zetap zetal
RK_ss R_ss QK_ss 
PP_ss WW_ss Pstar_ss Wstar_ss LAM1_ss 
Nw_ss K_ss I_ss 
L_ss Y_ss gg_ss
Lu_ss Lc_ss
lambda_hu_ss lambda_hc_ss
cu_ss cc_ss
hh_SS
hh_c_SS
hh_u_SS
dep_h_ss
d_h_ss
Qhss
re_ss
f_e_ss
f_h_ss
m_ss
c_ss
DIFL
v_ss
SS_ss
QhF_ss
resi_derr_ss
bbeta 
bbeta2 
ssigl nnul
ssigl2
bb
bb2
rhoQh_ss
chih
Fpw_ss
Fp_ss Kp_ss
nng z_ss zetc_ss
ssii rk_ss
alphpi rhop alphdey alphakomegae alphakomegah
alpha_mm_e
alpha_mm_h
wealth_unconst_ss
wealth_const_ss 
//wealth_social_ss
inflation1_ss
;



load ss_model_RM.mat;
//for i=1:length(M_.params)
//    deep_parameter_name = M_.param_names(i,:);
//    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])
//end;




aalpha = 0.400000000000000;
alphakomegae= 0.517000000000000; 
alphakomegah = 0.517000000000000;

alpha_mm_e= 0.5; 
alpha_mm_h= 0.5; 

alphdey = 0.310000000000000;
alphpi = 1.817000000000000;
bb = 0.630000000000000;
bb2 = 0.630000000000000;
bbeta = 0.990000000000000; 
bbeta2 = 0.950000000000000;
c_ss = 0.114297997334664; 
cc_ss = 0.078966212242243;
chih = 1.500000000000000;
cu_ss = 0.035331785092421;
d_h_ss = 0.103196203310137;
ddelta = 0.025000000000000;
DDif = -0.025000000000000; 
dep_h_ss = 0.103196203310137;
DIFL = -4.962577277556335e-04; 
f_e_ss = 0.049479177869466;
f_h_ss = 0.008003620354198; 
Fp_ss = 0.270215697217567; 
Fpw_ss = 0.383222915370506; 
gg_ss = 0.041147279040479; 
ggammaE = 0.950000000000000;
hh_SS = 0.114297997334664;
hh_c_SS = 0.114297997334664;
hh_u_SS = 0.114297997334664;

hss_gdp = 0.500000000000000;
I_ss = 0.016164177798277;
IMkappae_ss = 0.052215467721777;
IMkappah_ss = 0.011914261990797;
K_ss = 0.646567111931064;
kappae_ss = 0.982013790037909;
kappah_ss = 0.982013790037909;
Kp_ss = 0.270215697217567;
L_ss = 0.114297997334664;
LAM1_ss = 0.833333333333333;
lambda_hc_ss = 13.741765045109230;
lambda_hu_ss = 28.785045090891630;
Lc_ss = 0.080008598134265;
Lu_ss = 0.034289399200399;
m_ss = 0.036526577656059;
muE = 0.940000000000000;
muH = 0.940000000000000;
muzstar_pSS = 1;
nng = 0.180000000000000;
nnul = 1.050000000000000;
nnul2 = 1.050000000000000;
nnup_pSS = 0.200000000000000;
Nw_ss = 0.610040534275005;
omegae_ss = 0.075858180021244;
omegah_ss = 0.075858180021244;
phi_l = 8.394735913178804e+02;
phi_l2 = 1.717536035570670e+02;
pi_ss = 1;
PP_ss = 1;
psilSS = 6.943698158831134;
Pstar_ss = 1;
QhF_ss = 2.877208490268647;
Qhss = 1;
QK_ss = 1;
R_ss = 0.010101010101010;
re_ss = 0.010101010101010;
resi_derr_ss = 1.877208490268647;
rhoggg = 0.730000000000000; 
rhop = 0.877000000000000;
rhoQh_ss = 0.522000000000000;
rhosigmakappae_ss = 0.522000000000000;
rhosigmakappah_ss = 0.522000000000000;
rhosigmaomegae_ss = 0.522000000000000;
rhosigmaomegah_ss = 0.522000000000000;
rhozetc = 0.721000000000000;
rhozz = 0.980000000000000;
rk_ss = 0.117851130197758;
RK_ss = 0.092851130197758;
sigmakappae_ss = 4;
sigmakappah_ss = 4 ;
sigmaomegae_ss = 2.500000000000000;
sigmaomegah_ss = 2.500000000000000;
SS_ss = 0.006834837457277;
ssigl = 1;
ssigl2 = 1;
ssii = 5;
std1_ggg = 0.021000000000000;
std1_Qh_ss = 0.060000000000000;
std1_sigmakappae_ss = 0.060000000000000;
std1_sigmakappah_ss = 0.060000000000000;
std1_sigmaomegae_ss = 0.060000000000000;
std1_sigmaomegah_ss = 0.060000000000000;
std1_zetc = 0.090000000000000;
std1_zz = 0.030000000000000;
v_ss = 0.642147930815795;
Wstar_ss = 1;
WW_ss = 1 ;
xl = 0.300000000000000;
Y_ss = 0.228595994669328;
z_ss = 1;
zetal = 0.771000000000000;
zetap = 0.702000000000000;
zetc_ss = 1;

wealth_unconst_ss = bbeta  *(cu_ss  - bb  * cu_ss)  - Lu_ss   + chih*hh_u_SS;
wealth_const_ss   = bbeta2 *(cc_ss  - bb2 * cc_ss)  - Lc_ss   + chih*hh_c_SS;
//wealth_social_ss  = (1-bbeta) * wealth_unconst_ss + (1-bbeta2) * wealth_const_ss ; 


inflation1_ss = 2;



model(linear);





1/wealth_unconst_ss* wealth_unconst_v = bbeta  *(1/cu_ss* cu_v  - bb  *1/cu_ss* cu_v(-1))  - 1/Lu_ss * Lu_v  + chih*1/hh_u_SS*hh_u_v;
1/wealth_const_ss * wealth_const_v   = bbeta2 *(1/cc_ss*cc_v  - bb2 * 1/cc_ss*cc_v(-1))    - 1/Lc_ss * Lc_v  + chih*1/hh_c_SS*hh_c_v;
//1/wealth_social_ss*wealth_social_v  = (1-bbeta) * 1/wealth_const_ss*wealth_unconst_v + (1-bbeta2) * 1/wealth_unconst_ss* wealth_const_v ; 



outputgap_v =  Y_v - Y_ss ;
inflation1_v = PP_v - PP_v(-1);



// exogenous 
sigmaomegae_v = e4 + rhosigmaomegae_ss*sigmaomegae_v(-1);

sigmaomegah_v = e5 + rhosigmaomegah_ss*sigmaomegah_v(-1);

1/omegae_ss*omegae_v  -  sigmaomegae_ss * sigmaomegae_v;

1/omegah_ss*omegah_v  -  sigmaomegah_ss * sigmaomegah_v ;

kappae_v = e6 + rhosigmakappae_ss*kappae_v(-1) -  alphakomegae *(omegae_v(-1) - omegae_ss)   -  alpha_mm_e * ( m_v  - m_v(-1) )   ;
//kappae_v = e6 + rhosigmakappae_ss*kappae_v(-1) -  (1-rhosigmakappae_ss)*alphakomegae *omegae_v(-1)   - (1-rhosigmakappae_ss)* alpha_mm_e * ( m_v  - m_v(-1) )   ;
//kappae_v = e6 + rhosigmakappae_ss*kappae_v(-1) +  alphakomegae *omegae_v(-1) ;

kappah_v = e7 +  rhosigmakappah_ss*kappah_v(-1) - alphakomegah *( omegah_v(-1) - omegah_ss ) -   alpha_mm_h * ( d_h_v - d_h_v(-1) )       ;
//kappah_v = e7 +  rhosigmakappah_ss*kappah_v(-1) - (1-rhosigmakappah_ss)*alphakomegah *omegah_v(-1)  -  (1-rhosigmakappah_ss)* alpha_mm_h * ( d_h_v - d_h_v(-1) )       ;
//kappah_v = e7 +  rhosigmakappah_ss*kappah_v(-1) + alphakomegah *omegah_v(-1)   ;

nng_v   =   e1 + rhoggg*nng_v(-1);

z_v =  e2 + rhozz*z_v(-1);

zetc_v = e3 + rhozetc*zetc_v(-1);

//zetap * Pstar_v          =  PP_v  - (1-zetap)*PP_v(-1) ;
zetap * Pstar_v          =  PP_v  - (1-zetap)*PP_v(-1) ;







Fp_v  = LAM1_v   + Y_v  + bbeta * (1-zetap) * PP_v(-1)  - bbeta *  (1-zetap) * PP_v   + bbeta * (1-zetap) * Fp_v(+1) ;


Kp_v = z_v  +  Y_v   + LAM1_v   + bbeta *(1-zetap) * Kp_v(+1) ;


//-(1+nnup_pSS)*LAM1_v(+1) + Pstar_v  - PP_v(+1)  ;
-(1+nnup_pSS)* ((1-aalpha) *z_v(+1) +  (1-aalpha) *L_v(+1)  - (1-aalpha) *  K_v(+1) ) + Pstar_v  - PP_v(+1)  ;// replaced by


//-(1+nnup_pSS)*1/LAM1_ss*LAM1_v + 1/Pstar_ss*Pstar_v(-1)  - 1/PP_ss*PP_v  ;



zetal * Wstar_v         = WW_v  - (1-zetal) *  WW_v(-1)  ;


1/nnul*LAM1_v   + 1/(nnul-1) *  Wstar_v   + 1/nnul*L_v  +  nnul/(1-nnul) *Wstar_v   + (1-zetal)* bbeta * Fpw_v(+1) -   Fpw_v   ; 
//1/nnul*LAM1_v   -  Wstar_v   + 1/nnul*L_v     + (1-zetal)* bbeta * Fpw_v(+1) -   Fpw_v   ; 


//1/nnul*1/LAM1_ss*LAM1_v(-1)   + 1/(nnul-1) * 1/Wstar_ss * Wstar_v(-1)   + 1/nnul*1/L_ss*L_v(-1)  +  nnul/(1-nnul)* 1/Wstar_ss *Wstar_v(-1)   + (1-zetal)* bbeta * 1/Fpw_ss * Fpw_v - 1/Fpw_ss * Fpw_v(-1)   ; 

// THIS WORKS
//(1+ssigl)*(nnul/(nnul-1))*1/Wstar_ss*Wstar_v  +  1/zetc_ss*zetc_v   +  (1+ssigl)*1/L_ss* L_v   +    1/Fpw_ss * Fpw_v(+1)  + 1/WW_ss * WW_v(+1)  +  (-zetal/(1-zetal)) *(1/(1-nnul)) *  (1-nnul*(1+ssigl)) *1/Wstar_ss * Wstar_v  -  1/Fpw_ss * Fpw_v  -  1/WW_ss * WW_v   ;
//(1+ssigl)*(nnul/(nnul-1))*1/Wstar_ss*Wstar_v  +  1/zetc_ss*zetc_v   +  (1+ssigl)*1/L_ss* L_v   +   (nnul*(1+ssigl))/(1-nnul) * 1/Wstar_ss * Wstar_v  +  1/Fpw_ss * Fpw_v(+1)  + 1/WW_ss * WW_v(+1)  +  (-zetal/(1-zetal)) *(1/(1-nnul)) *  (1-nnul*(1+ssigl)) *1/Wstar_ss * Wstar_v  -  1/Fpw_ss * Fpw_v  -  1/WW_ss * WW_v  -  (-zetal/(1-zetal)) * (1/(1-nnul)) * ( 1-nnul*(1 + ssigl)) * 1/Wstar_ss * Wstar_v ; // this works
//(1+ssigl)*(nnul/(nnul-1))*1/Wstar_ss*Wstar_v(-1)  +  1/zetc_ss*zetc_v(-1)   +  (1+ssigl)*1/L_ss* L_v(-1)   +   (nnul*(1+ssigl))/(1-nnul) * 1/Wstar_ss * Wstar_v(-1)  +  1/Fpw_ss * Fpw_v  + 1/WW_ss * WW_v  +  (-zetal/(1-zetal)) *(1/(1-nnul)) *  (1-nnul*(1+ssigl)) *1/Wstar_ss * Wstar_v(-1)  -  1/Fpw_ss * Fpw_v(-1)  -  1/WW_ss * WW_v(-1)  -  (-zetal/(1-zetal)) * (1/(1-nnul)) * ( 1-nnul*(1 + ssigl)) * 1/Wstar_ss * Wstar_v(-1) ;
//(1+ssigl)*(nnul/(nnul-1))*1/Wstar_ss*Wstar_v  +  1/zetc_ss*zetc_v   +  (1+ssigl)*1/L_ss* L_v   +    1/Fpw_ss * Fpw_v(+1)  + 1/WW_ss * WW_v(+1)  +  (-zetal/(1-zetal)) *(1/(1-nnul)) *  (1-nnul*(1+ssigl)) *1/Wstar_ss * Wstar_v  -  1/Fpw_ss * Fpw_v  -  1/WW_ss * WW_v   ;
//CHEN CURDIA FERRERO
//(1-zetal)* 1/((1+(1+nnul)/nnul)+ssigl)*1/Fpw_ss * Fpw_v - (1-zetal)* 1/((1+(1+nnul)/nnul)+ssigl) *1/Wstar_ss*Wstar_v + zetal * 1/WW_ss * WW_v(-1) - 1/WW_ss * WW_v; 
(1-zetal)* 1/((1+(1+nnul)/nnul)+ssigl) * Fpw_v + (1-zetal)* 1/((1+(1+nnul)/nnul)+ssigl) *Wstar_v + zetal * WW_v(-1) -  WW_v; 


//1/K_ss*K_v = (1-ddelta)*1/K_ss*K_v(-1)  + 1/I_ss*I_v - ssii * 1/I_ss*I_v  +  ssii * 1/I_ss*I_v(-1) ;  

K_v = (1-ddelta)*K_v(-1)  + ddelta *I_v - ssii * I_v  +  ssii * I_v(-1) ;  
//K_v = (1-ddelta)*K_v(-1)  + ddelta *I_v  +  ssii * I_v(-1) ;  // with 

// - QK_v     + ssii* I_v   - ssii* I_v(-1)   + ssii * I_v   -  ssii* I_v(-1)  + ssii*  I_v  - ssii*  I_v(-1)    -  ssii*  bbeta * I_v(+1)  + ssii*  bbeta * I_v  + ssii*  bbeta *  I_v(+1)   - ssii*  bbeta  * I_v ;

//- 1/LAM1_ss*LAM1_v  - 1/QK_ss* QK_v  + 1/LAM1_ss*LAM1_v   + ssii* 1/I_ss * I_v   - ssii*1/I_ss * I_v(-1)   + ssii * 1/I_ss * I_v   -  ssii*1/I_ss * I_v(-1)  + ssii* 1/I_ss * I_v  - ssii* 1/I_ss* I_v(-1)   -  ssii*  bbeta * 1/LAM1_ss * LAM1_v(+1)  -  ssii*  bbeta * 1/I_ss * I_v(+1)  + ssii*  bbeta * 1/I_ss * I_v  + ssii*  bbeta * 1/I_ss *  I_v(+1)   - ssii*  bbeta * 1/I_ss * I_v ;

//-  QK_v     + ssii* I_v   - ssii* I_v(-1)   + ssii  * I_v    -  ssii * I_v(-1)  + ssii  * I_v  - ssii * I_v(-1)   -  ssii*  bbeta  * LAM1_v(+1)   ;



 - QK_v     + ssii* I_v   - ssii* I_v(-1)   + ssii * I_v   -  ssii* I_v(-1)  + ssii*  I_v  - ssii*  I_v(-1)    -  ssii*  bbeta * I_v(+1)  + ssii*  bbeta * I_v  + ssii*  bbeta *  I_v(+1)   - ssii*  bbeta  * I_v ;
// QK_v     - ssii* I_v   + ssii* I_v(-1)    +  ssii*  bbeta * I_v(+1)  - ssii*  bbeta * I_v  ; // with 



 
// wage should be predetermined
//1/LAM1_ss * LAM1_v(+1)   =  aalpha *1/rk_ss *rk_v  + (1-aalpha)* 1/WW_ss * WW_v(+1) ; // works
//1/LAM1_ss * LAM1_v(+1)   =  aalpha *1/rk_ss *rk_v  + (1-aalpha)* 1/WW_ss * WW_v ; // works
//1/LAM1_ss * LAM1_v   =  aalpha *1/rk_ss *rk_v  + (1-aalpha)* 1/WW_ss * WW_v ; // not working
//1/LAM1_ss * LAM1_v   =  aalpha *1/rk_ss *rk_v  + (1-aalpha)* 1/WW_ss * WW_v(-1) ; // works

LAM1_v(+1)   =  aalpha  *rk_v + (1-aalpha)*  WW_v ; // 


//88888
 //-  1/RK_ss*RK_v(+1)  + 1/rk_ss*rk_v  +   1/QK_ss*QK_v(+1)  - 1/QK_ss*QK_v    ; 
// -  1/RK_ss*RK_v(+1)  + 1/rk_ss*rk_v  +   1/QK_ss*QK_v(+1) - 1/QK_ss*QK_v   ; 
// bgg
 //-  1/RK_ss*RK_v + 1/rk_ss*rk_v  +   (1-ddelta)* 1/QK_ss*QK_v - 1/QK_ss*QK_v(-1)   ; 
// -  RK_v(+1) + rk_v  +   (1-ddelta)* QK_v(+1) - QK_v   ; 

// -  RK_v(+1) + rk_v  +   (1-ddelta)* QK_v(+1) - QK_v   ; 
 -  RK_v(+1) + bbeta*rk_v  +   (1-ddelta)* QK_v(+1) - QK_v   ; 

// -  RK_v(+1) + bbeta*rk_v  +    QK_v(+1) - (1-ddelta)*QK_v   ; 



//-1/rk_ss*rk_v +  1/LAM1_ss*LAM1_v  +   (1-aalpha) *1/z_ss*z_v +  (1-aalpha)* 1/L_ss *L_v  - (1-aalpha) * 1/K_ss * K_v  ;
- rk_v +   (1-aalpha) *z_v +  (1-aalpha) *L_v  - (1-aalpha) *  K_v  ;



//- 1/L_ss * L_v  -  (1/-aalpha) *(1/z_ss) *z_v  + (1/-aalpha) * (1/WW_ss)* WW_v    -  (1/-aalpha)  * (1/LAM1_ss) *LAM1_v  -  aalpha * 1/K_ss * K_v   ;
-  L_v  -  (1/-aalpha)  *z_v  + (1/-aalpha) *  WW_v      -  aalpha  * K_v   ;



//1/RK_ss * RK_v  -  1/omegae_ss * omegae_v   + 1/omegae_ss * omegae_v  -  1/ kappae_ss * kappae_v   + 1/Nw_ss * Nw_v   + 1/LAM1_ss * LAM1_v   + 1/kappae_ss * kappae_v  - 1/omegae_ss *omegae_v  + 1/RK_ss* RK_v  - 1/R_ss* R_v ;
// ok
//1/RK_ss * RK_v    -  1/omegae_ss * omegae_v    + 1/Nw_ss * Nw_v   + 1/LAM1_ss * LAM1_v     - 1/RK_ss* RK_v  - 1/R_ss* R_v;

//ok works 8888
 //-1/RK_ss * RK_v       + 1/Nw_ss * Nw_v   - 1/LAM1_ss * LAM1_v     - 1/omegae_ss *omegae_v  - 1/RK_ss* RK_v  + 1/R_ss* R_v ;
// bgg
//- 1/RK_ss * RK_v(+1)      + 1/Nw_ss * Nw_v   - 1/LAM1_ss * LAM1_v     + 1/omegae_ss *omegae_v   -  1/ kappae_ss * kappae_v  + 1/R_ss* R_v ;


 RK_v(+1)  -  R_v     -  Nw_v       +  omegae_v  +   kappae_v  ;

// RK_v(+1)  -  R_v     -  Nw_v       +  omegae_v  +   kappae_v  ;
// RK_v(+1)  -  R_v(+1)     -  Nw_v       +  omegae_v  +   kappae_v   -  omegae_v  -   kappae_v  ;
// RK_v(+1)  -  R_v(+1)     -  Nw_v       ;


// RK_v(+1)  -  R_v(+1)    =    Nw_v       -  omegae_v  -   kappae_v  ;


// + 1/LAM1_ss * LAM1_v 

// bgg
// 1/rk_ss * rk_v(+1)   - 1/R_ss* R_v =   - 1/Nw_ss * Nw_v    + 1/QK_ss * QK_v  +   1/K_ss * K_v(+1)   ;
 //1/rk_ss * rk_v(+1)    - 1/R_ss* R_v =  + 1/omegae_ss * omegae_v  -  1/ kappae_ss * kappae_v  - 1/Nw_ss * Nw_v(+1)    + 1/QK_ss * QK_v(+1) +   1/K_ss * K_v(+1)    ;




// coorected
//- 1/Nw_ss* Nw_v(+1) -  1/kappae_ss* kappae_v  +  1/RK_ss *RK_v  +  1/K_ss * K_v +  1/QK_ss * QK_v(-1)  +   1/K_ss * K_v    +  1/QK_ss * QK_v(-1)  ;
//ok works 8888
//- 1/Nw_ss* Nw_v(+1)    +  1/RK_ss *RK_v  +  1/K_ss * K_v +  1/QK_ss * QK_v(-1)  +   1/K_ss * K_v    +  1/QK_ss * QK_v(-1)  ;
//- 1/Nw_ss* Nw_v(+1) - 1/omegae_ss*omegae_v  + 1/omegae_ss*omegae_v  -  1/kappae_ss* kappae_v  +  1/RK_ss *RK_v  +  1/K_ss * K_v +  1/QK_ss * QK_v(-1)  +   1/K_ss * K_v    +  1/QK_ss * QK_v(-1)  ;

// try
// bgg
-  Nw_v   -   kappae_v  +   RK_v   -  R_v(-1)  +   K_v(-1) +   QK_v(-1)  +   Nw_v(-1)   ;
//-  Nw_v   -   kappae_v   + omegae_v  +   RK_v   -  R_v  +   K_v(-1) +   QK_v(-1)  +   Nw_v(-1)   ;

//-  Nw_v   +   kappae_v   - omegae_v  +   RK_v   -  R_v  +   K_v(-1) +   QK_v(-1)  +   Nw_v(-1)   ;


//-  Nw_v   -   kappae_v  +   RK_v   -  R_v(-1)  +   K_v(-1) +   QK_v(-1)  +   Nw_v(-1)   ;


- Y_v  + aalpha * K_v + (1-aalpha) *  z_v  +  (1-aalpha) *L_v ; 


//R_v  - rhop*  R_v(-1) 
//- (1-rhop)*alphpi* ( PP_v )  
//- (1-rhop)*alphdey* ( Y_v  ) - e19 ;


R_v  - rhop*  R_v(-1) 
- (1-rhop)*alphpi* (  (PP_v - PP_ss )    )  
- (1-rhop)*alphdey* ( Y_v  ) - e19 ;

- gg_v +  nng_v  + Y_v ; 





 Lu_v   =   L_v ;

 Lc_v  =   L_v;

ssigl  * Lu_v  =  WW_v  +  lambda_hu_v ;
ssigl2 * Lc_v  =  WW_v  +  lambda_hc_v ;


lambda_hu_v -  zetc_v  +  PP_v  +  cu_v  - bb* cu_v(-1) + bb*bbeta*zetc_v(+1)   ;

lambda_hu_v  +     Qh_v    -  chih *  hh_u_v   -  bbeta * Qh_v   - bbeta * lambda_hu_v(+1)  ;


lambda_hc_v  -  zetc_v  +  PP_v  +  cc_v  -  bb2 *cc_v(-1) + bb2*bbeta2*zetc_v(+1)   ;


// we assume hh to be exogenous instead of being determinstic;
hh_v = e8 + rhoQh_ss*hh_v(-1);

hh_c_v + hh_u_v = hh_v ;


cu_v   =  WW_v  +  Lu_v    +  Qh_v  +   hh_u_v(-1)   -  dep_h_v     +   R_v(-1)  -  Qh_v   +  hh_u_v   - ( PP_v - PP_v(-1));
- dep_h_v(-1)  +  d_h_v ;
//5/27/2022
// - d_h_v(-1)    +  omegah_v   +  kappah_v  +  Qh_v   +  hh_v(-1)   +   omegah_v  +   kappah_v  +  Qh_v    +   hh_v(-1) -   R_v  ;
//- d_h_v(-1)    +  omegah_v   +  kappah_v  +  Qh_v   +  hh_v(-1)     +  Qh_v    +   hh_v(-1) -   R_v  ;
- d_h_v(-1)    +  omegah_v   +  kappah_v  +  Qh_v   +  hh_c_v(-1)   +   omegah_v  +   kappah_v  +  Qh_v    +   hh_c_v(-1) -   R_v  ;

// cc_v  =   WW_v  +   Lc_v +  Qh_v  +   hh_v(-1)   +   d_h_v   -  Qh_v   +  hh_v  -  d_h_v(-1) +  re_v ;
 cc_v  =   WW_v  +   Lc_v +  Qh_v  +   hh_c_v(-1)   +   d_h_v   -  Qh_v   +  hh_c_v  -  d_h_v(-1) +  re_v  - ( PP_v - PP_v(-1));



- f_e_v  +  omegae_v(-1)  +  kappae_v(-1) +  K_v(-1)  +   QK_v(-1) +   RK_v(-1) ;
- f_h_v  +   omegah_v(-1)  +  kappah_v(-1)  +   hh_v(-1)  +  Qh_v(-1) ;

// 88888
//1/m_ss * m_v  = 1/QK_ss * QK_v + 1/K_ss * K_v  - 1/Nw_ss * Nw_v;
// bgg
m_v  =  QK_v  + K_v  -  Nw_v(+1) ;

c_v  =  cc_v  +  cu_v ;


//DIFL_v  +  c_v  =  Y_v   -  I_v  -  f_e_v(-1)  -  f_h_v(-1)  -  gg_v ;


// 888
//1/v_ss * v_v  = - 1/omegae_ss * omegae_v  - 1/kappae_ss * kappae_v   + 1/omegae_ss *omegae_v  +  1/RK_ss *RK_v   +  1/QK_ss * QK_v(-1)  + 1/K_ss * K_v(-1)  - 1/Nw_ss * Nw_v(-1)  + 1/Nw_ss * Nw_v(-1)  + 1/Nw_ss * Nw_v(-1) + 1/R_ss * R_v - 1/R_ss * R_v  + 1/QK_ss*QK_v(-1)  +  1/K_ss * K_v(-1) ;
//bgg
//v_v  = -  omegae_v  -  kappae_v   +  omegae_v  +   RK_v   +   QK_v(-1)  +  K_v(-1)  -  Nw_v(-1)  +  Nw_v(-1)  +  Nw_v(-1) +  R_v -  R_v  + QK_v(-1)  +   K_v(-1) ;
//
v_v  = -  omegae_v(+1)  -  kappae_v(+1)   +  omegae_v(+1)  +   RK_v(+1)   +   QK_v  +  K_v  +  Nw_v +  R_v(+1) -  R_v(+1)  + QK_v  +   K_v ;
//v_v  =  -  kappae_v(+1)    +   RK_v(+1)   +   QK_v  +  K_v  +  Nw_v  + QK_v  +   K_v ;



SS_v  =  QK_v -  v_v  +  K_v ;


//QhF_v = - chih*hh_v - chih*lambda_hc_v +  kappah_v  +  Qh_v  +  lambda_hc_v  -  re_v -  lambda_hc_v + bbeta2*lambda_hc_v(+1)   - bbeta2*lambda_hc_v  - bbeta2*Qh_v(+1)  ;
//QhF_v = - chih*hh_v  - (chih+ bbeta2)*lambda_hc_v  +  kappah_v  +  Qh_v   -  re_v + bbeta2*lambda_hc_v(+1)    - bbeta2*Qh_v(+1)  ;

QhF_v = - chih*hh_c_v - chih*lambda_hc_v +  kappah_v  +  Qh_v  +  lambda_hc_v  -  re_v -  lambda_hc_v + bbeta2*lambda_hc_v(+1)   - bbeta2*lambda_hc_v  - bbeta2*Qh_v(+1)  ;




resi_derr_v  = QhF_v  -  Qh_v ;



gdpobs         = Y_v + me9 ;//
consumptionobs = c_v ; 
CIloan_obs = m_v    ;//+me17
Hloan_obs = d_h_v   ;//+me18

investobs  =  I_v + me13;
hours_obs  = L_v  + me14;


CIchargoff_obs = f_e_v + me15 ;//
Hcharfoff_obs = f_h_v  + me16 ;//

govobs = gg_v  ; 


default_h_obs  = omegah_v ;//+ me10
default_e_obs  =  omegae_v  ; 
 
//Inflat_obs = PP_v;


end;



shocks;
var e4; stderr 1;
var e5; stderr 1;
var e6; stderr 1;
var e7 ; stderr 1;
var e1; stderr 1; 
var e2 ; stderr 1;
var e3  ; stderr 1;  

var e8  ; stderr 1;

var me9; stderr 1;
var e19; stderr 1; 
 

var me13; stderr 1;
var me14 ; stderr 1; 
var me15; stderr 1;  
var me16; stderr 1;
end;


//var me17  = 0.09^2;
//var me18  = 0.09^2;
 
//var me17  = 0.0001^2
//var erk = 0.01^2;  
//var me10  = 0.0001^2;  
//var me11  = 0.0001^2;  
//var me12  = 0.0001^2;  


model_diagnostics;


//resid(1);

check;


//resid(1);

model_diagnostics;

steady;
check;
model_diagnostics;
stoch_simul(order=1,irf=151);


write_latex_dynamic_model;

//varobs gdpobs, consumptionobs,
//Hloan_obs, CIloan_obs,
//govobs, 
//default_h_obs default_e_obs
//investobs
//hours_obs
//CIchargoff_obs, Hcharfoff_obs;
//, Inflat_obs;



//estimated_params;
//bb, BETA_PDF, 0.5, 0.1;         //Consumption habit
//bb2, BETA_PDF, 0.5, 0.1;         //Consumption habit

//zetal, BETA_PDF, 0.75, 0.1;     //Calvo wage stickiness
//zetap, BETA_PDF, 0.75, 0.1;      //Calvo price stickiness

//muE,  BETA_PDF, 0.75, 0.15;    //Monitoring cost entrepreneur
//muH,  BETA_PDF, 0.75, 0.15;    //Monitoring cost household

//ssii, NORMAL_PDF, 5,   0.1;        //Investment adjust. cost curvature 

//alphpi, NORMAL_PDF, 1.5, 0.25;  //Taylor rule inflation coefficient
//alphdey, NORMAL_PDF, 0.25, 0.1; //Taylor rule output coefficient
//rhop, BETA_PDF, 0.5, 0.1;      //Taylor rule smoothing

//rhoggg, BETA_PDF, 0.7, 0.1; 
//rhozz, BETA_PDF, 0.7, 0.1; 
//rhozetc, BETA_PDF, 0.7, 0.1;
//rhosigmaomegae_ss, BETA_PDF, 0.7, 0.1; 
//rhosigmaomegah_ss, BETA_PDF, 0.7, 0.1; 
//rhosigmakappae_ss, BETA_PDF, 0.7, 0.1; 
//rhosigmakappah_ss, BETA_PDF, 0.7, 0.1;

//stderr e1,INV_GAMMA2_PDF,0.001,Inf;  //
//stderr e2,INV_GAMMA2_PDF,0.001,Inf;   
//stderr e3,INV_GAMMA2_PDF,0.001,Inf;  
//stderr e4,INV_GAMMA2_PDF,0.001,Inf;   
//stderr e5,INV_GAMMA2_PDF,0.001,Inf;   //
//stderr e6,INV_GAMMA2_PDF,0.001,Inf;   
//stderr e7,INV_GAMMA2_PDF,0.001,Inf;  //


//stderr e8,INV_GAMMA2_PDF,0.001,Inf;   

//stderr me9,INV_GAMMA2_PDF,0.001,Inf;  //


//stderr e19,INV_GAMMA2_PDF,0.001,Inf;  //

//stderr me13,INV_GAMMA2_PDF,0.001,Inf;   
//stderr me14,INV_GAMMA2_PDF,0.001,Inf;  //
//stderr me15,INV_GAMMA2_PDF,0.001,Inf;   
//stderr me16,INV_GAMMA2_PDF,0.001,Inf;  //


//alphakomegae,  BETA_PDF, 0.5, 0.1;
//alphakomegah, BETA_PDF, 0.5, 0.1;


//alpha_mm_e,  BETA_PDF, 0.5, 0.1;
//alpha_mm_h, BETA_PDF, 0.5, 0.1;



//end;




//estimated_params_init(use_calibration);
//end;


//options_.prior_trunc=0;

//options_.debug=1

//identification(ar=10);
// mode_compute=6
//estimation(datafile=datalogdiff84,mode_check,diffuse_filter,mh_nblocks=4,mh_replic=10000,mh_jscale=3,mh_init_scale=0.2,mode_compute=4, moments_varendo, bayesian_irf, conf_sig=0.90)gdpobs, consumptionobs,
//Hloan_obs, CIloan_obs, 
//govobs,
//investobs,
//hours_obs,
//CIchargoff_obs, Hcharfoff_obs;









// Exercice II : IRF plots


stoch_simul(order=1,irf=151,nograph,nocorr,nofunctions,simul_replic=1000);



t = 1:1:10
figure ('Name','Response to a collateral shocks')
subplot(2,2,1) % Output
plot(t,kappae_v_e4(1:10))
subplot(2,2,2) % Output
plot(t,kappah_v_e5(1:10))
figure ('Name','Response to a collateral shocks')

subplot(2,2,3) % Output
plot(t,omegae_v_e6(1:10))
subplot(2,2,4) % Output
plot(t,omegah_v_e7(1:10))






save irf_plot_with_both_housing_in_util_policy c_v_e5 c_v_e7 c_v_e6 c_v_e4...
Y_v_e4 Y_v_e5 Y_v_e6 Y_v_e7...
L_v_e4 L_v_e5 L_v_e6 L_v_e7...
kappae_v_e4 kappah_v_e5...
m_v_e4 m_v_e5 m_v_e6 m_v_e7...
d_h_v_e4 d_h_v_e5 d_h_v_e6 d_h_v_e7...
Y_v_e19 L_v_e19 c_v_e19 d_h_v_e19  m_v_e19...
omegae_v_e19 omegae_v_e6 omegae_v_e4...
omegah_v_e19 omegah_v_e7 omegah_v_e5...
Qh_v_e19 outputgap_v_e19 inflation1_v_e19...
wealth_unconst_v_e19 wealth_const_v_e19;

//Y_v_e8 L_v_e8 c_v_e8 d_h_v_e8  m_v_e8 Qh_v_e8 outputgap_v_e8 inflation1_v_e8...
// wealth_social_v_e19;
