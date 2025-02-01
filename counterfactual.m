% I report the plots for the experiments 
% I can plot my counterfacyuals



% endogenous del  model : run fule: eaxmple1linearEndo11.mod

% benchmark + less active rule : run file examplelinearID.mod
% deterministic default: run file example1linearID001.mod
% constant LTV : run examplelinearFixedLTV.mod
% housing assumption:  run example1linearHosing.mod
%%

load('y_IRF_both_nofric');

load('y_IRF_both_noprudential');

load('datalogdiff84.mat')


%%

load('Recessions.mat')
start=Recessions(:,1);
finish=Recessions(:,2);
%%

startdate = datenum('Q2-1984','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy');
enddate = datenum('Q4-2021','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy'); 
timeline = linspace(startdate,enddate,151);


%% 

% Set text interpreter for figures to latex

%% policy switching
figure('color','w')
set(gcf,'Units', 'Normalized','OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 

set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

% y_IRF_both_nofric
% y_IRF_both_noprudential

l2=plot(timeline,100*y_IRF_both_nofric(strmatch('gdpobs',M_.endo_names,'exact'),:),'-.' ,'LineWidth',2.5,'Color', [242, 109, 116]/255);hold on
l3=plot(timeline,100*gdpobs,'LineWidth',2.5,'Color',[0, 158, 169]/255);hold on


text(733408,5,'GFC','interpreter','latex',...
    'fontsize',18);

text(730942,5,'IT Bubble','interpreter','latex',...
    'fontsize',18);
text(727016,5,{'Early 1990s','Recession'},'interpreter','latex',...
    'fontsize',18);


text(737334,5,'Covid','interpreter','latex',...
    'fontsize',18);

axis tight;  
shadeyears(start,finish);
hold on;
legend([l2 l3],{'Model', 'Data'},'FontSize',25,'Location','best')
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 30;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel(' \% dev. from the ss','interpreter','latex');





export_fig OutputSimul.jpg  -m2.5 -painters
%% save

example1yv = 100*y_IRF_both_nofric(strmatch('Y_v',M_.endo_names,'exact'),:);
example1mv=100*y_IRF_both_nofric(strmatch('m_v',M_.endo_names,'exact'),:);
example1dhv=100*y_IRF_both_nofric(strmatch('d_h_v',M_.endo_names,'exact'),:);
example1omegae=100*y_IRF_both_nofric(strmatch('omegae_v',M_.endo_names,'exact'),:);
example1omegah=100*y_IRF_both_nofric(strmatch('omegah_v',M_.endo_names,'exact'),:);
example1kappae_v=100*y_IRF_both_nofric(strmatch('kappae_v',M_.endo_names,'exact'),:);
example1kappah_v=100*y_IRF_both_nofric(strmatch('kappah_v',M_.endo_names,'exact'),:);


exnoprudyv = 100*y_IRF_both_noprudential(strmatch('Y_v',M_.endo_names,'exact'),:) ;
exnoprudtmv =100*y_IRF_both_noprudential(strmatch('m_v',M_.endo_names,'exact'),:);
exnopruddhv =100*y_IRF_both_noprudential(strmatch('d_h_v',M_.endo_names,'exact'),:);
exnoprudomegae = 100*y_IRF_both_noprudential(strmatch('omegae_v',M_.endo_names,'exact'),:);
exnoprudomegah = 100*y_IRF_both_noprudential(strmatch('omegah_v',M_.endo_names,'exact'),:);
exnoprudkappae_v = 100*y_IRF_both_noprudential(strmatch('kappae_v',M_.endo_names,'exact'),:);
exnoprudkappah_v = 100*y_IRF_both_noprudential(strmatch('kappah_v',M_.endo_names,'exact'),:);



save benchmark example1mv example1yv example1dhv... 
exnoprudyv exnoprudtmv exnopruddhv...
example1omegae example1omegah example1kappae_v example1kappah_v...
exnoprudomegae exnoprudomegah exnoprudkappae_v exnoprudkappah_v;

%%
 %data=load('benchmark');

 %f=fieldnames(data);
 %for k=1:size(f,1)
 %  xlswrite('Simulatedbenchmarke.xlsx',data.(f{k}),f{k})
 %end

%%
kappaeexp1 = y_IRF_both_nofric(strmatch('kappae_v',M_.endo_names,'exact'),:)/kappae_ss;
kappahexp1 = y_IRF_both_nofric(strmatch('kappah_v',M_.endo_names,'exact'),:)/kappah_ss;

figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 

set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


subplot(1,2,1)
%l2=
plot(timeline,kappaeexp1,'-' ,'LineWidth',2.5,'Color', [242, 109, 116]/255);hold on
axis tight;  
shadeyears(start,finish);
hold on;
axis tight; 
t = ' Collateral Requirement $\phi^{e}$ ';
title(t,'interpreter','latex')
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points','interpreter','latex');







subplot(1,2,2)
l3=plot(timeline,kappahexp1,'LineWidth',2.5,'Color',[0, 158, 169]/255);hold on
axis tight;  
shadeyears(start,finish);
hold on;
t = ' Collateral Requirement $\phi^{h}$ ';
title(t,'interpreter','latex')
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points','interpreter','latex');



export_fig ColReqSimul.jpg  -m2.5 -painters


%%
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


sigmaomegae_vexp1 = y_IRF_both_nofric(strmatch('sigmaomegae_v',M_.endo_names,'exact'),:)/sigmaomegae_ss;
sigmaomegah_vexp1 =  y_IRF_both_nofric(strmatch('sigmaomegah_v',M_.endo_names,'exact'),:)/sigmaomegah_ss;
subplot(2,1,1)
l2=plot(timeline,sigmaomegae_vexp1,'-' ,'LineWidth',2.5,'Color', [242, 109, 116]/255);hold on
axis tight;  
shadeyears(start,finish);
hold on;

t = ' delinquency rate $\mathcal{X}^{e}$ ';
title(t,'interpreter','latex')
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points','interpreter','latex');

subplot(2,1,2)
l3=plot(timeline,sigmaomegah_vexp1,'LineWidth',2.5,'Color',[0, 158, 169]/255);hold on
axis tight;  
shadeyears(start,finish);
hold on;

t = ' delinquency rate $\mathcal{X}^{h}$ ';
title(t,'interpreter','latex')
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points','interpreter','latex');

export_fig delinqrateSimul.jpg  -m2.5 -painters


%% Model vs data ***************

figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

s11 = 100*y_IRF_both_nofric(strmatch('m_v',M_.endo_names,'exact'),:);
l2=plot(timeline(20:end),s11(20:end) ,'--','LineWidth',3,'Color', [242, 109, 116]/255);hold on
l3=plot(timeline(20:end),100*CIloan_obs(20:end),'.-','LineWidth',3,'Color',[0, 158, 169]/255);hold on
axis tight;  
shadeyears(start,finish);
hold on;
legend([l2 l3],{'Model', 'Data'},'FontSize',25,'Location','best')

t = ' Business debt: m ';
title(t,'interpreter','latex')
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 30;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-8 10])
ylabel('  \% dev. from the ss ','interpreter','Latex');
export_fig DebtSimul1.jpg  -m2.5 -painters



figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


s22 = y_IRF_both_nofric(strmatch('d_h_v',M_.endo_names,'exact'),:);
l2=plot(timeline(20:end),100*s22(20:end),'--','LineWidth',3,'Color',[242, 109, 116]/255);hold on
l3=plot(timeline(20:end),100*Hloan_obs(20:end),'.-','LineWidth',3,'Color',[0, 158, 169]/255);hold on


axis tight;  
ylim([-8 10])
shadeyears(start,finish);
hold on;

legend([l2 l3],{'Model', 'Data'},'FontSize',25,'Location','best')
t = ' Household debt: $d^{h}$ ';
title(t,'interpreter','latex')
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 30;
ax.XGrid = 'off';
ax.YGrid = 'on';

ylabel(' \% dev. from the ss','interpreter','latex');


export_fig DebtSimul.jpg  -m2.5 -painters

%%

figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


l2=plot(timeline,100*y_IRF_both_nofric(strmatch('I_v',M_.endo_names,'exact'),:),'-' ,'LineWidth',2.5,'Color', [242, 109, 116]/255);hold on
l3=plot(timeline,100*investobs,'--','LineWidth',2.5,'Color',[0, 158, 169]/255);hold on
axis tight;  
shadeyears(start,finish);
hold on;
legend([l2 l3],{'Model', 'Data'},'FontSize',25,'Location','best')
t = ' investment $i$ ';
title(t,'interpreter','latex')
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;

ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points','interpreter','latex');


