
ALLSTPRIOR = sqrt(bayestopt_.p2.^2); % this compute the standard deviation for prior 

 
 


 if true
 
fid = fopen('tabpriormain.xls','w+');



  % shocks
fprintf(fid, '%30s \t %s \t %30s  \t %5s   \t %5s   \t %5s   \t %5s   \t %5s   \t %5s    \t %5s    \n','','','','Distribution','Prior mean','prior standard deviation','posterior mean','posterior median','posterior mode','posterior standard deviation');


fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{g}',' St. dev. Gov. Spend. Shock ',bayestopt_.name{1}, bayestopt_.pshape(1), oo_.prior.mean(1), ALLSTPRIOR(1), oo_.posterior_mean.shocks_std.e1, oo_.posterior_median.shocks_std.e1, oo_.posterior_mode.shocks_std.e1, oo_.posterior_std.shocks_std.e1);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{z}','St. dev. Tech. Shock',bayestopt_.name{2}, bayestopt_.pshape(2), oo_.prior.mean(2), ALLSTPRIOR(2), oo_.posterior_mean.shocks_std.e2, oo_.posterior_median.shocks_std.e2, oo_.posterior_mode.shocks_std.e2, oo_.posterior_std.shocks_std.e2);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\zeta_{c}}','St. dev. Cons. Pref. Shock',bayestopt_.name{3}, bayestopt_.pshape(3), oo_.prior.mean(3), ALLSTPRIOR(3), oo_.posterior_mean.shocks_std.e3, oo_.posterior_median.shocks_std.e3, oo_.posterior_mode.shocks_std.e3, oo_.posterior_std.shocks_std.e3);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\sigma_{e}}','St. dev. B. Loan Delinq. Rate. Shock',bayestopt_.name{4}, bayestopt_.pshape(4), oo_.prior.mean(4), ALLSTPRIOR(4), oo_.posterior_mean.shocks_std.e4, oo_.posterior_median.shocks_std.e4, oo_.posterior_mode.shocks_std.e4, oo_.posterior_std.shocks_std.e4);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\sigma_{h}}','St. dev. R. E. Loan Delinq. Rate. Shock',bayestopt_.name{5}, bayestopt_.pshape(5), oo_.prior.mean(5), ALLSTPRIOR(5), oo_.posterior_mean.shocks_std.e5, oo_.posterior_median.shocks_std.e5, oo_.posterior_mode.shocks_std.e5, oo_.posterior_std.shocks_std.e5);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\kappa_{e}}','St. dev. B. Loan Coll. Requir. Shock',bayestopt_.name{6}, bayestopt_.pshape(6), oo_.prior.mean(6), ALLSTPRIOR(6), oo_.posterior_mean.shocks_std.e6, oo_.posterior_median.shocks_std.e6, oo_.posterior_mode.shocks_std.e6, oo_.posterior_std.shocks_std.e6);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\kappa_{h}}','St. dev. R. E. Loan Coll. Requir. Shock',bayestopt_.name{7}, bayestopt_.pshape(7), oo_.prior.mean(7), ALLSTPRIOR(7), oo_.posterior_mean.shocks_std.e7, oo_.posterior_median.shocks_std.e7, oo_.posterior_mode.shocks_std.e7, oo_.posterior_std.shocks_std.e7);

fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{h}','St. dev. R. E. Volume Shock ',bayestopt_.name{8}, bayestopt_.pshape(8), oo_.prior.mean(8), ALLSTPRIOR(8), oo_.posterior_mean.shocks_std.e8, oo_.posterior_median.shocks_std.e8, oo_.posterior_mode.shocks_std.e8, oo_.posterior_std.shocks_std.e8);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{9}}','measurement error 9',bayestopt_.name{9}, bayestopt_.pshape(9), oo_.prior.mean(9), ALLSTPRIOR(9), oo_.posterior_mean.shocks_std.me9, oo_.posterior_median.shocks_std.me9, oo_.posterior_mode.shocks_std.me9, oo_.posterior_std.shocks_std.me9);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\rho}','St. dev. M. P. Shock',bayestopt_.name{10}, bayestopt_.pshape(10), oo_.prior.mean(10), ALLSTPRIOR(10), oo_.posterior_mean.shocks_std.e19, oo_.posterior_median.shocks_std.e19, oo_.posterior_mode.shocks_std.e19, oo_.posterior_std.shocks_std.e19);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{13}}','measurement error 13',bayestopt_.name{11}, bayestopt_.pshape(11), oo_.prior.mean(11), ALLSTPRIOR(11), oo_.posterior_mean.shocks_std.me13, oo_.posterior_median.shocks_std.me13, oo_.posterior_mode.shocks_std.me13, oo_.posterior_std.shocks_std.me13);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{14}}','measurement error 14',bayestopt_.name{12}, bayestopt_.pshape(12), oo_.prior.mean(12), ALLSTPRIOR(12), oo_.posterior_mean.shocks_std.me14, oo_.posterior_median.shocks_std.me14, oo_.posterior_mode.shocks_std.me14, oo_.posterior_std.shocks_std.me14);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{15}}','measurement error 15',bayestopt_.name{13}, bayestopt_.pshape(13), oo_.prior.mean(13), ALLSTPRIOR(13), oo_.posterior_mean.shocks_std.me15, oo_.posterior_median.shocks_std.me15, oo_.posterior_mode.shocks_std.me15, oo_.posterior_std.shocks_std.me15);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{16}}','measurement error 16',bayestopt_.name{14}, bayestopt_.pshape(14), oo_.prior.mean(14), ALLSTPRIOR(14), oo_.posterior_mean.shocks_std.me16, oo_.posterior_median.shocks_std.me16, oo_.posterior_mode.shocks_std.me16, oo_.posterior_std.shocks_std.me16);

  
 %Distributions : INV_GAMMA2_PDF = 6, BETA_PDF = 1, NORMAL_PDF = 3,   (I change it manually in )
   %  parameteres 

 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Habit parameter','b_{u}',bayestopt_.name{15}, bayestopt_.pshape(15), oo_.prior.mean(15), ALLSTPRIOR(15), oo_.posterior_mean.parameters.bb, oo_.posterior_median.parameters.bb, oo_.posterior_mode.parameters.bb, oo_.posterior_std.parameters.bb);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Habit parameter','b_{c}',bayestopt_.name{16}, bayestopt_.pshape(16), oo_.prior.mean(16), ALLSTPRIOR(16), oo_.posterior_mean.parameters.bb2, oo_.posterior_median.parameters.bb2, oo_.posterior_mode.parameters.bb2, oo_.posterior_std.parameters.bb2);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Calvo wage stickiness','\zeta_{l}',bayestopt_.name{17}, bayestopt_.pshape(17), oo_.prior.mean(17), ALLSTPRIOR(17), oo_.posterior_mean.parameters.zetal, oo_.posterior_median.parameters.zetal, oo_.posterior_mode.parameters.zetal, oo_.posterior_std.parameters.zetal);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Calvo price stickiness','\zeta_{p}',bayestopt_.name{18}, bayestopt_.pshape(18), oo_.prior.mean(18), ALLSTPRIOR(18), oo_.posterior_mean.parameters.zetap, oo_.posterior_median.parameters.zetap, oo_.posterior_mode.parameters.zetap, oo_.posterior_std.parameters.zetap);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Investment adjustment cost curvature','S',bayestopt_.name{19}, bayestopt_.pshape(19), oo_.prior.mean(19), ALLSTPRIOR(19), oo_.posterior_mean.parameters.ssii, oo_.posterior_median.parameters.ssii, oo_.posterior_mode.parameters.ssii, oo_.posterior_std.parameters.ssii);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Policy weight on inflation','\alpha^{\pi}',bayestopt_.name{20}, bayestopt_.pshape(20), oo_.prior.mean(20), ALLSTPRIOR(20), oo_.posterior_mean.parameters.alphpi, oo_.posterior_median.parameters.alphpi, oo_.posterior_mode.parameters.alphpi, oo_.posterior_std.parameters.alphpi);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Policy weight on output growth','\alpha^{\Delta_{y}}',bayestopt_.name{21}, bayestopt_.pshape(21), oo_.prior.mean(21), ALLSTPRIOR(21), oo_.posterior_mean.parameters.alphdey, oo_.posterior_median.parameters.alphdey, oo_.posterior_mode.parameters.alphdey, oo_.posterior_std.parameters.alphdey);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Policy smoothing parameter','\rho_{p}',bayestopt_.name{22}, bayestopt_.pshape(22), oo_.prior.mean(22), ALLSTPRIOR(22), oo_.posterior_mean.parameters.rhop, oo_.posterior_median.parameters.rhop, oo_.posterior_mode.parameters.rhop, oo_.posterior_std.parameters.rhop);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc.  Gov. Spend. Shock','\rho_{g}',bayestopt_.name{23}, bayestopt_.pshape(23), oo_.prior.mean(23), ALLSTPRIOR(23), oo_.posterior_mean.parameters.rhoggg, oo_.posterior_median.parameters.rhoggg, oo_.posterior_mode.parameters.rhoggg, oo_.posterior_std.parameters.rhoggg);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc. Tech. Shock','\rho_{z}',bayestopt_.name{24}, bayestopt_.pshape(24), oo_.prior.mean(24), ALLSTPRIOR(24), oo_.posterior_mean.parameters.rhozz, oo_.posterior_median.parameters.rhozz, oo_.posterior_mode.parameters.rhozz, oo_.posterior_std.parameters.rhozz);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc. Cons. Pref. Shock','\rho_{\zeta_{c}}',bayestopt_.name{25}, bayestopt_.pshape(25), oo_.prior.mean(25), ALLSTPRIOR(25), oo_.posterior_mean.parameters.rhozetc, oo_.posterior_median.parameters.rhozetc, oo_.posterior_mode.parameters.rhozetc, oo_.posterior_std.parameters.rhozetc);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc. B. Loan Delinq. Rate Shock','\rho_{\sigma_{e}}',bayestopt_.name{26}, bayestopt_.pshape(26), oo_.prior.mean(26), ALLSTPRIOR(26), oo_.posterior_mean.parameters.rhosigmaomegae_ss, oo_.posterior_median.parameters.rhosigmaomegae_ss, oo_.posterior_mode.parameters.rhosigmaomegae_ss, oo_.posterior_std.parameters.rhosigmaomegae_ss);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc. R. E. Loan Delinq. Rate Shock','\rho_{\sigma_{h}}',bayestopt_.name{27}, bayestopt_.pshape(27), oo_.prior.mean(27), ALLSTPRIOR(27), oo_.posterior_mean.parameters.rhosigmaomegah_ss, oo_.posterior_median.parameters.rhosigmaomegah_ss, oo_.posterior_mode.parameters.rhosigmaomegah_ss, oo_.posterior_std.parameters.rhosigmaomegah_ss);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Collateral Policy Smoothing Parameter - B. Loan','\rho_{\kappa_{e}}',bayestopt_.name{28}, bayestopt_.pshape(28), oo_.prior.mean(28), ALLSTPRIOR(28), oo_.posterior_mean.parameters.rhosigmakappae_ss, oo_.posterior_median.parameters.rhosigmakappae_ss, oo_.posterior_mode.parameters.rhosigmakappae_ss, oo_.posterior_std.parameters.rhosigmakappae_ss);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Collateral Policy Smoothing Parameter - R. E. Loan','\rho_{\kappa_{h}}',bayestopt_.name{29}, bayestopt_.pshape(29), oo_.prior.mean(29), ALLSTPRIOR(29), oo_.posterior_mean.parameters.rhosigmakappah_ss, oo_.posterior_median.parameters.rhosigmakappah_ss, oo_.posterior_mode.parameters.rhosigmakappah_ss, oo_.posterior_std.parameters.rhosigmakappah_ss);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Collateral Policy weight on R. E. Loan Delinq. Rate','\alpha_{\phi_{e}}',bayestopt_.name{30}, bayestopt_.pshape(30), oo_.prior.mean(30), ALLSTPRIOR(30), oo_.posterior_mean.parameters.alphakomegae, oo_.posterior_median.parameters.alphakomegae, oo_.posterior_mode.parameters.alphakomegae, oo_.posterior_std.parameters.alphakomegae);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Collateral Policy weight on B. Loan Delinq. Rate','\alpha_{\phi_{h}}',bayestopt_.name{31}, bayestopt_.pshape(31), oo_.prior.mean(31), ALLSTPRIOR(31), oo_.posterior_mean.parameters.alphakomegah, oo_.posterior_median.parameters.alphakomegah, oo_.posterior_mode.parameters.alphakomegah, oo_.posterior_std.parameters.alphakomegah);
 


 fclose(fid);
 end
 
 
 
 %%








 ALLSTPRIOR = sqrt(bayestopt_.p2.^2); % this compute the standard deviation for prior 

 
 


 if true
 
