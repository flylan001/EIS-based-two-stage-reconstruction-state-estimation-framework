load ..\..\LSTM_UI2EIS\battery\EIS_pre.mat
color = flipud(colorInterp_lan(6, 6));color(1,:)=[];
NOISE =  0.1;
%% 电池1 1
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl1_battery1_SOC.mat
index0 = 1:11;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ),SOC(1:1:32500,:)];Y1 = T(1:1:32500,:);
[ypre_all,~,yint]=predict(gprMdl1,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(1,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 1 1']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(1) = rmse(Y1,ypre_all);
%% 电池1 2
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl2_battery1_SOC.mat
index0 = 11:21;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ),SOC(1:1:32500,:)];Y1 = T(1:1:32500,:);
[ypre_all,~,yint]=predict(gprMdl2,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(2,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 1 2']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(2) = rmse(Y1,ypre_all);

%% 电池1 3
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl3_battery1_SOC.mat
index0 = 21:31;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ),SOC(1:1:32500,:)];Y1 = T(1:1:32500,:);
[ypre_all,~,yint]=predict(gprMdl3,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(3,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 1 3']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(3) = rmse(Y1,ypre_all);

%% 电池1 4
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl4_battery1_SOC.mat
index0 = 31:41;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ),SOC(1:1:32500,:)];Y1 = T(1:1:32500,:);
[ypre_all,~,yint]=predict(gprMdl4,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(4,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 1 4']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(4) = rmse(Y1,ypre_all);

%% 电池1 5
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl5_battery1_SOC.mat
index0 = 41:51;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ),SOC(1:1:32500,:)];Y1 = T(1:1:32500,:);
[ypre_all,~,yint]=predict(gprMdl5,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(5,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 1 5']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(5) = rmse(Y1,ypre_all);


%% 电池3 1
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl1_battery3_SOC.mat
index0 = 1:11;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ),SOC(32501:1:end,:)];Y1 = T(32501:1:end,:);
[ypre_all,~,yint]=predict(gprMdl1,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(1,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 3 1']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(1) = rmse(Y1,ypre_all);
%% 电池3 2
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl2_battery3_SOC.mat
index0 = 11:21;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ),SOC(32501:1:end,:)];Y1 = T(32501:1:end,:);
[ypre_all,~,yint]=predict(gprMdl2,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(2,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 3 2']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(2) = rmse(Y1,ypre_all);

%% 电池3 3
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl3_battery3_SOC.mat
index0 = 21:31;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ),SOC(32501:1:end,:)];Y1 = T(32501:1:end,:);
[ypre_all,~,yint]=predict(gprMdl3,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(3,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 3 3']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(3) = rmse(Y1,ypre_all);

%% 电池3 4
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl4_battery3_SOC.mat
index0 = 31:41;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ),SOC(32501:1:end,:)];Y1 = T(32501:1:end,:);
[ypre_all,~,yint]=predict(gprMdl4,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(4,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 3 4']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(4) = rmse(Y1,ypre_all);

%% 电池3 5
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']) + NOISE*randn(65000,1);T = T0.(['freq',num2str(100),'Hz']);
load gprMdl5_battery3_SOC.mat
index0 = 41:51;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ),SOC(32501:1:end,:)];Y1 = T(32501:1:end,:);
[ypre_all,~,yint]=predict(gprMdl5,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(5,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Training Data');

set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat(['GPR_figure','\','Pre EIS + SOC for Temp 100Hz 3 5']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(5) = rmse(Y1,ypre_all);