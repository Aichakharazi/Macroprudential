% I report the plots for the experiments 
% I can plot my counterfacyuals

load('y_IRF_both_nofric');

load('y_IRF_both_noprudential');

load('datalogdiff84.mat')


% USE THIS FOR PLOTS:CIloandef_capita Hloandef_capita GDPdef_capita
%%

load('Recessions.mat')
start=Recessions(:,1);
finish=Recessions(:,2);
%%

%timeline=1984.25:0.25:2021.75;
startdate = datenum('Q2-1984','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy');
enddate = datenum('Q4-2021','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy'); 
timeline = linspace(startdate,enddate,151);


%% 

% Set text interpreter for figures to latex

%% policy switching
figure('color','w')
set(gcf,'Units', 'Normalized','OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','latex') 
%set(0,'defaultUicontrolFontName','latex') 
%set(0,'defaultUitableFontName','latex') 
%set(0,'defaultAxesFontName','latex') 
%set(0,'defaultTextFontName','latex') 
%set(0,'defaultUipanelFontName','latex') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');
%set(groot,'defaulttextinterpreter','latex');

% y_IRF_both_nofric
% y_IRF_both_noprudential

l2=plot(timeline,100*y_IRF_both_nofric(strmatch('gdpobs',M_.endo_names,'exact'),:),'-.' ,'LineWidth',2.5,'Color', [242, 109, 116]/255);hold on
%l2=plot(timeline,GDPdef_capita(1).*(1+y_IRF_both_noprudential(strmatch('Y_v',M_.endo_names,'exact'),:)),'-.' ,'LineWidth',2.5,'Color',[242, 109, 116]/255);hold on
l3=plot(timeline,100*gdpobs,'LineWidth',2.5,'Color',[0, 158, 169]/255);hold on
%l3=plot(timeline,GDPdef_capita(1:end-1),'LineWidth',2.5,'Color',[0, 158, 169]/255);hold on

%plot(timeline,100*y_IRF_prod_baseline(strmatch('Y_v',M_.endo_names,'exact'),:),'--' ,'LineWidth',2,'Color',[193, 2, 2]/255);hold off

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
%title('Output','FontSize',30);
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 30;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('\% points','interpreter','latex');


%set(0,'FontSize',14) %and other properties
%xlabel(['$',xlab,'$'],'interpreter','latex')
%ylabel(['$',ylab,'$'],'interpreter','latex')



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
 data=load('benchmark');
 f=fieldnames(data);
 for k=1:size(f,1)
   xlswrite('Simulatedbenchmarke.xlsx',data.(f{k}),f{k})
 end

%%
kappaeexp1 = y_IRF_both_nofric(strmatch('kappae_v',M_.endo_names,'exact'),:)/kappae_ss;
kappahexp1 = y_IRF_both_nofric(strmatch('kappah_v',M_.endo_names,'exact'),:)/kappah_ss;

figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
%set(0,'defaultUicontrolFontName','cambria math') 
%set(0,'defaultUitableFontName','cambria math') 
%set(0,'defaultAxesFontName','cambria math') 
%set(0,'defaultTextFontName','cambria math') 
%set(0,'defaultUipanelFontName','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
%set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');


subplot(1,2,1)
%l2=
plot(timeline,kappaeexp1,'-' ,'LineWidth',2.5,'Color', [242, 109, 116]/255);hold on
%plot(timeline,100*y_IRF_prod_baseline(strmatch('Y_v',M_.endo_names,'exact'),:),'--' ,'LineWidth',2,'Color',[193, 2, 2]/255);hold off
axis tight;  
shadeyears(start,finish);
hold on;
%legend([l2 l3],{'Model', 'Data'},'FontSize',25,'Location','best')
axis tight; 
t = ' Collateral Requirement $\phi^{e}$ ';
title(t,'interpreter','latex')
%title('Collateral Requirement \phi^{e} ','FontSize',30);
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
%legend([l2 l3],{'Model', 'Data'},'FontSize',25,'Location','best')
t = ' Collateral Requirement $\phi^{h}$ ';
title(t,'interpreter','latex')
%title('Collateral Requirement - \phi^{h} ','FontSize',30);
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
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


sigmaomegae_vexp1 = y_IRF_both_nofric(strmatch('sigmaomegae_v',M_.endo_names,'exact'),:)/sigmaomegae_ss;
sigmaomegah_vexp1 =  y_IRF_both_nofric(strmatch('sigmaomegah_v',M_.endo_names,'exact'),:)/sigmaomegah_ss;
subplot(2,1,1)
l2=plot(timeline,sigmaomegae_vexp1,'-' ,'LineWidth',2.5,'Color', [242, 109, 116]/255);hold on
%plot(timeline,100*y_IRF_prod_baseline(strmatch('Y_v',M_.endo_names,'exact'),:),'--' ,'LineWidth',2,'Color',[193, 2, 2]/255);hold off
axis tight;  
shadeyears(start,finish);
hold on;
%legend([l2 l3],{'Model', 'Data'},'FontSize',25,'Location','best')
%title('Deliquency rate - Firm Loan ','FontSize',30);
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
%legend([l2 l3],{'Model', 'Data'},'FontSize',25,'Location','best')
%title('Deliquency rate - Consumer Loan ','FontSize',30);
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
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

%subplot(1,2,1)
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
ylabel(' \% points ','interpreter','Latex');
export_fig DebtSimul1.jpg  -m2.5 -painters


%subplot(1,2,2)

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
%title('Consumer Debt d^{h}','FontSize',10);
t = ' Household debt: $d^{h}$ ';
title(t,'interpreter','latex')
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 30;
ax.XGrid = 'off';
ax.YGrid = 'on';

ylabel('\% points','interpreter','latex');


export_fig DebtSimul.jpg  -m2.5 -painters

%%

figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


%1.0e+5*
l2=plot(timeline,100*y_IRF_both_nofric(strmatch('I_v',M_.endo_names,'exact'),:),'-' ,'LineWidth',2.5,'Color', [242, 109, 116]/255);hold on
l3=plot(timeline,100*investobs,'--','LineWidth',2.5,'Color',[0, 158, 169]/255);hold on
%plot(timeline,100*y_IRF_prod_baseline(strmatch('Y_v',M_.endo_names,'exact'),:),'--' ,'LineWidth',2,'Color',[193, 2, 2]/255);hold off
axis tight;  
shadeyears(start,finish);
hold on;
legend([l2 l3],{'Model', 'Data'},'FontSize',25,'Location','best')
t = ' investment $i$ ';
title(t,'interpreter','latex')
%title('Investment','FontSize',30);
datetick('x','yyyy','keepticks');
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;

ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points','interpreter','latex');


export_fig InvSimul.jpg  -m2.5 -painters


%%  do collatreal stabilize prices


%export_fig test6.jpg 

%y_IRF_both_nofric
%y_IRF_both_fric
%y_IRF_both_baseline


%export_fig test7.jpg 










%% 3) da14523withdates a 
%--------------------------------------------------------------------------
%load('da14523withdates.mat')
load('datalogdiff84.mat')
%%

%  from {'01/01/1952'} to {'01/01/2018'}
%startdate = datenum('04-1948','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy');
%enddate = datenum('01-2018','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy'); 
%dth = linspace(startdate,enddate,280);

startdate = datenum('Q2-1984','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy');
enddate = datenum('Q4-2021','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy'); 
dt = linspace(startdate,enddate,151);
%[242, 109, 116]/255 PINK 
%[0, 158, 169]/255 BLEU
%[255, 94, 53]/255 ORANGE % 2 
% [124, 188, 37]/255 GREEN


figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