fid = fopen('tabpriormain2.xls','w+');



  % shocks
fprintf(fid, '%30s \t %s \t %30s  \t %5s   \t %5s   \t %5s   \t %5s   \t %5s   \t %5s    \t %5s    \n','','','','Distribution','Prior mean','prior standard deviation','posterior mean','posterior median','posterior mode','posterior standard deviation');


fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{g}',' St. dev. Gov. Spend. Shock ',bayestopt_.name{1}, bayestopt_.pshape(1), oo_.prior.mean(1), ALLSTPRIOR(1), oo_.posterior_mean.shocks_std.e1, oo_.posterior_median.shocks_std.e1, oo_.posterior_mode.shocks_std.e1, oo_.posterior_std.shocks_std.e1);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{z}','St. dev. Tech. Shock',bayestopt_.name{2}, bayestopt_.pshape(2), oo_.prior.mean(2), ALLSTPRIOR(2), oo_.posterior_mean.shocks_std.e2, oo_.posterior_median.shocks_std.e2, oo_.posterior_mode.shocks_std.e2, oo_.posterior_std.shocks_std.e2);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\zeta_{c}}','St. dev. Cons. Pref. Shock',bayestopt_.name{3}, bayestopt_.pshape(3), oo_.prior.mean(3), ALLSTPRIOR(3), oo_.posterior_mean.shocks_std.e3, oo_.posterior_median.shocks_std.e3, oo_.posterior_mode.shocks_std.e3, oo_.posterior_std.shocks_std.e3);
%fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\sigma_{e}}','St. dev. B. Loan Delinq. Rate. Shock',bayestopt_.name{4}, bayestopt_.pshape(4), oo_.prior.mean(4), ALLSTPRIOR(4), oo_.posterior_mean.shocks_std.e4, oo_.posterior_median.shocks_std.e4, oo_.posterior_mode.shocks_std.e4, oo_.posterior_std.shocks_std.e4);
%fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\sigma_{h}}','St. dev. R. E. Loan Delinq. Rate. Shock',bayestopt_.name{5}, bayestopt_.pshape(5), oo_.prior.mean(5), ALLSTPRIOR(5), oo_.posterior_mean.shocks_std.e5, oo_.posterior_median.shocks_std.e5, oo_.posterior_mode.shocks_std.e5, oo_.posterior_std.shocks_std.e5);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\kappa_{e}}','St. dev. B. Loan Coll. Requir. Shock',bayestopt_.name{4}, bayestopt_.pshape(4), oo_.prior.mean(4), ALLSTPRIOR(4), oo_.posterior_mean.shocks_std.e6, oo_.posterior_median.shocks_std.e6, oo_.posterior_mode.shocks_std.e6, oo_.posterior_std.shocks_std.e6);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\kappa_{h}}','St. dev. R. E. Loan Coll. Requir. Shock',bayestopt_.name{5}, bayestopt_.pshape(5), oo_.prior.mean(5), ALLSTPRIOR(5), oo_.posterior_mean.shocks_std.e7, oo_.posterior_median.shocks_std.e7, oo_.posterior_mode.shocks_std.e7, oo_.posterior_std.shocks_std.e7);

fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{h}','St. dev. R. E. Volume Shock ',bayestopt_.name{6}, bayestopt_.pshape(6), oo_.prior.mean(6), ALLSTPRIOR(6), oo_.posterior_mean.shocks_std.e8, oo_.posterior_median.shocks_std.e8, oo_.posterior_mode.shocks_std.e8, oo_.posterior_std.shocks_std.e8);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{9}}','measurement error 9',bayestopt_.name{7}, bayestopt_.pshape(7), oo_.prior.mean(7), ALLSTPRIOR(7), oo_.posterior_mean.shocks_std.me9, oo_.posterior_median.shocks_std.me9, oo_.posterior_mode.shocks_std.me9, oo_.posterior_std.shocks_std.me9);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{\rho}','St. dev. M. P. Shock',bayestopt_.name{8}, bayestopt_.pshape(8), oo_.prior.mean(8), ALLSTPRIOR(8), oo_.posterior_mean.shocks_std.e19, oo_.posterior_median.shocks_std.e19, oo_.posterior_mode.shocks_std.e19, oo_.posterior_std.shocks_std.e19);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{13}}','measurement error 13',bayestopt_.name{9}, bayestopt_.pshape(9), oo_.prior.mean(9), ALLSTPRIOR(9), oo_.posterior_mean.shocks_std.me13, oo_.posterior_median.shocks_std.me13, oo_.posterior_mode.shocks_std.me13, oo_.posterior_std.shocks_std.me13);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{14}}','measurement error 14',bayestopt_.name{10}, bayestopt_.pshape(10), oo_.prior.mean(10), ALLSTPRIOR(10), oo_.posterior_mean.shocks_std.me14, oo_.posterior_median.shocks_std.me14, oo_.posterior_mode.shocks_std.me14, oo_.posterior_std.shocks_std.me14);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{15}}','measurement error 15',bayestopt_.name{11}, bayestopt_.pshape(11), oo_.prior.mean(11), ALLSTPRIOR(11), oo_.posterior_mean.shocks_std.me15, oo_.posterior_median.shocks_std.me15, oo_.posterior_mode.shocks_std.me15, oo_.posterior_std.shocks_std.me15);
fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','\epsilon_{m_{16}}','measurement error 16',bayestopt_.name{12}, bayestopt_.pshape(12), oo_.prior.mean(12), ALLSTPRIOR(12), oo_.posterior_mean.shocks_std.me16, oo_.posterior_median.shocks_std.me16, oo_.posterior_mode.shocks_std.me16, oo_.posterior_std.shocks_std.me16);

  
 %Distributions : INV_GAMMA2_PDF = 6, BETA_PDF = 1, NORMAL_PDF = 3,   (I change it manually in )
   %  parameteres 

 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Habit parameter','b_{u}',bayestopt_.name{13}, bayestopt_.pshape(13), oo_.prior.mean(13), ALLSTPRIOR(13), oo_.posterior_mean.parameters.bb, oo_.posterior_median.parameters.bb, oo_.posterior_mode.parameters.bb, oo_.posterior_std.parameters.bb);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Habit parameter','b_{c}',bayestopt_.name{14}, bayestopt_.pshape(14), oo_.prior.mean(14), ALLSTPRIOR(14), oo_.posterior_mean.parameters.bb2, oo_.posterior_median.parameters.bb2, oo_.posterior_mode.parameters.bb2, oo_.posterior_std.parameters.bb2);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Calvo wage stickiness','\zeta_{l}',bayestopt_.name{15}, bayestopt_.pshape(15), oo_.prior.mean(15), ALLSTPRIOR(15), oo_.posterior_mean.parameters.zetal, oo_.posterior_median.parameters.zetal, oo_.posterior_mode.parameters.zetal, oo_.posterior_std.parameters.zetal);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Calvo price stickiness','\zeta_{p}',bayestopt_.name{16}, bayestopt_.pshape(16), oo_.prior.mean(16), ALLSTPRIOR(16), oo_.posterior_mean.parameters.zetap, oo_.posterior_median.parameters.zetap, oo_.posterior_mode.parameters.zetap, oo_.posterior_std.parameters.zetap);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Investment adjustment cost curvature','S',bayestopt_.name{17}, bayestopt_.pshape(17), oo_.prior.mean(17), ALLSTPRIOR(17), oo_.posterior_mean.parameters.ssii, oo_.posterior_median.parameters.ssii, oo_.posterior_mode.parameters.ssii, oo_.posterior_std.parameters.ssii);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Policy weight on inflation','\alpha^{\pi}',bayestopt_.name{18}, bayestopt_.pshape(18), oo_.prior.mean(18), ALLSTPRIOR(18), oo_.posterior_mean.parameters.alphpi, oo_.posterior_median.parameters.alphpi, oo_.posterior_mode.parameters.alphpi, oo_.posterior_std.parameters.alphpi);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Policy weight on output growth','\alpha^{\Delta_{y}}',bayestopt_.name{19}, bayestopt_.pshape(19), oo_.prior.mean(19), ALLSTPRIOR(19), oo_.posterior_mean.parameters.alphdey, oo_.posterior_median.parameters.alphdey, oo_.posterior_mode.parameters.alphdey, oo_.posterior_std.parameters.alphdey);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Policy smoothing parameter','\rho_{p}',bayestopt_.name{20}, bayestopt_.pshape(20), oo_.prior.mean(20), ALLSTPRIOR(20), oo_.posterior_mean.parameters.rhop, oo_.posterior_median.parameters.rhop, oo_.posterior_mode.parameters.rhop, oo_.posterior_std.parameters.rhop);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc.  Gov. Spend. Shock','\rho_{g}',bayestopt_.name{21}, bayestopt_.pshape(21), oo_.prior.mean(21), ALLSTPRIOR(21), oo_.posterior_mean.parameters.rhoggg, oo_.posterior_median.parameters.rhoggg, oo_.posterior_mode.parameters.rhoggg, oo_.posterior_std.parameters.rhoggg);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc. Tech. Shock','\rho_{z}',bayestopt_.name{22}, bayestopt_.pshape(22), oo_.prior.mean(22), ALLSTPRIOR(22), oo_.posterior_mean.parameters.rhozz, oo_.posterior_median.parameters.rhozz, oo_.posterior_mode.parameters.rhozz, oo_.posterior_std.parameters.rhozz);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc. Cons. Pref. Shock','\rho_{\zeta_{c}}',bayestopt_.name{23}, bayestopt_.pshape(23), oo_.prior.mean(23), ALLSTPRIOR(23), oo_.posterior_mean.parameters.rhozetc, oo_.posterior_median.parameters.rhozetc, oo_.posterior_mode.parameters.rhozetc, oo_.posterior_std.parameters.rhozetc);
 %fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc. B. Loan Delinq. Rate Shock','\rho_{\sigma_{e}}',bayestopt_.name{24}, bayestopt_.pshape(24), oo_.prior.mean(24), ALLSTPRIOR(24), oo_.posterior_mean.parameters.rhosigmaomegae_ss, oo_.posterior_median.parameters.rhosigmaomegae_ss, oo_.posterior_mode.parameters.rhosigmaomegae_ss, oo_.posterior_std.parameters.rhosigmaomegae_ss);
 %fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Autoc. R. E. Loan Delinq. Rate Shock','\rho_{\sigma_{h}}',bayestopt_.name{25}, bayestopt_.pshape(25), oo_.prior.mean(25), ALLSTPRIOR(25), oo_.posterior_mean.parameters.rhosigmaomegah_ss, oo_.posterior_median.parameters.rhosigmaomegah_ss, oo_.posterior_mode.parameters.rhosigmaomegah_ss, oo_.posterior_std.parameters.rhosigmaomegah_ss);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Collateral Policy Smoothing Parameter - B. Loan','\rho_{\kappa_{e}}',bayestopt_.name{24}, bayestopt_.pshape(24), oo_.prior.mean(24), ALLSTPRIOR(24), oo_.posterior_mean.parameters.rhosigmakappae_ss, oo_.posterior_median.parameters.rhosigmakappae_ss, oo_.posterior_mode.parameters.rhosigmakappae_ss, oo_.posterior_std.parameters.rhosigmakappae_ss);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Collateral Policy Smoothing Parameter - R. E. Loan','\rho_{\kappa_{h}}',bayestopt_.name{25}, bayestopt_.pshape(25), oo_.prior.mean(25), ALLSTPRIOR(25), oo_.posterior_mean.parameters.rhosigmakappah_ss, oo_.posterior_median.parameters.rhosigmakappah_ss, oo_.posterior_mode.parameters.rhosigmakappah_ss, oo_.posterior_std.parameters.rhosigmakappah_ss);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Collateral Policy weight on R. E. Loan Delinq. Rate','\alpha_{\phi_{e}}',bayestopt_.name{26}, bayestopt_.pshape(26), oo_.prior.mean(26), ALLSTPRIOR(26), oo_.posterior_mean.parameters.alphakomegae, oo_.posterior_median.parameters.alphakomegae, oo_.posterior_mode.parameters.alphakomegae, oo_.posterior_std.parameters.alphakomegae);
 fprintf(fid, '%30s \t %s \t %30s  \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f \t %5.4f  \t %5.4f  \n','Collateral Policy weight on B. Loan Delinq. Rate','\alpha_{\phi_{h}}',bayestopt_.name{27}, bayestopt_.pshape(27), oo_.prior.mean(27), ALLSTPRIOR(27), oo_.posterior_mean.parameters.alphakomegah, oo_.posterior_median.parameters.alphakomegah, oo_.posterior_mode.parameters.alphakomegah, oo_.posterior_std.parameters.alphakomegah);
 


 fclose(fid);
 end
 
 
 
 %%
