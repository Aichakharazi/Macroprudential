%% plot IRF for (IRF under different rho)
load('y_IRF_both_nofric');
load('y_IRF_both_noprudential');


%% 18 y
Y_outputLow =y_IRF_both_nofric(18,:);  % rho kappa 0.25
Y_outputHigh =y_IRF_both_noprudential(18,:); % rho kappa 0.85

Ygdpobs_outputLow =y_IRF_both_nofric(47,:); % rho kappa 0.85
Ygdpobs_outputHigh =y_IRF_both_noprudential(47,:); % rho kappa 0.85


%%  24 qk
QK_outputLow =y_IRF_both_nofric(24,:);  % rho kappa 0.25
QK_outputHigh =y_IRF_both_noprudential(24,:); % rho kappa 0.85

%% 45 SS_v
SS_outputLow =y_IRF_both_nofric(45,:);  % rho kappa 0.25
SS_outputHigh =y_IRF_both_noprudential(45,:); % rho kappa 0.85


%%
startdate = datenum('Q2-1984','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy');
enddate = datenum('Q4-2021','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy'); 
dth = linspace(startdate,enddate,151);



figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,2,1)
plot(dth,Y_outputLow,'LineWidth',2.5,'Color', [242, 109, 116]/255); hold on;
plot(dth,Y_outputHigh,'LineWidth',2.5,'Color', [0, 158, 169]/255); hold on;
%ylabel('% deviation from ss','FontSize',20)
%xlabel('Time','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
recessionplot
hold on;
axis tight;  
datetick('x','yyyy','keepticks');
grid minor
legend({'Benchmark','No policy \phi=0'},'FontSize',20,'Location','best')
title('Output','FontSize',20)

%ylabel('GDP ','FontSize',15,'Color',[255, 0, 1]/255)
xlabel('Years');



subplot(2,2,2)
plot(dth,QK_outputLow,'LineWidth',3,'Color', [242, 109, 116]/255); hold on;
plot(dth,QK_outputHigh,'LineWidth',3,'Color', [0, 158, 169]/255); hold on;
%plot(dth,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
legend({'Benchmark','No policy \phi=0'},'FontSize',20,'Location','best')
ylabel('% deviation from ss','FontSize',20)
xlabel('Time','FontSize',20);
title('Tobin Q','FontSize',20)
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 



subplot(2,2,3)
plot(dth,SS_outputLow,'LineWidth',3,'Color', [242, 109, 116]/255); hold on;
plot(dth,SS_outputHigh,'LineWidth',3,'Color', [0, 158, 169]/255); hold on;
%plot(dth,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
legend({'Benchmark','No policy: \phi = 0 , \alpha = 0'},'FontSize',20,'Location','best')
ylabel('% deviation from ss','FontSize',20)
xlabel('Time','FontSize',20);
title('Bubble','FontSize',20)
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 


%%
enddate = datenum('Q4-2021','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy'); 
dth = linspace(startdate,enddate,151);



figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,2,1)
plot(dth,Ygdpobs_outputHigh,'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); hold on
plot(dth,Ygdpobs_outputLow,'LineWidth',2.5,'Color', [242, 109, 116]/255); hold on;
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
recessionplot
hold on;
axis tight;  
datetick('x','yyyy','keepticks');
grid minor
legend({'Benchmark','No policy \phi=0'},'FontSize',20,'Location','best')
title('Output','FontSize',20)

%ylabel('GDP ','FontSize',15,'Color',[255, 0, 1]/255)
xlabel('Years');



%%



figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

T =80;
plot(1:T,oo_.PosteriorIRF.dsge.Mean.gdpobs_e6,'LineWidth',3,'Color',  [0, 158, 169]/255); hold on;
plot(1:T,oo_.PosteriorIRF.dsge.HPDinf.gdpobs_e6,'--','LineWidth',3,'Color', [0, 158, 169]/255); hold on;
plot(1:T,oo_.PosteriorIRF.dsge.HPDsup.gdpobs_e6,'--','LineWidth',3,'Color', [0, 158, 169]/255); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Time','FontSize',20);
title('Output','FontSize',20)
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 



%%

% i take loan/ gdp ratio
ratioloangdp = BUSLOANSNSAAGGREGATE./GDPbillion;  




startdate = datenum('04-1998','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy');
enddate = datenum('01-2018','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy'); 
dth = linspace(startdate,enddate,80);


figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 
%set(gca,'LooseInset',get(gca,'TightInset'))
subplot(2,1,1)
[h1]=plot(dth,BUSLOANSNSAAGGREGATE);


%axis tight;  
recessionplot
hold on;
% Create a plot with 2 y axes using the plotyy function
[ax, h1, h2] = plotyy(dth,BUSLOANSNSAAGGREGATE,dth, USNP, 'plot');
axis tight;  
datetick('x','yyyy','keepticks');

%set(gca,'YTick',[])
% Add title and x axis label
xlabel('Years');
%axis tight;
%xlim(ax(2), [min max]);
%xlim(ax(2), [4 7]);
set(ax(1),'XLim',[datenum(1998,10,1) datenum(2018,1,1)]);  
set(ax(2),'Xlim',[datenum(1998,10,1) datenum(2018,1,1)]); 
set(ax(1),'ycolor',[0, 158, 169]/255)
set(ax(2),'ycolor',[242, 109, 116]/255)
%title('US');
%grid on
% Use the axis handles to set the labels of the y axes
set(get(ax(1), 'Ylabel'),'String','Billions of Dollars','FontSize',15,'Color',[0, 158, 169]/255 );
set(get(ax(2), 'Ylabel'),'String','Thousands of Dollars','FontSize',15,'Color',[242, 109, 116]/255); %U.S. Dollars per Barrell
% set color of lines
yt=get(gca,'YTick');
set(ax(1),'YTickLabel',sprintf('%.0f\n',yt))
set(ax(2),'YTickLabel',sprintf('%.0f\n',yt))


set(h1,'LineWidth',3,'Color',[0, 158, 169]/255)
set(h2,'LineWidth',2.5,'Color',[242, 109, 116]/255)
lgd = legend([h1;h2],'Total Business Loans','Total Nonperforming Loans','Location','best');

lgd.FontSize = 15;


subplot(2,1,2)
hh = plot(dth,ratioloangdp,'-k', 'LineWidth',3.5,'Color', [255, 0, 1]/255);
%plot(dth,BUSLOANSNSAAGGREGATE,'-k', 'LineWidth',3.5,'Color', [242, 109, 116]/255); hold on; % 1990
recessionplot
hold on;
axis tight;  
datetick('x','yyyy','keepticks');
grid minor
%set(hh,'Xlim',[datenum(1998,10,1) datenum(2018,1,1)]); 
ylabel('Loans/GDP Ratio','FontSize',15,'Color',[255, 0, 1]/255)
xlim([datenum(1998,10,1) datenum(2018,1,1)]);
xlabel('Years');

%xlim(datetime(2014,[7 8],[12 23]))

export_fig testcollateplot222 -m2.5 -painters