export_fig InvSimul.jpg  -m2.5 -painters


%%  do collatreal stabilize prices











%% 3) data

load('datalogdiff84.mat')
%%


startdate = datenum('Q2-1984','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy');
enddate = datenum('Q4-2021','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy'); 
dt = linspace(startdate,enddate,151);



fig11 = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

subplot(3,4,1)
plot(dt,gdpobs, 'LineWidth', 1, 'Color', '#0F5C8C');
datetick('x')
axis tight; % THIS HELPS TO REMOVE THE SPACE BEFORE AND AFTER THE LINE
shadeyears(start,finish);
hold on;
t = ' real GDP per capita ';
title(t,'interpreter','latex')

subplot(3,4,2)
plot(dt,consumptionobs, 'LineWidth', 1, 'Color', '#0F5C8C' );
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' real consumption per capita ';
title(t,'interpreter','latex')

subplot(3,4,3)
plot(dt,investobs, 'LineWidth', 1, 'Color', '#0F5C8C');
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' real investment per capita';
title(t,'interpreter','latex')


subplot(3,4,4)
plot(dt,CIloan_obs, 'LineWidth', 1, 'Color', '#0F5C8C');
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' real business debt capita';
title(t,'interpreter','latex')



subplot(3,4,5)
plot(dt,Hloan_obs, 'LineWidth', 1, 'Color', '#0F5C8C');
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' real houshold debt per capita';
title(t,'interpreter','latex')

subplot(3,4,6)
plot(dt,govobs, 'LineWidth', 1, 'Color', '#0F5C8C');
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' real government spending per capita';
title(t,'interpreter','latex')



subplot(3,4,7)
plot(dt,hours_obs, 'LineWidth', 1, 'Color', '#0F5C8C');
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' hours worked per capita';
title(t,'interpreter','latex')

subplot(3,4,8)
plot(dt,CIchargoff_obs, 'LineWidth', 1, 'Color','#0F5C8C');
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' CI loan charge-off per capita';
title(t,'interpreter','latex')

subplot(3,4,9)
plot(dt,Hcharfoff_obs, 'LineWidth', 1, 'Color', '#0F5C8C');
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' household loan charge-off per capita';
title(t,'interpreter','latex')


subplot(3,4,10)
plot(dt,default_h_obs, 'LineWidth', 1, 'Color','#0F5C8C');
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' delinquency rate - household loan';
title(t,'interpreter','latex')

subplot(3,4,11)
plot(dt,default_e_obs, 'LineWidth', 1, 'Color', '#0F5C8C');
datetick('x')
axis tight;
shadeyears(start,finish);
t = ' delinquency rate - CI loan';
title(t,'interpreter','latex')

 
%export_fig testdatausedbubble.jpg  -m2.5 -painters
exportgraphics(fig11,'testdatausedbubble.pdf');

%%  




  
%%   irf_plot_with_lessactivepolicy
%load('irf_plot_without_policy.mat')
%load('y_IRF_both_noprudential');
load('irf_plot_with_lessactivpolicy');
% kappa = \epsilon 
%% HOW change an increase in collateral requirement affect default rate

kappae_v_e4GG = kappae_v_e4;
kappah_v_e5GG = kappah_v_e5;


%% e4 e5 defeult shock

%% e6 e7 shock to collateral
%%    

c_v_e4GG = c_v_e4; 
c_v_e7GG = c_v_e7; 
c_v_e5GG = c_v_e5; 
c_v_e6GG = c_v_e6; 
L_v_e4GG = L_v_e4;
L_v_e5GG = L_v_e5; 
L_v_e6GG = L_v_e6; 
L_v_e7GG = L_v_e7; 
Y_v_e4GG = Y_v_e4; 
Y_v_e5GG = Y_v_e5; 
Y_v_e6GG = Y_v_e6; 
Y_v_e7GG = Y_v_e7;



m_v_e4GG = m_v_e4;
m_v_e5GG = m_v_e5;
m_v_e6GG = m_v_e6;
m_v_e7GG = m_v_e7 ;
d_h_v_e4GG = d_h_v_e4;
d_h_v_e5GG = d_h_v_e5 ;
d_h_v_e6GG = d_h_v_e6;
d_h_v_e7GG = d_h_v_e7;

% monetary policy shcok
Y_v_e19GG  = Y_v_e19; 
L_v_e19GG  = L_v_e19;
c_v_e19GG  = c_v_e19;
d_h_v_e19GG  = d_h_v_e19;  
m_v_e19GG  = m_v_e19;


omegae_v_e19GG = omegae_v_e19; % monetary policy shcok
omegae_v_e6GG = omegae_v_e6;
omegae_v_e4GG = omegae_v_e4;
omegah_v_e19GG = omegah_v_e19; % monetary policy shcok
omegah_v_e7GG = omegah_v_e7;
omegah_v_e5GG = omegah_v_e5;

wealth_const_v_e19GG = wealth_const_v_e19; 
wealth_social_v_e19GG = wealth_social_v_e19;
wealth_unconst_v_e19GG = wealth_unconst_v_e19;

outputgap_v_e19GG = outputgap_v_e19
inflation1_v_e19GG = inflation1_v_e19
c_v_e19GG = c_v_e19
Qh_v_e19GG = Qh_v_e19


%%

load('irf_plot_with_policy.mat')
% bechmark:   kappa =  kappa (t-1)   + default + credit grwoth 


kappae_v_e4ZZ = kappae_v_e4;
kappah_v_e5ZZ = kappah_v_e5;

c_v_e4ZZ = c_v_e4; 
c_v_e7ZZ = c_v_e7; 
c_v_e5ZZ = c_v_e5; 
c_v_e6ZZ = c_v_e6; 
L_v_e4ZZ = L_v_e4;
L_v_e5ZZ = L_v_e5; 
L_v_e6ZZ = L_v_e6; 
L_v_e7ZZ = L_v_e7; 
Y_v_e4ZZ = Y_v_e4; 
Y_v_e5ZZ = Y_v_e5; 
Y_v_e6ZZ = Y_v_e6; 
Y_v_e7ZZ = Y_v_e7;



m_v_e4ZZ = m_v_e4;
m_v_e5ZZ = m_v_e5;
m_v_e6ZZ = m_v_e6;
m_v_e7ZZ = m_v_e7 ;
d_h_v_e4ZZ = d_h_v_e4;
d_h_v_e5ZZ = d_h_v_e5 ;
d_h_v_e6ZZ = d_h_v_e6;
d_h_v_e7ZZ = d_h_v_e7;

% monetary policy shcok
Y_v_e19ZZ  = Y_v_e19; 
L_v_e19ZZ  = L_v_e19;
c_v_e19ZZ  = c_v_e19;
d_h_v_e19ZZ  = d_h_v_e19;  
m_v_e19ZZ  = m_v_e19;


omegae_v_e19ZZ = omegae_v_e19; % monetary policy shcok
omegae_v_e6ZZ = omegae_v_e6;
omegae_v_e4ZZ = omegae_v_e4;
omegah_v_e19ZZ = omegah_v_e19; % monetary policy shcok
omegah_v_e7ZZ = omegah_v_e7;
omegah_v_e5ZZ = omegah_v_e5;


wealth_const_v_e19ZZ = wealth_const_v_e19; 
wealth_social_v_e19ZZ = wealth_social_v_e19;
wealth_unconst_v_e19ZZ = wealth_unconst_v_e19;

outputgap_v_e19ZZ = outputgap_v_e19
inflation1_v_e19ZZ = inflation1_v_e19
c_v_e19ZZ = c_v_e19
Qh_v_e19ZZ = Qh_v_e19


%% 
%%
load('irf_plot_with_policyendogenous') 

%% ENDOGENOUS

omegah_v_e19ENDO  = omegah_v_e19;

omegae_v_e19ENDO = omegae_v_e19;

Y_v_e6ENDO = Y_v_e6 ;
Y_v_e7ENDO = Y_v_e7 ;
L_v_e6ENDO = L_v_e6 ;
L_v_e7ENDO = L_v_e7 ;

Y_v_e19ENDO=Y_v_e19 ;
L_v_e19ENDO=L_v_e19 ;
c_v_e19ENDO=c_v_e19 ;
d_h_v_e19ENDO=d_h_v_e19 ; 
m_v_e19ENDO=m_v_e19 ;