subplot(3,4,1)
plot(dt,gdpobs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight; % THIS HELPS TO REMOVE THE SPACE BEFORE AND AFTER THE LINE
shadeyears(start,finish);
hold on;
%recessionplot;
t = ' real GDP per capita ';
title(t,'interpreter','latex')
%title('Real GDP per Capita')

subplot(3,4,2)
plot(dt,consumptionobs, 'LineWidth', 2, 'Color', [0, 158, 169]/255 );
%h=plot(Dates(201:end),CONSUMPLAST4(201:end), 'LineWidth', 1.5, 'Color', [124, 188, 37]/255);
datetick('x')
%grid on
axis tight;
shadeyears(start,finish);
%recessionplot;
t = ' real consumption per capita ';
title(t,'interpreter','latex')
%title('Real Consumption per Capita')

subplot(3,4,3)
plot(dt,investobs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight;
shadeyears(start,finish);
%recessionplot;
t = ' real investment per capita';
title(t,'interpreter','latex')
%title('Real Investment per Capita')


subplot(3,4,4)
plot(dt,CIloan_obs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight;
shadeyears(start,finish);
%recessionplot;
t = ' real business debt capita';
title(t,'interpreter','latex')
%title('Real Business Debt Capita')



subplot(3,4,5)
plot(dt,Hloan_obs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight;
shadeyears(start,finish);
%recessionplot;
t = ' real houshold debt per capita';
title(t,'interpreter','latex')
%title('Real Houshold Debt per Capita')

subplot(3,4,6)
plot(dt,govobs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight;
shadeyears(start,finish);
%recessionplot;
t = ' real government spending per capita';
title(t,'interpreter','latex')
%title('Real Government Spending per Capita')



subplot(3,4,7)
plot(dt,hours_obs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight;
shadeyears(start,finish);
%recessionplot;
t = ' hours worked per capita';
title(t,'interpreter','latex')
%title('Hours Worked per Capita')

subplot(3,4,8)
plot(dt,CIchargoff_obs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight;
shadeyears(start,finish);
%recessionplot;
t = ' CI loan charge-off per capita';
title(t,'interpreter','latex')
%title('CI Loan charge-off per Capita')

subplot(3,4,9)
plot(dt,Hcharfoff_obs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight;
%recessionplot;
shadeyears(start,finish);
t = ' household loan charge-off per capita';
title(t,'interpreter','latex')
%title('Household Loan charge-off per Capita')


subplot(3,4,10)
plot(dt,default_h_obs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight;
%recessionplot;
shadeyears(start,finish);
t = ' delinquency rate - household loan';
title(t,'interpreter','latex')
%title('Probabilty of Default Household Loan')

subplot(3,4,11)
plot(dt,default_e_obs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
datetick('x')
%grid on
axis tight;
shadeyears(start,finish);
%recessionplot;
t = ' delinquency rate - CI loan';
title(t,'interpreter','latex')
%title('Probabilty of Default CI loan')






%subplot(3,4,12)
%plot(dt,Inflat_obs, 'LineWidth', 2, 'Color', [0, 158, 169]/255);
%datetick('x')
%axis tight;
%shadeyears(start,finish);
%t = ' Inflation rate ';
%title(t,'interpreter','latex')

% data used 
export_fig testdatausedbubble.jpg  -m2.5 -painters

%%  here 8888888888



%load('baselinezero.mat')

%load('flexpriceszero.mat')
%load('flexwageszero.mat')
%load('nohabitzero.mat')

%%





%%



%%
% plot innovations 

%%


%[140, 3, 53]/255 
%[217, 210, 191]/255 
%[166, 119, 78]/255 
%[140, 131, 123]/255 
%[38, 1, 1]/255 


%[242, 5, 25]/255 
%[191, 4, 38]/255 
%[191, 21, 66]/255 
%[20, 8, 64]/255 
%[217, 165, 102]/255 


%[76, 23, 191]/255 
%[51, 34, 89]/255 
%[179, 224, 242]/255 
%[242, 197, 61]/255 
%[217, 82, 4]/255 

%[242, 185, 12]/255 
%[217, 112, 20]/255 
%[242, 73, 12]/255 
%[217, 102, 91]/255 
%[140, 76, 70]/255 


% e11 collateral shock 
% world of sticky prices sticy wages and habit in consumption
%irf_0_basline_model.omegabare_e11
%irf_0_basline_model.NE_e11
%irf_0_basline_model.AME_e11
%irf_0_basline_model.Y_e11
%irf_0_basline_model.C_e11
%irf_0_basline_model.K_e11
%irf_0_basline_model.I_e11

% against  (only flexible prices)
%irf_0_flex_prices.omegabare_e11
%irf_0_flex_prices.NE_e11
%irf_0_flex_prices.AME_e11
%irf_0_flex_prices.Y_e11
%irf_0_flex_prices.C_e11
%irf_0_flex_prices.K_e11
%irf_0_flex_prices.I_e11



% against (only NO HABIT IN consumption)
%irf_0_nohabit_consumption
%irf_0_nohabit_consumption.omegabare_e11
%irf_0_nohabit_consumption.NE_e11
%irf_0_nohabit_consumption.AME_e11
%irf_0_nohabit_consumption.Y_e11
%irf_0_nohabit_consumption.C_e11
%irf_0_nohabit_consumption.K_e11
%irf_0_nohabit_consumption.I_e11




%irf_0_flex_wages.omegabare_e11
%irf_0_flex_wages.NE_e11
%irf_0_flex_wages.AME_e11
%irf_0_flex_wages.Y_e11
%irf_0_flex_wages.C_e11
%irf_0_flex_wages.K_e11
%irf_0_flex_wages.I_e11



%irf_0_nohabit_consumption.omegabare_e11
%irf_0_nohabit_consumption.NE_e1
%irf_0_nohabit_consumption.AME_e1
%irf_0_nohabit_consumption.Y_e1%
%irf_0_nohabit_consumption.C_e1
%irf_0_nohabit_consumption.K_e1
%irf_0_nohabit_consumption.I_e1




%%
% irf_0_basline_model
% irf_0_flex_wages
%irf_0_flex_prices
% irf_0_nohabit_consumption
% irf_0_flex_priceswagesandhabi
% irf_0_flex_wages_stickyprices_nohabit
% irf_0_flex_prices_stickywages_nohabit
% irf_0_flex_prices_flexwages_nohabit



%%

% I will plot 




%oo_.PosteriorIRF.dsge.HPDsup.gdpobs_e11;
%oo_.PosteriorIRF.dsge.HPDinf.gdpobs_e11;
%oo_.PosteriorIRF.dsge.Mean.gdpobs_e11;

%oo_.PosteriorIRF.dsge.HPDsup.externobs_e11;
%oo_.PosteriorIRF.dsge.HPDinf.externobs_e11;
%oo_.PosteriorIRF.dsge.Mean.externobs_e11;

%oo_.PosteriorIRF.dsge.HPDsup.netwobs_e11;
%oo_.PosteriorIRF.dsge.HPDinf.netwobs_e11;
%oo_.PosteriorIRF.dsge.Mean.netwobs_e11;

%oo_.PosteriorIRF.dsge.HPDsup.investobs_e11;
%oo_.PosteriorIRF.dsge.HPDinf.investobs_e11;
%oo_.PosteriorIRF.dsge.Mean.investobs_e11;






%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    


%%


%%


  
%%
load('irf_plot_without_policy.mat')

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
%%

load('irf_plot_with_policy.mat')

%% IRF  output *1.0e12


%t = 1:1:10;
t=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

subplot(1,2,1) % Output
l2=plot(1:t,Y_v_e7GG(1:10)*1.0e+13,'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,Y_v_e7(1:10)*1.0e+17,'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight; 
t = ' Collateral requiremnt shock $\phi^{h}$ ';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.12 0.05])
ylabel('% points');

t=10;
subplot(1,2,2) % Output
l2=plot(1:t,Y_v_e6GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,Y_v_e6(1:10)*1.0e+03,'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
t = 'Collateral requiremnt shock $ \phi^{e}$';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points');

export_fig outirfcollshock.jpg  -m2.5 -painters


%% IRF labor


%t = 1:1:10;
t=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

 
%('Name','Response to a collateral shocks')
subplot(1,2,1) % Output
l2=plot(1:t,L_v_e7GG(1:10)*1.0e+13,'LineWidth',2.5,'Color', [242, 109, 116]/255);
hold on;
l3=plot(1:t,L_v_e7(1:10)*1.0e+16,'LineWidth',2.5,'Color', [0, 158, 169]/255);
hold on;
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
t = ' Collateral requiremnt shock $\phi^{h}$ ';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.2 0.05])
ylabel('% points');

t=10;

subplot(1,2,2) % Output
l2=plot(1:t,L_v_e6GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255);
hold on;
l3=plot(1:t,L_v_e6(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255);
hold on
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
t = ' Collateral requiremnt shock $\phi^{e}$ ';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points');

export_fig labirfcollshock.jpg  -m2.5 -painters


%% IRF consumption


t = 10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 

%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

%('Name','Response to a collateral shocks')
subplot(1,2,1) % Output
l2=plot(1:t,c_v_e7GG(1:10)*1.0e+12,'LineWidth',2.5,'Color', [242, 109, 116]/255);
hold on;
l3=plot(1:t,c_v_e7(1:10)*1.0e+15,'LineWidth', 2.5,'Color', [0, 158, 169]/255);
hold on;
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight; 
t = ' Collateral requiremnt shock $\phi^{h}$ ';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.05 0.8])
ylabel('% points');

t = 10;

subplot(1,2,2) % Output
l2=plot(1:t,c_v_e6GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255);
hold on;
l3=plot(1:t,c_v_e6(1:10),'LineWidth', 2.5,'Color', [0, 158, 169]/255);
hold on;
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight; 
t = ' Collateral requiremnt shock $\phi^{e}$ ';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points');

export_fig consirfcollshock.jpg  -m2.5 -painters


%% kappae_v_e4GG kappae_v_e4GG ****************** This exact (add here)



t =10;
%figure('color','w')
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
%set(0,'defaultfigurecolor',[1 1 1]) 
figure('Position',[1 1 800-100 600-100]);
%figure('Position',[100 100 1000 1000],'PaperPositionMode','Auto','DefaultAxesFontSize',13);

%set(gca,'TickLabelInterpreter','latex')
%set(gca,'defaulttextinterpreter','latex')
%set(groot,'defaultAxesTickLabelInterpreter','latex');  
%set(groot,'defaultLegendInterpreter','latex');

% y_IRF_both_nofric
%subplot(1,2,1)
%subplot(1,2,1) % Output
%l2=plot(1:t,kappae_v_e4GG(1:10)*1.0e+15,'LineWidth',2.5,'Color', [242, 109, 116]/255);
hold on;
l3=plot(1:t,kappae_v_e4(1:10),'LineWidth', 3,'Color', '#0F95D7');
axis tight; 
hold on
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); 
hold on
%legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',22,'Location','best')
tg = '(a) Response of $\mathcal{\phi}^{e}$ ';
title(tg,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.4 0.01])

export_fig ltv_irfdefshock1.jpg  -m2.5 -painters


t =10;
%figure('color','w')
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
%set(0,'defaultfigurecolor',[1 1 1]) 
%figure('Position',[100 100 1000 1000],'PaperPositionMode','Auto','DefaultAxesFontSize',13);
figure('Position',[1 1 800-100 600-100]);


%t =10;
%figure('color','w')
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
%set(0,'defaultfigurecolor',[1 1 1]) 

%subplot(1,2,2)

%subplot(1,2,2) % Output
%l2=plot(1:t,kappah_v_e5GG(1:10)*1.0e+13 ,'LineWidth',2.5,'Color', [242, 109, 116]/255);
hold on;
l3=plot(1:t,kappah_v_e5(1:10),'LineWidth', 3,'Color', '#0F95D7');
hold on
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); 
hold on
%legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight; 
tg = '(b) Response of $\mathcal{\phi}^{h}$ ';
title(tg,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.4 0.01])


export_fig ltv_irfdefshock.jpg  -m2.5 -painters
%% experiemnt crises




%t = 1:1:10;
t=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


subplot(1,2,1) % Output
l2=plot(1:t,Y_v_e5GG(1:10)*1.0e+13,'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,Y_v_e5(1:10)*1.0e+13,'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',22,'Location','best')
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
l3=plot(1:t,Y_v_e4(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points');





%%

%t = 1:1:10;
t=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 

%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

subplot(1,2,1) % Output
l2=plot(1:t,c_v_e5GG(1:10)*1.0e+12,'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,c_v_e5(1:10)*1.0e+12,'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.12 0.05])
ylabel('% points');


subplot(1,2,2) % Output
l2=plot(1:t,c_v_e4GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,c_v_e4(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylabel('% points');



%%

%t = 1:1:10;
t=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

subplot(1,2,1) % Output
l2=plot(1:t,L_v_e5GG(1:10)*1.0e+13,'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,L_v_e5(1:10)*1.0e+13,'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.12 0.05])
ylabel('% points');


subplot(1,2,2) % Output
l2=plot(1:t,L_v_e4GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,L_v_e4(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',22,'Location','best')
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
%figure('Position',[100 100 1000 1000],'PaperPositionMode','Auto','DefaultAxesFontSize',13);
%figure('Units','centimeters','Position',[26.5642 14.2081 22.8167 8.1125])
figure('Position',[1 1 800-100 600-100]);

%figure('color','w') 
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
%set(0,'defaultfigurecolor',[1 1 1]) 


%subplot(1,2,1) % Output
l2=plot(1:t,Y_v_e19GG(1:10),'LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,Y_v_e19(1:10),'LineWidth',3,'Color', '#0F5C8C')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255);
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',20,'Location','best')
ylabel('% points','Interpreter','latex');
hold on
axis tight; 
tg = '(a) output $y$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.09 0.005])

export_fig OuLab_irfMPshock1.jpg  -m2.5 -painters


%t = 1:1:10;
t=10;
%figure('color','w')
%figure('Position',[100 100 1000 1000],'PaperPositionMode','Auto','DefaultAxesFontSize',13);
figure('Position',[1 1 800-100 600-100]);

%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
%set(0,'defaultfigurecolor',[1 1 1]) 
%set(gca,'TickLabelInterpreter','latex')
%set(gca,'defaulttextinterpreter','latex')
%set(groot,'defaultAxesTickLabelInterpreter','latex');  
%set(groot,'defaultLegendInterpreter','latex');

l2=plot(1:t,L_v_e19GG(1:10),'LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,L_v_e19(1:10),'LineWidth',3,'Color', '#0F5C8C')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',20,'Location','best')
axis tight; 
tg = '(b) labor $l$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.09 0.005])

ylabel('% points','Interpreter','latex');


export_fig OuLab_irfMPshock.jpg  -m2.5 -painters

%% *********

%figure('color','w')
figure('Position',[1 1 800-100 600-100]);

%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
%set(0,'defaultfigurecolor',[1 1 1]) 
%set(gca,'TickLabelInterpreter','latex')
%set(gca,'defaulttextinterpreter','latex')
%set(groot,'defaultAxesTickLabelInterpreter','latex');  
%set(groot,'defaultLegendInterpreter','latex');

l2=plot(1:t,c_v_e19GG(1:10),'LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,c_v_e19(1:10),'LineWidth',3,'Color', '#0F5C8C')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255);
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',20,'Location','best')
axis tight; 
tg = ' consumption $c$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 30;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.05 0.45])
ylabel('% points','Interpreter','latex');

export_fig cons_irfMPshock.jpg  -m2.5 -painters

%%



%t = 1:1:10;
t=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


subplot(1,2,1) % Output
l2=plot(1:t,d_h_v_e19GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,d_h_v_e19(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight;  
tg = ' housholds debt $d^{h}$ ';
title(tg,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.15 0.05])
ylabel('% points');


subplot(1,2,2) % Output
l2=plot(1:t,m_v_e19GG(1:10),'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:t,m_v_e19(1:10),'LineWidth',2.5,'Color', [0, 158, 169]/255)
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255); 
legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',22,'Location','best')
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



%t = 1:1:10;
t=10;
figure('Position',[1 1 800-100 600-100]);

%figure('color','w')
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
%set(0,'defaultfigurecolor',[1 1 1]) 
%set(gca,'TickLabelInterpreter','latex')
%set(gca,'defaulttextinterpreter','latex')
%set(groot,'defaultAxesTickLabelInterpreter','latex');  
%set(groot,'defaultLegendInterpreter','latex');

%subplot(1,2,1) % Output
l2=plot(1:t,Y_v_e6GG(1:10),'LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,L_v_e6GG(1:10),'--','LineWidth',3,'Color', '#0F5C8C');
%l4=plot(1:t,m_v_e6GG(1:10)*1.0e+11,'LineWidth',2.5,'Color', [0, 158, 169]/255)
%hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255);
legend([l2 l3],{'Output','Labor'},'Interpreter','latex','FontSize',20,'Location','best')
axis tight; 
t = '(a) shock to $\phi^{e}$ ';
title(t,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.02 0.09])
ylabel('% points','Interpreter','latex');


export_fig COEXB_irfCollshock.jpg  -m2.5 -painters


%% ****************   This exact (add here)

%t = 1:1:10;
t=10;
figure('Position',[1 1 800-100 600-100]);

%figure('color','w')
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
%set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
%set(gca,'TickLabelInterpreter','latex')
%set(gca,'defaulttextinterpreter','latex')
%set(groot,'defaultAxesTickLabelInterpreter','latex');  
%set(groot,'defaultLegendInterpreter','latex');

%subplot(1,2,1) % Output
l2=plot(1:t,Y_v_e7GG(1:10)*1.0e+13,'LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,L_v_e7GG(1:10)*1.0e+13,'--','LineWidth',3,'Color', '#0F5C8C');
%l4=plot(1:t,d_h_v_e7GG(1:10)*1.0e+12,'LineWidth',2.5,'Color', [0, 158, 169]/255)
%hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255);
legend([l2 l3],{'Output','Labor'},'Interpreter','latex','FontSize',20,'Location','best')
axis tight; 
t = '(b) shock to $\phi^{h}$ ';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.2 0.9])
ylabel('% points');


export_fig COEXH_irfCollshock.jpg  -m2.5 -painters
%% 
%omegae_v_e19 omegae_v_e6 omegae_v_e4...
%omegah_v_e19 omegah_v_e7 omegah_v_e5




%t = 1:1:10;
tt=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');


%subplot(1,2,1) % Output
l2=plot(1:tt,omegae_v_e6GG(1:10)*1.0e+16,'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:tt,omegae_v_e6(1:10)*1.0e+16,'LineWidth',2.5,'Color', [0, 158, 169]/255)
%hold on 
plot(1:tt,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3],{'No collateral policy: $\phi_{t}^{e} = F(\phi_{t-1}^{e})$','Benchmark: $\phi_{t}^{e} = F(\phi_{t-1}^{e}, \mathcal{X}_{t-1}^{e} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight; 
t = ' delinquency rate $\mathcal{X}^{e}$ ';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.002 0.027])
ylabel('% points');



export_fig omegaetodelinq_irfshock.jpg  -m2.5 -painters

%%


%t = 1:1:10;
tt=10;
figure('color','w')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(gca,'TickLabelInterpreter','latex')
set(gca,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');



%subplot(1,2,1) % Output
l2=plot(1:tt,omegah_v_e7GG(1:10)*1.0e+16,'LineWidth',2.5,'Color', [242, 109, 116]/255)
hold on;
l3=plot(1:tt,omegah_v_e7(1:10)*1.0e+19,'LineWidth',2.5,'Color', [0, 158, 169]/255)
%hold on 
plot(1:tt,zeros(size(1:10)),'--' ,'LineWidth',1,'Color',[140, 76, 70]/255);
legend([l2 l3],{'No collateral policy: $\phi_{t}^{h} = F(\phi_{t-1}^{h})$','Benchmark: $\phi_{t}^{h} = F(\phi_{t-1}^{h}, \mathcal{X}_{t-1}^{h} )$'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight; 
t = ' delinquency rate $\mathcal{X}^{h}$ ';
title(t,'interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 20;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.002 0.027])
ylabel('% points');


export_fig omegahtodelinq_irfshock.jpg  -m2.5 -painters
%% MP on h








% Short run
varname={'Median'};
Q1_G = table([omegah_v_e19(1)*10^(17)],'VariableNames',varname);
Q2_G = table([omegah_v_e19(2)*10^(17)],'VariableNames',varname);
Q3_G = table([omegah_v_e19(3)*10^(17)],'VariableNames',varname);
Q4_G = table([omegah_v_e19(4)*10^(17)],'VariableNames',varname);

Table_1=table(Q1_G,Q2_G,Q3_G,Q4_G);

%long-run 
Q8_G = table([omegah_v_e19(8)*10^(17)],'VariableNames',varname);
Q12_G = table([omegah_v_e19(12)*10^(17)],'VariableNames',varname);
Q16_G = table([omegah_v_e19(16)*10^(17)],'VariableNames',varname);
Q20_G = table([omegah_v_e19(20)*10^(17)],'VariableNames',varname);

Table_2=table(Q8_G,Q12_G,Q16_G,Q20_G);

% Store the values in Tables.xlsx

writetable(Q1_G,'Tables_129.xlsx','Sheet','SR','Range','C3')
writetable(Q2_G,'Tables_129.xlsx','Sheet','SR','Range','F3')
writetable(Q3_G,'Tables_129.xlsx','Sheet','SR','Range','I3')
writetable(Q4_G,'Tables_129.xlsx','Sheet','SR','Range','L3')

writetable(Q8_G,'Tables_129.xlsx','Sheet','LR','Range','C3')
writetable(Q12_G,'Tables_129.xlsx','Sheet','LR','Range','F3')
writetable(Q16_G,'Tables_129.xlsx','Sheet','LR','Range','I3')
writetable(Q20_G,'Tables_129.xlsx','Sheet','LR','Range','L3')







%%


% Short run
varname={'Median'};
Q1_G = table([omegae_v_e19(1)*10^(17)],'VariableNames',varname);
Q2_G = table([omegae_v_e19(2)*10^(17)],'VariableNames',varname);
Q3_G = table([omegae_v_e19(3)*10^(17)],'VariableNames',varname);
Q4_G = table([omegae_v_e19(4)*10^(17)],'VariableNames',varname);

Table_1=table(Q1_G,Q2_G,Q3_G,Q4_G);

%long-run 
Q8_G = table([omegae_v_e19(8)*10^(17)],'VariableNames',varname);
Q12_G = table([omegae_v_e19(12)*10^(17)],'VariableNames',varname);
Q16_G = table([omegae_v_e19(16)*10^(17)],'VariableNames',varname);
Q20_G = table([omegae_v_e19(20)*10^(17)],'VariableNames',varname);

Table_2=table(Q8_G,Q12_G,Q16_G,Q20_G);

% Store the values in Tables.xlsx

writetable(Q1_G,'Tables_130.xlsx','Sheet','SR','Range','C3')
writetable(Q2_G,'Tables_130.xlsx','Sheet','SR','Range','F3')
writetable(Q3_G,'Tables_130.xlsx','Sheet','SR','Range','I3')
writetable(Q4_G,'Tables_130.xlsx','Sheet','SR','Range','L3')

writetable(Q8_G,'Tables_130.xlsx','Sheet','LR','Range','C3')
writetable(Q12_G,'Tables_130.xlsx','Sheet','LR','Range','F3')
writetable(Q16_G,'Tables_130.xlsx','Sheet','LR','Range','I3')
writetable(Q20_G,'Tables_130.xlsx','Sheet','LR','Range','L3')




%%

load('irf_plot_with_policy001') 
% c_v_e7 c_v_e6 

Y_v_e6WW = Y_v_e6 ;
Y_v_e7WW = Y_v_e7 ;
L_v_e6WW = L_v_e6 ;
L_v_e7WW = L_v_e7 ;
%m_v_e6 m_v_e7 d_h_v_e6 d_h_v_e7 
% 
% Y_v_e19 L_v_e19 c_v_e19 d_h_v_e19 m_v_e19 
% omegae_v_e19 omegae_v_e6 omegah_v_e19 omegah_v_e7;
% if default propbility is fixed 
Y_v_e19WW=Y_v_e19 ;
L_v_e19WW=L_v_e19 ;
c_v_e19WW=c_v_e19 ;
d_h_v_e19WW=d_h_v_e19 ; 
m_v_e19WW=m_v_e19 ;

load('irf_plot_with_policy.mat')








%t = 1:1:10;
t=10;

figure('Position',[1 1 800-100 600-100]);



%subplot(1,2,1) % Output
l2=plot(1:t,Y_v_e19(1:10),'LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,Y_v_e19WW(1:10),'LineWidth',3,'Color', '#0F5C8C')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255);
legend([l2 l3],{'Benchmark','With fixed delinquency rates  '},'Interpreter','latex','FontSize',22,'Location','best')
ylabel('% points','Interpreter','latex');
hold on
axis tight; 
tg = '(a) output $y$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.35 0.005])

export_fig OuLab_irfMPshock1Iffixed.jpg  -m2.5 -painters


%t = 1:1:10;
t=10;
%figure('color','w')
%figure('Position',[100 100 1000 1000],'PaperPositionMode','Auto','DefaultAxesFontSize',13);
figure('Position',[1 1 800-100 600-100]);

%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
%set(0,'defaultfigurecolor',[1 1 1]) 
%set(gca,'TickLabelInterpreter','latex')
%set(gca,'defaulttextinterpreter','latex')
%set(groot,'defaultAxesTickLabelInterpreter','latex');  
%set(groot,'defaultLegendInterpreter','latex');

l2=plot(1:t,L_v_e19(1:10),'LineWidth',3,'Color', '#0F95D7')
hold on 
l3=plot(1:t,L_v_e19WW(1:10),'LineWidth',3,'Color','#0F5C8C')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); 
legend([l2 l3],{'Benchmark','With fixed delinquency rate'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight; 
tg = '(b) labor $l$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
ylim([-0.35 0.005])

ylabel('% points','Interpreter','latex');


export_fig OuLab_irfMPshockIffixed.jpg  -m2.5 -painters



%%
load('irf_plot_with_policyendogenous') 

%%

Y_v_e6ENDO = Y_v_e6 ;
Y_v_e7ENDO = Y_v_e7 ;
L_v_e6ENDO = L_v_e6 ;
L_v_e7ENDO = L_v_e7 ;
%m_v_e6 m_v_e7 d_h_v_e6 d_h_v_e7 
% 
% Y_v_e19 L_v_e19 c_v_e19 d_h_v_e19 m_v_e19 
% omegae_v_e19 omegae_v_e6 omegah_v_e19 omegah_v_e7;
% if default propbility is fixed 
Y_v_e19ENDO=Y_v_e19 ;
L_v_e19ENDO=L_v_e19 ;
c_v_e19ENDO=c_v_e19 ;
d_h_v_e19ENDO=d_h_v_e19 ; 
m_v_e19ENDO=m_v_e19 ;

%%
load('irf_plot_with_policy.mat')

%%






%t = 1:1:10;
t=10;

figure('Position',[1 1 800-100 600-100]);



%subplot(1,2,1) % Output
l2=plot(1:t,Y_v_e19(1:10),'LineWidth',3,'Color', '#0F95D7')
hold on;
l3=plot(1:t,Y_v_e19ENDO(1:10),'LineWidth',3,'Color', '#0F5C8C')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255);
legend([l2 l3],{'Benchmark','With Endogenous delinquency rates  '},'Interpreter','latex','FontSize',22,'Location','best')
ylabel('% points','Interpreter','latex');
hold on
axis tight; 
tg = '(a) output $y$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.35 0.005])

export_fig OuLab_irfMPshock1IfENDO.jpg  -m2.5 -painters


%t = 1:1:10;
t=10;
%figure('color','w')
%figure('Position',[100 100 1000 1000],'PaperPositionMode','Auto','DefaultAxesFontSize',13);
figure('Position',[1 1 800-100 600-100]);

%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
%set(0,'defaultfigurecolor',[1 1 1]) 
%set(gca,'TickLabelInterpreter','latex')
%set(gca,'defaulttextinterpreter','latex')
%set(groot,'defaultAxesTickLabelInterpreter','latex');  
%set(groot,'defaultLegendInterpreter','latex');

l2=plot(1:t,L_v_e19(1:10),'LineWidth',3,'Color', '#0F95D7')
hold on 
l3=plot(1:t,L_v_e19ENDO(1:10)*10,'LineWidth',3,'Color','#0F5C8C')
hold on 
plot(1:t,zeros(size(1:10)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255); 
legend([l2 l3],{'Benchmark','With endogenous delinquency rate'},'Interpreter','latex','FontSize',22,'Location','best')
axis tight; 
tg = '(b) labor $l$ ';
title(tg,'Interpreter','latex')
ax = gca; % to enlarge the size of years and percentage on the x and y axis
ax.FontSize = 18;
ax.XGrid = 'off';
ax.YGrid = 'on';
%ylim([-0.35 0.005])

ylabel('% points','Interpreter','latex');


export_fig OuLab_irfMPshockIfENDO.jpg  -m2.5 -painters