wealth_const_v_e19ENDO = wealth_const_v_e19; 
wealth_social_v_e19ENDO = wealth_social_v_e19;
wealth_unconst_v_e19ENDO = wealth_unconst_v_e19;

outputgap_v_e19ENDO = outputgap_v_e19
inflation1_v_e19ENDO = inflation1_v_e19
c_v_e19ENDO = c_v_e19
Qh_v_e19ENDO = Qh_v_e19
%% constant LTV 

load('irf_plot_with_constantLTV')

Y_v_e19ConsLTV   = Y_v_e19 ;
L_v_e19ConsLTV   = L_v_e19 ;
c_v_e19ConsLTV   = c_v_e19 ;
d_h_v_e19ConsLTV = d_h_v_e19 ; 
m_v_e19ConsLTV   = m_v_e19 ;
omegah_v_e19ConsLTV  = omegah_v_e19;

omegae_v_e19ConsLTV = omegae_v_e19;

Y_v_e5ConsLTV   = Y_v_e5;
Y_v_e4ConsLTV   = Y_v_e4;
L_v_e5ConsLTV   = L_v_e5;
L_v_e4ConsLTV   = L_v_e4;


wealth_const_v_e19ConsLTV = wealth_const_v_e19; 
wealth_social_v_e19ConsLTV = wealth_social_v_e19;
wealth_unconst_v_e19ConsLTV = wealth_unconst_v_e19;

outputgap_v_e19ConsLTV = outputgap_v_e19
inflation1_v_e19ConsLTV = inflation1_v_e19
Qh_v_e19ConsLTV = Qh_v_e19


omegah_v_e5ConsLTV =omegah_v_e5;
d_h_v_e5ConsLTV = d_h_v_e5;
omegae_v_e4ConsLTV = omegae_v_e4;
m_v_e4ConsLTV = m_v_e4;

%%  
% CONSTANT DEFAULT (determinstic)

load('irf_plot_with_policy001') 
% c_v_e7 c_v_e6 

Y_v_e6WW = Y_v_e6 ;
Y_v_e7WW = Y_v_e7 ;
L_v_e6WW = L_v_e6 ;
L_v_e7WW = L_v_e7 ;

Y_v_e19WW=Y_v_e19 ;
L_v_e19WW=L_v_e19 ;
c_v_e19WW=c_v_e19 ;
d_h_v_e19WW=d_h_v_e19 ; 
m_v_e19WW=m_v_e19 ;

wealth_const_v_e19WW = wealth_const_v_e19; 
wealth_social_v_e19WW = wealth_social_v_e19;
wealth_unconst_v_e19WW = wealth_unconst_v_e19;

outputgap_v_e19WW = outputgap_v_e19
inflation1_v_e19WW = inflation1_v_e19
c_v_e19WW = c_v_e19
Qh_v_e19WW = Qh_v_e19



%%

load('irf_plot_with_both_housing_in_util_policy')




Y_v_e19HH   = Y_v_e19 ;
L_v_e19HH   = L_v_e19 ;
c_v_e19HH   = c_v_e19 ;
d_h_v_e19HH = d_h_v_e19 ; 
m_v_e19HH   = m_v_e19 ;
omegah_v_e19HH  = omegah_v_e19;

omegae_v_e19HH = omegae_v_e19;

Y_v_e5HH   = Y_v_e5;
Y_v_e4HH   = Y_v_e4;
L_v_e5HH   = L_v_e5;
L_v_e4HH   = L_v_e4;


wealth_const_v_e19HH = wealth_const_v_e19; 
wealth_social_v_e19HH = wealth_social_v_e19;
wealth_unconst_v_e19HH = wealth_unconst_v_e19;

outputgap_v_e19HH = outputgap_v_e19
inflation1_v_e19HH = inflation1_v_e19
Qh_v_e19HH = Qh_v_e19


omegah_v_e5HH =omegah_v_e5;
d_h_v_e5HH = d_h_v_e5;
omegae_v_e4HH = omegae_v_e4;
m_v_e4HH = m_v_e4;

%% kappae_v_e4GG kappae_v_e4GG ****************** This exact (add here)

% BENCHMARK

t =10;
fig1 = figure('Position',[1 1 800-100 600-100]);

hold on;
plot(1:t,kappae_v_e4ZZ(1:10),'-s', 'LineWidth', 3,'Color', '#0F5C8C'); hold on 

axis tight; 
hold on
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); 
hold on
tg = '(a) Response of $\mathcal{\phi}^{e}$ ';
title(tg,'interpreter','latex')
axis tight;  
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.12 0.01])
%export_fig ltv_irfdefshock1.jpg  -m2.5 -painters
exportgraphics(fig1,'ltv_irfdefshock1.pdf');


t =10;
fig2 = figure('Position',[1 1 800-100 600-100]);




hold on;
plot(1:t,kappah_v_e5ZZ(1:10),'-s', 'LineWidth', 3,'Color', '#0F5C8C');
hold on
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); 
hold on
axis tight; 
tg = '(b) Response of $\mathcal{\phi}^{h}$ ';
title(tg,'interpreter','latex')
axis tight;  

ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.20 0.1])


%export_fig ltv_irfdefshock.jpg  -m2.5 -painters
exportgraphics(fig2,'ltv_irfdefshock.pdf');




t =10;
fig1 = figure('Position',[1 1 800-100 600-100]);

hold on;
plot(1:t,m_v_e4ZZ(1:10),'-s', 'LineWidth', 3,'Color', '#0F5C8C'); hold on 

axis tight; 
hold on
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); 
hold on
tg = '(c) Response of $m^{e}$ ';
title(tg,'interpreter','latex')
axis tight;  

ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-2.5 3.5])
%export_fig ltv_irfdefshock1.jpg  -m2.5 -painters
exportgraphics(fig1,'ltv_irfdefshock1c.pdf');
% debt


fig2 = figure('Position',[1 1 800-100 600-100]);




hold on;
plot(1:t,d_h_v_e5ZZ(1:10)*1.0e+11,'-s', 'LineWidth', 3,'Color', '#0F5C8C');
hold on
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); 
hold on
axis tight; 
tg = '(d) Response of $d^{h}$ ';
title(tg,'interpreter','latex')
axis tight;  

ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.01 0.1])


%export_fig ltv_irfdefshock.jpg  -m2.5 -painters
exportgraphics(fig2,'ltv_irfdefshockc.pdf');




%%%


figq11 = figure

% Plot the surface
plot(omegah_ss + omegah_v_e5ZZ(1:10)/omegah_ss, d_h_ss + d_h_v_e5ZZ(1:10)/d_h_ss*1.0e+9,'-' ,'LineWidth',3,'Color',[255, 0, 1]/255); hold on
plot(omegah_ss + omegah_v_e5GG(1:10)/omegah_ss, d_h_ss + d_h_v_e5GG(1:10)/d_h_ss*1.0e+12,'-.','LineWidth',3,'Color', '#0F5C8C'); hold on
plot(omegah_ss + omegah_v_e5ConsLTV(1:10)/omegah_ss, d_h_ss + d_h_v_e5ConsLTV(1:10)/d_h_ss*1.0e+11,'-.','LineWidth',3,'Color', '#020659'); hold on

% Add zero lines
%xline(omegah_ss, '--k', 'LineWidth', 1); % Vertical line at x = 0
%yline(omegah_ss, '--k', 'LineWidth', 1); % Horizontal line at y = 0
% Add text annotations

%plot(W0, Y0,'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); hold on
%plot(W01, Y01,'LineWidth',3,'Color', '#0F95D7'); hold on


legend({'Benchmark','Less active LTV','Constant LTV'},'Interpreter','latex','FontSize',10,'Location','best')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
axis tight; 


% Add labels and title
xlabel('default rate  $\chi^{h}$ ','Interpreter','latex');
ylabel('household debt $d^{h}$','Interpreter','latex');

exportgraphics(figq11,'def_debtHMP.pdf');


%%


figq12 = figure

% Plot the surface
plot(omegae_ss + omegae_v_e4ZZ(1:10)/omegae_ss, m_ss + m_v_e4ZZ(1:10)/m_ss*1.0e-2,'-' ,'LineWidth',3,'Color',[255, 0, 1]/255); hold on
plot(omegae_ss + omegae_v_e4GG(1:10)/omegae_ss, m_ss + m_v_e4GG(1:10)/m_ss*1.0e-2,'-.','LineWidth',3,'Color', '#0F5C8C'); hold on
plot(omegae_ss + omegae_v_e4ConsLTV(1:10)/omegae_ss, m_ss + m_v_e4ConsLTV(1:10)/m_ss*1.0e-2,'-d','LineWidth',3,'Color', '#020659'); hold on

% Add zero lines
xline(0, '--k', 'LineWidth', 1); % Vertical line at x = 0
% Add text annotations

%plot(W0, Y0,'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); hold on
%plot(W01, Y01,'LineWidth',3,'Color', '#0F95D7'); hold on


legend({'Benchmark','Less active macroprudential policy','cons ltv'},'Interpreter','latex','FontSize',10,'Location','best')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
axis tight; 
%xlim([-0.108 0.12])
%ylim([-0.22 0.235])


% Add labels and title
xlabel('default rate  $\chi^{e}$ ','Interpreter','latex');
ylabel('firm debt $m^{e}$','Interpreter','latex');

exportgraphics(figq12,'def_debtMMP.pdf');

%%
%%% experiemnt crises




t=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


subplot(1,2,1) % Output
l2=plot(1:t,Y_v_e5GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,Y_v_e5ZZ(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
l4 = plot(1:t,Y_v_e5ConsLTV(1:10),'-s','LineWidth' ,2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3 l4],{'Less active LTV','Baseline','cons ltv'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.12 0.05])
ylabel('% points');


subplot(1,2,2) % Output
l2=plot(1:t,Y_v_e4GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,Y_v_e4ZZ(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
l4 = plot(1:t,Y_v_e4ConsLTV(1:10),'-s','LineWidth' ,2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3 l4],{'Less active LTV','Baseline','cons ltv'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points');





%%





%%

%t = 1:1:10;
t=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

subplot(1,2,1) % Output
l2=plot(1:t,L_v_e5GG(1:10)/L_ss,'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,L_v_e5ZZ(1:10)/L_ss,'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
l4=plot(1:t,L_v_e5ConsLTV(1:10)/L_ss,'-s','LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3 l4],{'Less active LTV','Baseline','cons ltv'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.12 0.05])
ylabel('% points');


subplot(1,2,2) % Output
l2=plot(1:t,L_v_e4GG(1:10)/L_ss,'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,L_v_e4ZZ(1:10)/L_ss,'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
l4=plot(1:t,L_v_e4ConsLTV(1:10)/L_ss,'-s','LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3 l4],{'Less active LTV','Baseline','cons ltv'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points');


%% monetary policy shock ********************  This exact (add here)
%% Y_v_e19 L_v_e19 c_v_e19 d_h_v_e19  m_v_e19;





%t = 1:1:10;
t=10;

fig6 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,Y_v_e19GG(1:10),'-s','LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,Y_v_e19ZZ(1:10),'LineWidth',3,'Color', [255, 0, 1]/255, marker='o')
hold on 
l4=plot(1:t,Y_v_e19ConsLTV(1:10)/10,'-s','LineWidth',3,'Color', '#020659')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color', '#0F5C8C');
legend([l2 l3 l4],{'Less active LTV','Baseline','Constant LTV'},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(a) output $y$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-1.2 0.01])

%export_fig OuLab_irfMPshock1.jpg  -m2.5 -painters
exportgraphics(fig6,'OuLab_irfMPshock1.pdf');

%%
%t = 1:1:10;
t=10;
fig5 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,L_v_e19GG(1:10),'-s','LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,L_v_e19ZZ(1:10),'-' ,'LineWidth',3,'Color', [255, 0, 1]/255, marker='o')
hold on 
l4=plot(1:t,L_v_e19ConsLTV(1:10)/10,'-s','LineWidth',3,'Color', '#020659')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color','#0F5C8C'); 
legend([l2 l3 l4],{'Less active LTV','Baseline','Constant LTV'},'Interpreter','latex','FontSize',18,'Location','best')
axis tight; 
tg = '(b) labor $l$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.5 0.05])

ylabel(' \% dev. from the ss','Interpreter','latex');


%export_fig OuLab_irfMPshock.jpg  -m2.5 -painters
exportgraphics(fig5,'OuLab_irfMPshock.pdf');


%% continue


fig7 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,inflation1_v_e19GG(1:10),'-s','LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,inflation1_v_e19ZZ(1:10),'LineWidth',3,'Color', [255, 0, 1]/255, marker='o')
hold on 
l4=plot(1:t,inflation1_v_e19ConsLTV(1:10)/10,'-s','LineWidth',3,'Color', '#020659')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color', '#0F5C8C');
legend([l2 l3 l4],{'Less active LTV','Baseline','Constant LTV'},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(c) inflation $\pi$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.6 0.2])

%export_fig OuLab_irfMPshock1.jpg  -m2.5 -painters
exportgraphics(fig7,'OuInfla_irfMPshock1.pdf');

%%
fig8 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,outputgap_v_e19GG(1:10),'-s','LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,outputgap_v_e19ZZ(1:10),'LineWidth',3,'Color', [255, 0, 1]/255, marker='o')
hold on 
l4=plot(1:t,outputgap_v_e19ConsLTV(1:10)/10,'-s','LineWidth',3,'Color', '#020659')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color', '#0F5C8C');
legend([l2 l3 l4],{'Less active LTV','Baseline','Constant LTV'},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(d) output gap $y-\bar{y}$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.2 0.01])

%export_fig OuLab_irfMPshock1.jpg  -m2.5 -painters
exportgraphics(fig8,'Ououtputgap_irfMPshock1.pdf');


% consumption 
fig81 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,c_v_e19GG(1:10),'-s','LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,c_v_e19ZZ(1:10),'LineWidth',3,'Color', [255, 0, 1]/255, marker='o')
hold on 
l4=plot(1:t,c_v_e19ConsLTV(1:10)/10,'-s','LineWidth',3,'Color', '#020659')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color', '#0F5C8C');
legend([l2 l3 l4],{'Less active LTV','Baseline','Constant LTV'},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(e) consumption $c$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.1 3])

%export_fig OuLab_irfMPshock1.jpg  -m2.5 -painters
exportgraphics(fig81,'Ouconsumpt_irfMPshock1.pdf');



% consumption 
fig81z = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,c_v_e19GG(1:10),'-s','LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,c_v_e19ZZ(1:10),'LineWidth',3,'Color', [255, 0, 1]/255, marker='o')
hold on 
l4=plot(1:t,c_v_e19ConsLTV(1:10)/10,'-s','LineWidth',3,'Color', '#020659')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color', '#0F5C8C');
legend([l2 l3 l4],{'Less active LTV','Baseline','Constant LTV'},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(e) consumption $c$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.1 3])

%export_fig OuLab_irfMPshock1.jpg  -m2.5 -painters
exportgraphics(fig81z,'Ouconsumpt_irfMPshock1.pdf');



% consumption 
fig81x = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,c_v_e19GG(1:10),'-s','LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,c_v_e19ZZ(1:10),'LineWidth',3,'Color', [255, 0, 1]/255, marker='o')
hold on 
l4=plot(1:t,c_v_e19ConsLTV(1:10)/10,'-s','LineWidth',3,'Color', '#020659')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color', '#0F5C8C');
legend([l2 l3 l4],{'Less active LTV','Baseline','Constant LTV'},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(e) consumption $c$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.1 3])

%export_fig OuLab_irfMPshock1.jpg  -m2.5 -painters
exportgraphics(fig81x,'Ouconsumpt_irfMPshock1.pdf');

%%
fig9 = figure('Position',[1 1 800-100 600-100]);


l2=plot(1:t,omegah_v_e19ConsLTV(1:10)* 1.0e+14,'-s','LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,omegah_v_e19ZZ(1:10)* 1.0e+15,'LineWidth',3,'Color', [255, 0, 1]/255, marker='o')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color', '#0F5C8C');
legend([l2 l3],{'cons ltv','Baseline'},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(a) default - households $\omega^{h}$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.8 0.3])

%export_fig OuLab_irfMPshock1.jpg  -m2.5 -painters
%exportgraphics(fig9,'OuDefauH_irfMPshock1.pdf');

fig10 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,omegae_v_e19ConsLTV(1:10)* 1.0e+15,'-s','LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,omegae_v_e19ZZ(1:10)* 1.0e+16,'LineWidth',3,'Color', [255, 0, 1]/255, marker='o')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color', '#0F5C8C');
legend([l2 l3],{'cons ltv','Baseline'},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(a) default - firms $\omega^{e}$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.2 0.3])

%export_fig OuLab_irfMPshock1.jpg  -m2.5 -painters
%exportgraphics(fig10,'OuDefauE_irfMPshock1.pdf');




%% *********


%%



t=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


subplot(1,2,1) % Output
l2=plot(1:t,d_h_v_e19GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,d_h_v_e19ZZ(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
l4=plot(1:t,d_h_v_e19ConsLTV(1:10)/10,'-s','LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3 l4],{'Less active LTV','Baseline','cons ltv'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
tg = ' housholds debt $d^{h}$ ';
title(tg,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.15 0.05])
ylabel('% points');


subplot(1,2,2) % Output
l2=plot(1:t,m_v_e19GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,m_v_e19ZZ(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
l4=plot(1:t,m_v_e19ConsLTV(1:10)/10,'-s','LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3 l4],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$','cons ltv'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
tg = ' business loan $m$ ';
title(tg,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points');

export_fig debt_irfMPshock.jpg  -m2.5 -painters

%% coexist  *****************  This exact (add here)

% BENCHMARK

t=10;
fig3 = figure('Position',[1 1 800-100 600-100]);


plot(1:t,Y_v_e6ZZ(1:10),'-s','LineWidth',3,'Color', '#0F95D7')
hold on;

plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color','#0F5C8C');
%legend([l2 l3],{'Output','Labor'},'Interpreter','latex','FontSize',20,'Location','best')
axis tight; 
t = '(a) shock to $\phi^{e}$ - output ';
title(t,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%%ylim([-0.01 0.05])
ylabel(' \% dev. from the ss','Interpreter','latex');


%export_fig COEXB_irfCollshock.jpg  -m2.5 -painters
exportgraphics(fig3,'COEXB_irfCollshock.pdf');
 % 


t=10;
fig3z = figure('Position',[1 1 800-100 600-100]);


plot(1:t,L_v_e6ZZ(1:10),'-','LineWidth',3,'Color', [255, 0, 1]/255, marker='o');
hold on;
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color','#0F5C8C');
%legend([l2 l3],{'Output','Labor'},'Interpreter','latex','FontSize',20,'Location','best')
axis tight; 
t = '(c) shock to $\phi^{e}$ - labor ';
title(t,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%%ylim([-0.01 0.1])
ylabel(' \% dev. from the ss','Interpreter','latex');


%export_fig COEXB_irfCollshock.jpg  -m2.5 -painters
exportgraphics(fig3z,'COEXB_irfCollshockc.pdf');

%% ****************   This exact (add here)
% BENCHMARK

%t = 1:1:10;
t=10;
fig4 = figure('Position',[1 1 800-100 600-100]);


plot(1:t,Y_v_e7ZZ(1:10)* 1.0e+16 ,'-s','LineWidth',3,'Color', '#0F95D7')
hold on;

plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color','#0F5C8C');
axis tight; 
t = '(b) shock to $\phi^{h}$ - output';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%%ylim([-0.05 1.4])
ylabel(' \% dev. from the ss','Interpreter','latex');


%export_fig COEXH_irfCollshock.jpg  -m2.5 -painters
exportgraphics(fig4,'COEXH_irfCollshock.pdf');

t=10;
fig4z = figure('Position',[1 1 800-100 600-100]);

plot(1:t,L_v_e7ZZ(1:10)* 1.0e+16,'-','LineWidth',3,'Color', [255, 0, 1]/255, marker='o');
hold on;
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color','#0F5C8C');
axis tight; 
t = '(d) shock to $\phi^{h}$ - labor ';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%%ylim([-0.05 0.5])
ylabel(' \% dev. from the ss','Interpreter','latex');


%export_fig COEXH_irfCollshock.jpg  -m2.5 -painters
exportgraphics(fig4z,'COEXH_irfCollshockd.pdf');

%% 
%omegae_v_e19 omegae_v_e6 omegae_v_e4...
%omegah_v_e19 omegah_v_e7 omegah_v_e5








%  
%% wealth_unconst_ss
%% wealth_const_ss 
%% wealth_social_ss

%%   wealth_social_ss  = (1-bbeta) * wealth_unconst_ss + (1-bbeta2) * wealth_const_ss ; 
%  (1-bbeta) * sum(wealth_unconst_v_e19ZZ)  +  (1-bbeta2) * sum(wealth_const_v_e19ZZ)   

% Short run
varname={'ZZ'};
%Q1_G = table([sum(wealth_social_v_e19ZZ/wealth_social_ss)+ wealth_social_ss],'VariableNames',varname);
Q1_G = table([(1-bbeta) * sum(wealth_unconst_v_e19ZZ)  +  (1-bbeta2) * sum(wealth_const_v_e19ZZ)],'VariableNames',varname);

writetable(Q1_G,'WELFARETables_.xlsx','Sheet','SR','Range','C3')



%%  sce 


% Short run
varname={'GG'};
%Q1_G = table([sum(wealth_social_v_e19GG/wealth_social_ss)+ wealth_social_ss],'VariableNames',varname);
Q1_G = table([(1-bbeta) * sum(wealth_unconst_v_e19GG)  +  (1-bbeta2) * sum(wealth_const_v_e19GG)],'VariableNames',varname);

% Store the values in Tables.xlsx

writetable(Q1_G,'WELFARETables_.xlsx','Sheet','SR','Range','C5')



%%


% Short run
varname={'WW'};
%Q1_G = table([sum(wealth_social_v_e19WW/wealth_social_ss)+ wealth_social_ss],'VariableNames',varname);
Q1_G = table([(1-bbeta) * sum(wealth_unconst_v_e19WW)  +  (1-bbeta2) * sum(wealth_const_v_e19WW)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFARETables_.xlsx','Sheet','SR','Range','C7')


%%

% Short run
varname={'CON LTV'};
%Q1_G = table([sum(wealth_social_v_e19ConsLTV/wealth_social_ss)+wealth_social_ss],'VariableNames',varname);
Q1_G = table([(1-bbeta) * sum(wealth_unconst_v_e19ConsLTV)  +  (1-bbeta2) * sum(wealth_const_v_e19ConsLTV)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFARETables_.xlsx','Sheet','SR','Range','C9')


%%  'ZZ','GG','WW','CONSLTV',
% 'HH',
% 'ENDO
varname={'HH'};
%Q1_G = table([sum(wealth_social_v_e19HH/wealth_social_ss)+wealth_social_ss],'VariableNames',varname);
Q1_G = table([(1-bbeta) * sum(wealth_unconst_v_e19HH)  +  (1-bbeta2) * sum(wealth_const_v_e19HH)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFARETables_.xlsx','Sheet','SR','Range','C11')


varname={'ENDO'};
%Q1_G = table([sum(wealth_social_v_e19ENDO/wealth_social_ss)+wealth_social_ss],'VariableNames',varname);
Q1_G = table([(1-bbeta) * sum(wealth_unconst_v_e19ENDO)  +  (1-bbeta2) * sum(wealth_const_v_e19ENDO)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFARETables_.xlsx','Sheet','SR','Range','C14')

%%


%% MP on h








% Short run
varname={'oh sr ZZ','GG','WW','CONSLTV','HH','ENDO'};
Q1_GH = table(omegah_v_e19ZZ(1)*10^(15), omegah_v_e19GG(1)*10^(16),0,omegah_v_e19ConsLTV(1)*10^(15),omegah_v_e19HH(1)*10^(15),omegah_v_e19ENDO(1),'VariableNames',varname)

Q4_GH = table(omegah_v_e19ZZ(6)*10^(15), omegah_v_e19GG(6)*10^(16),0,omegah_v_e19ConsLTV(6)*10^(15),omegah_v_e19HH(6)*10^(15),omegah_v_e19ENDO(6),'VariableNames',varname)

Table_1=table(Q1_GH,Q4_GH);

varname={'oh lr ZZ','GG','WW','CONSLTV','HH','ENDO'};
%long-run 
Q8_GH =  table(omegah_v_e19ZZ(8)*10^(15), omegah_v_e19GG(8)*10^(16),0,omegah_v_e19ConsLTV(8)*10^(15),omegah_v_e19HH(8)*10^(15),omegah_v_e19ENDO(8),'VariableNames',varname)

Q20_GH =  table(omegah_v_e19ZZ(20)*10^(15), omegah_v_e19GG(20)*10^(16),0,omegah_v_e19ConsLTV(20)*10^(15),omegah_v_e19HH(20)*10^(15),omegah_v_e19ENDO(20),'VariableNames',varname)


varname={'oh std ZZ','GG','WW','CONSLTV','HH','ENDO'};
Q20_GHSTD =  table(std(omegah_v_e19ZZ(1:20)*10^(15)), std(omegah_v_e19GG(1:20)*10^(16)),0,std(omegah_v_e19ConsLTV(1:20)*10^(15)),std(omegah_v_e19HH(1:20)*10^(15)),std(omegah_v_e19ENDO(1:20)),'VariableNames',varname)


Table_2=table(Q8_GH,Q20_GH);

% Store the values in Tables.xlsx

writetable(Q1_GH,'Tables_130.xlsx','Sheet','SR','Range','C3')

writetable(Q4_GH,'Tables_130.xlsx','Sheet','SR','Range','C5')

writetable(Q8_GH,'Tables_130.xlsx','Sheet','SR','Range','C7')

writetable(Q20_GH,'Tables_130.xlsx','Sheet','SR','Range','C9')



% Short run
varname={'oe sr ZZ','GG','WW','CONSLTV','HH','ENDO'};
Q1_G = table(omegae_v_e19ZZ(1)*10^(16), omegae_v_e19GG(1)*10^(16),0,omegae_v_e19ConsLTV(1)*10^(15),omegae_v_e19HH(1)*10^(15),omegae_v_e19ENDO(1),'VariableNames',varname);
Q4_G = table(omegae_v_e19ZZ(6)*10^(16), omegae_v_e19GG(6)*10^(16),0,omegae_v_e19ConsLTV(6)*10^(15),omegae_v_e19HH(6)*10^(15),omegae_v_e19ENDO(6),'VariableNames',varname);

Table_1=table(Q1_G,Q4_G);

varname={'oe lr ZZ','GG','WW','CONSLTV','HH','ENDO'};
%long-run 
Q8_G = table(omegae_v_e19ZZ(8)*10^(16), omegae_v_e19GG(8)*10^(16),0,omegae_v_e19ConsLTV(8)*10^(15),omegae_v_e19HH(8)*10^(15),omegae_v_e19ENDO(8),'VariableNames',varname);
Q20_G = table(omegae_v_e19ZZ(20)*10^(16), omegae_v_e19GG(20)*10^(16),0,omegae_v_e19ConsLTV(20)*10^(15),omegae_v_e19HH(20)*10^(15),omegae_v_e19ENDO(20),'VariableNames',varname);

Table_2=table(Q8_G,Q20_G);

varname={'oe std ZZ','GG','WW','CONSLTV','HH','ENDO'};
Q20_GSTD = table(std(omegae_v_e19ZZ(1:20)*10^(16)), std(omegae_v_e19GG(1:20)*10^(16)),0,std(omegae_v_e19ConsLTV(1:20)*10^(15)),std(omegae_v_e19HH(1:20)*10^(15)),std(omegae_v_e19ENDO(1:20)),'VariableNames',varname);




varname={'qh std ZZ','GG','WW','CONSLTV','HH','ENDO'};
Q20_GSTDQ = table(std(Qh_v_e19ZZ(1:20)), std(Qh_v_e19GG(1:20)),std(Qh_v_e19WW(1:20)/10),std(Qh_v_e19ConsLTV(1:20)*1),std(Qh_v_e19HH(1:20)/10),std(Qh_v_e19ENDO(1:20)),'VariableNames',varname);


varname={'c std ZZ','GG','WW','CONSLTV','HH','ENDO'};
Q20_GSTDC = table(std(c_v_e19ZZ(1:20)), std(c_v_e19GG(1:20)),std(c_v_e19WW(1:20)/10),std(c_v_e19ConsLTV(1:20)*1),std(c_v_e19HH(1:20)/10),std(c_v_e19ENDO(1:20)),'VariableNames',varname);

% Store the values in Tables.xlsx

writetable(Q1_G,'Tables_130.xlsx','Sheet','SR','Range','C11')
writetable(Q4_G,'Tables_130.xlsx','Sheet','SR','Range','C13')

writetable(Q8_G,'Tables_130.xlsx','Sheet','SR','Range','C15')
writetable(Q20_G,'Tables_130.xlsx','Sheet','SR','Range','C17')

writetable(Q20_GSTD,'Tables_130.xlsx','Sheet','SR','Range','C19')
writetable(Q20_GHSTD,'Tables_130.xlsx','Sheet','SR','Range','C21')

writetable(Q20_GSTDQ,'Tables_130.xlsx','Sheet','SR','Range','C23')
writetable(Q20_GSTDC,'Tables_130.xlsx','Sheet','SR','Range','C25')

%%


% Short run
varname={'ZZ'};
Q1_G = table([sum(wealth_const_v_e19ZZ)],'VariableNames',varname);

% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREconstTables_.xlsx','Sheet','SR','Range','C3')

%%  ****
% Short run
varname={'GG'};
Q1_GWW = table([sum(wealth_const_v_e19GG)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_GWW,'WELFAREconstTables_.xlsx','Sheet','SR','Range','C5')


%%

% Short run
varname={'WW'};
Q1_G = table([sum(wealth_const_v_e19WW)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREconstTables_.xlsx','Sheet','SR','Range','C7')



% Short run
varname={'CONSLTV'};
Q1_G = table([sum(wealth_const_v_e19ConsLTV)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREconstTables_.xlsx','Sheet','SR','Range','C9')


%%  'ZZ','GG','WW','CONSLTV',
% 'HH',
% 'ENDO
varname={'HH'};
Q1_G = table([sum(wealth_const_v_e19HH)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREconstTables_.xlsx','Sheet','SR','Range','C11')

varname={'ENDO'};
Q1_G = table([sum(wealth_const_v_e19ENDO)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREconstTables_.xlsx','Sheet','SR','Range','C14')
%%


% Short run
varname={'ZZ'};
Q1_G = table([sum(wealth_unconst_v_e19ZZ)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREunconstTables_.xlsx','Sheet','SR','Range','C3')

% Short run
varname={'GG'};
Q1_G = table([sum(wealth_unconst_v_e19GG)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREunconstTables_.xlsx','Sheet','SR','Range','C5')



% Short run
varname={'WW'};
Q1_G = table([sum(wealth_unconst_v_e19WW)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREunconstTables_.xlsx','Sheet','SR','Range','C7')


% Short run
varname={'CONS LTV'};
Q1_G = table([sum(wealth_unconst_v_e19ConsLTV)],'VariableNames',varname);


writetable(Q1_G,'WELFAREunconstTables_.xlsx','Sheet','SR','Range','C9')




%%  'ZZ','GG','WW','CONSLTV',
% 'HH',
% 'ENDO
varname={'HH'};
Q1_G = table([sum(wealth_unconst_v_e19HH)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREunconstTables_.xlsx','Sheet','SR','Range','C11')

varname={'ENDO'};
Q1_G = table([sum(wealth_unconst_v_e19ENDO)],'VariableNames',varname);


% Store the values in Tables.xlsx

writetable(Q1_G,'WELFAREunconstTables_.xlsx','Sheet','SR','Range','C14')


%%

load('irf_plot_with_policy.mat')








t=10;

fig7 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,Y_v_e19ZZ(1:10),'-s','LineWidth',3,'Color',  '#0F95D7')
hold on;
l3=plot(1:t,Y_v_e19WW(1:10),'-','LineWidth',3,'Color',[255, 0, 1]/255, marker='o')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color','#0F5C8C');
legend([l2 l3],{'Baseline','Fixed delinquency rates  '},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(a) output $y$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-1 0.05])

%export_fig OuLab_irfMPshock1Iffixed.jpg  -m2.5 -painters
exportgraphics(fig7,'OuLab_irfMPshock1Iffixed.pdf');


t=10;
fig8 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,L_v_e19ZZ(1:10),'-s','LineWidth',3,'Color',   '#0F95D7')
hold on 
l3=plot(1:t,L_v_e19WW(1:10),'-','LineWidth',3,'Color',[255, 0, 1]/255, marker='o')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color','#0F5C8C');
legend([l2 l3],{'Baseline','Fixed delinquency rates  '},'Interpreter','latex','FontSize',18,'Location','best')
axis tight; 
tg = '(b) labor $l$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-2 0.1])

ylabel(' \% dev. from the ss','Interpreter','latex');


%export_fig OuLab_irfMPshockIffixed.jpg  -m2.5 -painters
exportgraphics(fig8,'OuLab_irfMPshockIffixed.pdf');




%%
load('irf_plot_with_policy.mat')

%%






t=10;

fig9 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,Y_v_e19ZZ(1:10),'-s','LineWidth',3,'Color',   '#0F95D7')
hold on;
l3=plot(1:t,Y_v_e19ENDO(1:10),'-','LineWidth',3,'Color',[255, 0, 1]/255, marker='o')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color','#0F5C8C');
legend([l2 l3],{'Baseline','Endog. delinquency rates  '},'Interpreter','latex','FontSize',18,'Location','best')
ylabel(' \% dev. from the ss','Interpreter','latex');
hold on
axis tight; 
tg = '(a) output $y$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';

%export_fig OuLab_irfMPshock1IfENDO.jpg  -m2.5 -painters
exportgraphics(fig9,'OuLab_irfMPshock1IfENDO.pdf');


t=10;
fig10 = figure('Position',[1 1 800-100 600-100]);



l2=plot(1:t,L_v_e19ZZ(1:10),'-s','LineWidth',3,'Color',   '#0F95D7')
hold on 
l3=plot(1:t,L_v_e19ENDO(1:10),'-','LineWidth',3,'Color',[255, 0, 1]/255, marker='o')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color','#0F5C8C');
legend([l2 l3],{'Baseline','Endog. delinquency rate'},'Interpreter','latex','FontSize',18,'Location','best')
axis tight; 
tg = '(b) labor $l$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.35 0.005])

ylabel(' \% dev. from the ss','Interpreter','latex');


%export_fig OuLab_irfMPshockIfENDO.jpg  -m2.5 -painters
exportgraphics(fig10,'OuLab_irfMPshockIfENDO.pdf');

%%


%%

%%


%% Y_v_e19GG, Y_v_e19,omegah_v_e19, omegae_v_e19

% Select the first 10 elements of each vector/matrix
Y  = (Y_ss *(1+Y_v_e19ZZ(1:10)  )); 
Y1 = (Y_ss *(1+Y_v_e19GG(1:10) ));


W  = (L_ss* (1+L_v_e19ZZ(1:10) ));
W1 = (L_ss* (1+L_v_e19GG(1:10) ));

Y0  = (Y_ss* (1-Y_v_e19ZZ(1:10) )); 
Y01 = (Y_ss* (1-Y_v_e19GG(1:10) ));


W0  = (L_ss *(1-L_v_e19ZZ(1:10) ));
W01 = (L_ss *(1-L_v_e19GG(1:10) ));
figure

% Plot the surface
plot(W, Y,'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); hold on
plot(W1, Y1,'LineWidth',3,'Color', '#0F95D7'); hold on
% Add zero lines
xline(0, '--k', 'LineWidth', 1); % Vertical line at x = 0
yline(0, '--k', 'LineWidth', 1); % Horizontal line at y = 0
% Add text annotations
text(0.12, 0.23, {'Expansionary','monetary policy'}, 'HorizontalAlignment', 'right', 'FontSize', 10,'Interpreter','latex');
text(0.105, 0.225, {'Contractionary','monetary policy'}, 'HorizontalAlignment', 'left', 'FontSize', 10,'Interpreter','latex');

plot(W0, Y0,'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); hold on
plot(W01, Y01,'LineWidth',3,'Color', '#0F95D7'); hold on


legend({'Benchmark','Less active macroprudential policy'},'Interpreter','latex','FontSize',10,'Location','northwest')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
axis tight; 
xlim([-0.108 0.12])
ylim([-0.22 0.235])


% Add labels and title
xlabel('Labor','Interpreter','latex');
ylabel('Ouput','Interpreter','latex');
%%

output_var= y_IRF_both_nofric(strmatch('Y_v',M_.endo_names,'exact'),:)
kappah_v_var= y_IRF_both_nofric(strmatch('kappah_v',M_.endo_names,'exact'),:)
kappae_v_var= y_IRF_both_nofric(strmatch('kappae_v',M_.endo_names,'exact'),:)


%%

figure
coefficients = polyfit(kappah_v_var, output_var, 1); % Fit a first-degree polynomial (line)

% Generate x values for the line
x_values = linspace(min(kappah_v_var), max(kappah_v_var), 100);

% Calculate corresponding y values using the fitted coefficients
y_values = polyval(coefficients, x_values);

plot(x_values, y_values, 'LineWidth', 1, 'Color', '#FFA500'); % Plot the linear regression line

% Plot the surface
scatter(kappah_v_var, output_var,'Color',[255, 0, 1]/255); hold on
scatter(kappae_v_var, output_var,'Color', '#0F95D7'); hold on
% Add zero lines
xline(0, '--k', 'LineWidth', 1); % Vertical line at x = 0
yline(0, '--k', 'LineWidth', 1); % Horizontal line at y = 0
% Add text annotations
text(4, 3, {'Expansionary','monetary policy'}, 'HorizontalAlignment', 'right', 'FontSize', 10,'Interpreter','latex');
text(-4.4, -3, {'Contractionary','monetary policy'}, 'HorizontalAlignment', 'left', 'FontSize', 10,'Interpreter','latex');



legend({'Benchmark','Less active macroprudential policy'},'Interpreter','latex','FontSize',10,'Location','northwest')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
axis tight; 
%ylim([-5 5])
%xlim([-5 5])


% Add labels and title
xlabel('Labor','Interpreter','latex');
ylabel('Ouput','Interpreter','latex');
%%


figure 

% Perform linear regression
coefficients = polyfit(kappah_v_var, output_var, 1); % Fit a first-degree polynomial (line)

% Generate x values for the line
x_values = linspace(min(kappah_v_var), max(kappah_v_var), 200);

% Calculate corresponding y values using the fitted coefficients
y_values = polyval(coefficients, x_values);

% Plot the linear regression line
plot(x_values, y_values, 'LineWidth', 3, 'Color', '#FFA500'); % Plot the linear regression line

% Plot the scatter plot
scatter(kappah_v_var, output_var,'Color',[255, 0, 1]/255); hold on
scatter(kappae_v_var, output_var,'Color', '#0F95D7'); hold on

% Add zero lines and text annotations
xline(0, '--k', 'LineWidth', 1); % Vertical line at x = 0
yline(0, '--k', 'LineWidth', 1); % Horizontal line at y = 0
text(4, 3, {'Expansionary','monetary policy'}, 'HorizontalAlignment', 'right', 'FontSize', 10,'Interpreter','latex');
text(-4.4, -3, {'Contractionary','monetary policy'}, 'HorizontalAlignment', 'left', 'FontSize', 10,'Interpreter','latex');

% Add legend and format plot
legend({'Benchmark','Less active macroprudential policy', 'Linear Regression'}, 'Interpreter', 'latex', 'FontSize', 10, 'Location', 'northwest')
ax = gca;
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
axis tight; 
xlabel('Labor','Interpreter','latex'); % Add labels and title
ylabel('Ouput','Interpreter','latex');


%%


%%  'oh sr ZZ','GG',   benchamrek  + less active ltv


fullPath2 = 'C:/Users/ak922/Dropbox/Al_Bz/MATLAB/papercollateral2/example1linearID/Output/example1linearID_results.mat'
data2 = load(fullPath2);

exmpstdZZ =sqrt(diag(data2.oo_.var))
%exmpstd2(strmatch('Qh_v',M_.endo_names,'exact'),:)
exmpmeanZZ = data2.oo_.mean





%% 'ENDO'
fullPath3 = 'C:/Users/ak922/Dropbox/Al_Bz/MATLAB/papercollateral2/example1linearEndo11/Output/example1linearEndo11_results.mat'
% Use the load function to load data from the specified path
data3 = load(fullPath3);
exmpstdENDO =sqrt(diag(data3.oo_.var))
%exmpstd2(strmatch('Qh_v',M_.endo_names,'exact'),:)
exmpmeanENDO = data3.oo_.mean

%% , 'CONSLTV',
fullPath4 = 'C:/Users/ak922/Dropbox/Al_Bz/MATLAB/papercollateral2/example1linearFixedLTV/Output/example1linearFixedLTV_results.mat'
% Use the load function to load data from the specified path
data4 = load(fullPath4);

exmpstdCONSLTV =sqrt(diag(data4.oo_.var))
exmpmeanCONSLTV =data4.oo_.mean
%% HH
fullPath5 = 'C:/Users/ak922/Dropbox/Al_Bz/MATLAB/papercollateral2/example1linearHousing/Output/example1linearHousing_results.mat'
% Use the load function to load data from the specified path
data5 = load(fullPath5);
exmpstdHH =sqrt(diag(data5.oo_.var))
%exmpstd2(strmatch('Qh_v',M_.endo_names,'exact'),:)
exmpmeanHH =data5.oo_.mean

%% WW   determinsitic default
fullPath6 = 'C:/Users/ak922/Dropbox/Al_Bz/MATLAB/papercollateral2/example1linearID001/Output/example1linearID001_results.mat'
% Use the load function to load data from the specified path
data6 = load(fullPath6);

exmpstdWW =sqrt(diag(data6.oo_.var))
%exmpstd2(strmatch('Qh_v',M_.endo_names,'exact'),:)
exmpmeanWW =data6.oo_.mean
%%



% 
varname={'VALUES STD (stabilization) ZZ','WW','CONSLTV','HH','ENDO'};
QH_STD = table(exmpstdZZ(strmatch('Qh_v',M_.endo_names,'exact'),:), exmpstdWW(strmatch('Qh_v',M_.endo_names,'exact'),:),exmpstdCONSLTV(strmatch('Qh_v',data4.M_.endo_names,'exact'),:),exmpstdHH(strmatch('Qh_v',M_.endo_names,'exact'),:),exmpstdENDO(strmatch('Qh_v',data3.M_.endo_names,'exact'),:),'VariableNames',varname)
c_STD = table(exmpstdZZ(strmatch('c_v',M_.endo_names,'exact'),:), exmpstdWW(strmatch('c_v',M_.endo_names,'exact'),:),exmpstdCONSLTV(strmatch('c_v',data4.M_.endo_names,'exact'),:),exmpstdHH(strmatch('c_v',M_.endo_names,'exact'),:),exmpstdENDO(strmatch('c_v',data3.M_.endo_names,'exact'),:),'VariableNames',varname)
omegah_STD = table(exmpstdZZ(strmatch('omegah_v',M_.endo_names,'exact'),:), exmpstdWW(strmatch('omegah_v',M_.endo_names,'exact'),:),exmpstdCONSLTV(strmatch('omegah_v',data4.M_.endo_names,'exact'),:),exmpstdHH(strmatch('omegah_v',M_.endo_names,'exact'),:),exmpstdENDO(strmatch('omegah_v',data3.M_.endo_names,'exact'),:),'VariableNames',varname)
omegae_STD = table(exmpstdZZ(strmatch('omegae_v',M_.endo_names,'exact'),:), exmpstdWW(strmatch('omegae_v',M_.endo_names,'exact'),:),exmpstdCONSLTV(strmatch('omegae_v',data4.M_.endo_names,'exact'),:),exmpstdHH(strmatch('omegae_v',M_.endo_names,'exact'),:),exmpstdENDO(strmatch('omegae_v',data3.M_.endo_names,'exact'),:),'VariableNames',varname)
d_h_STD = table(exmpstdZZ(strmatch('d_h_v',M_.endo_names,'exact'),:), exmpstdWW(strmatch('d_h_v',M_.endo_names,'exact'),:),exmpstdCONSLTV(strmatch('d_h_v',data4.M_.endo_names,'exact'),:),exmpstdHH(strmatch('d_h_v',M_.endo_names,'exact'),:),exmpstdENDO(strmatch('d_h_v',data3.M_.endo_names,'exact'),:),'VariableNames',varname)
m_STD = table(exmpstdZZ(strmatch('m_v',M_.endo_names,'exact'),:), exmpstdWW(strmatch('m_v',M_.endo_names,'exact'),:),exmpstdCONSLTV(strmatch('m_v',data4.M_.endo_names,'exact'),:),exmpstdHH(strmatch('m_v',M_.endo_names,'exact'),:),exmpstdENDO(strmatch('m_v',data3.M_.endo_names,'exact'),:),'VariableNames',varname)

varname={'VALUES mean welfare ZZ','WW','CONSLTV','HH','ENDO'};
wealth_unconst_mean = table(wealth_unconst_ss + exmpmeanZZ(strmatch('wealth_unconst_v',M_.endo_names,'exact'),:), ...
    wealth_unconst_ss + exmpmeanWW(strmatch('wealth_unconst_v',data6.M_.endo_names,'exact'),:), ...
    wealth_unconst_ss +  exmpmeanCONSLTV(strmatch('wealth_unconst_v',data4.M_.endo_names,'exact'),:), ...
    wealth_unconst_ss +  exmpmeanHH(strmatch('wealth_unconst_v',M_.endo_names,'exact'),:), ...
    wealth_unconst_ss +  exmpmeanENDO(strmatch('wealth_unconst_v',M_.endo_names,'exact'),:),'VariableNames',varname)
wealth_const_mean = table(wealth_const_ss + exmpmeanZZ(strmatch('wealth_const_v',M_.endo_names,'exact'),:), ...
    wealth_const_ss +  exmpmeanWW(strmatch('wealth_const_v',data6.M_.endo_names,'exact'),:), ...
    wealth_const_ss +  exmpmeanCONSLTV(strmatch('wealth_const_v',data4.M_.endo_names,'exact'),:), ...
    wealth_const_ss +  wealth_const_ss +  exmpmeanHH(strmatch('wealth_const_v',M_.endo_names,'exact'),:), ...
    wealth_const_ss +  exmpmeanENDO(strmatch('wealth_const_v',M_.endo_names,'exact'),:),'VariableNames',varname)
wealth_social_mean = table((1-bbeta) * (wealth_unconst_ss + exmpmeanZZ(strmatch('wealth_unconst_v',M_.endo_names,'exact'),:) ) +  (1-bbeta2) * (wealth_const_ss +  exmpmeanZZ(strmatch('wealth_const_v',M_.endo_names,'exact'),:)), ...
    (1-bbeta) * (wealth_unconst_ss +  exmpmeanWW(strmatch('wealth_unconst_v',data6.M_.endo_names,'exact'),:)  )+  (1-bbeta2) * (wealth_const_ss + exmpmeanWW(strmatch('wealth_const_v',data6.M_.endo_names,'exact'),:)), ...
    (1-bbeta) * (wealth_unconst_ss + exmpmeanCONSLTV(strmatch('wealth_unconst_v',data4.M_.endo_names,'exact'),:) ) +  (1-bbeta2) * (wealth_const_ss + exmpmeanCONSLTV(strmatch('wealth_const_v',data4.M_.endo_names,'exact'),:)), ...
    (1-bbeta) * (wealth_unconst_ss + exmpmeanHH(strmatch('wealth_unconst_v',M_.endo_names,'exact'),:) ) +  (1-bbeta2) * (wealth_const_ss + exmpmeanHH(strmatch('wealth_const_v',M_.endo_names,'exact'),:)), ... 
(1-bbeta) * (wealth_unconst_ss + exmpmeanENDO(strmatch('wealth_unconst_v',data3.M_.endo_names,'exact'),:) ) +  (1-bbeta2) * (wealth_const_ss + exmpmeanENDO(strmatch('wealth_const_v',data3.M_.endo_names,'exact'),:)),'VariableNames',varname)


writetable(QH_STD,'VALUESSTDMEANTables_.xlsx','Sheet','SR','Range','C5')
writetable(c_STD,'VALUESSTDMEANTables_.xlsx','Sheet','SR','Range','C7')
writetable(omegah_STD,'VALUESSTDMEANTables_.xlsx','Sheet','SR','Range','C9')
writetable(omegae_STD,'VALUESSTDMEANTables_.xlsx','Sheet','SR','Range','C11')
writetable(d_h_STD,'VALUESSTDMEANTables_.xlsx','Sheet','SR','Range','C13')
writetable(m_STD,'VALUESSTDMEANTables_.xlsx','Sheet','SR','Range','C15')
writetable(wealth_unconst_mean,'VALUESSTDMEANTables_.xlsx','Sheet','SR','Range','C17')
writetable(wealth_const_mean,'VALUESSTDMEANTables_.xlsx','Sheet','SR','Range','C19')
writetable(wealth_social_mean,'VALUESSTDMEANTables_.xlsx','Sheet','SR','Range','C21')


