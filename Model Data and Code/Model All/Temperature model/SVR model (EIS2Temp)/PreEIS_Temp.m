load ..\..\'various EIS esitimation model'\EIS_pre.mat
color = flipud(colorInterp_lan(6, 6));color(1,:)=[];
load std_mean_battry1.mat
SVR_mean1 = SVR_mean;SVR_std1 = SVR_std;
load std_mean_battry3.mat
SVR_mean3 = SVR_mean;SVR_std3 = SVR_std;
%% 电池1 1
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl1_battery1.mat
index0 = 1:11;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ) ];Y1 = T(1:1:32500,:);
X1 = (X1 - SVR_mean1(1,:) ) ./ SVR_std1(1,:) ;
[ypre_all ]=predict(SVRMdl1,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(1,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-1 10000–1000 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 1 1']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(1) = rmse(Y1,ypre_all);
%% 电池1 2
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl2_battery1.mat
index0 = 11:21;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ) ];Y1 = T(1:1:32500,:);
X1 = (X1 - SVR_mean1(2,:) ) ./ SVR_std1(2,:) ;
[ypre_all ]=predict(SVRMdl2,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(2,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-1 1000–100 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 1 2']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(2) = rmse(Y1,ypre_all);

%% 电池1 3
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl3_battery1.mat
index0 = 21:31;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ) ];Y1 = T(1:1:32500,:);
X1 = (X1 - SVR_mean1(3,:) ) ./ SVR_std1(3,:) ;
[ypre_all ]=predict(SVRMdl3,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(3,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-1 100–10 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 1 3']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(3) = rmse(Y1,ypre_all);

%% 电池1 4
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl4_battery1.mat
index0 = 31:41;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ) ];Y1 = T(1:1:32500,:);
X1 = (X1 - SVR_mean1(4,:) ) ./ SVR_std1(4,:) ;
[ypre_all ]=predict(SVRMdl4,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(4,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-1 10–1 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 1 4']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(4) = rmse(Y1,ypre_all);

%% 电池1 5
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl5_battery1.mat
index0 = 41:51;
X1 = [realdata(1:1:32500,index0 ),-imagdata(1:1:32500,index0 ) ];Y1 = T(1:1:32500,:);
X1 = (X1 - SVR_mean1(5,:) ) ./ SVR_std1(5,:) ;
[ypre_all ]=predict(SVRMdl5,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(5,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-1 1–0.1 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 1 5']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test1(5) = rmse(Y1,ypre_all);


%% 电池3 1
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl1_battery3.mat
index0 = 1:11;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ) ];Y1 = T(32501:1:end,:);
X1 = (X1 - SVR_mean3(1,:) ) ./ SVR_std3(1,:) ;
[ypre_all ]=predict(SVRMdl1,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(1,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-2 10000–1000 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 3 1']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(1) = rmse(Y1,ypre_all);
%% 电池1 2
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl2_battery3.mat
index0 = 11:21;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ) ];Y1 = T(32501:1:end,:);
X1 = (X1 - SVR_mean3(2,:) ) ./ SVR_std3(2,:) ;
[ypre_all ]=predict(SVRMdl2,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(2,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-2 1000–100 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 3 2']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(2) = rmse(Y1,ypre_all);

%% 电池1 3
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl3_battery3.mat
index0 = 21:31;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ) ];Y1 = T(32501:1:end,:);
X1 = (X1 - SVR_mean3(3,:) ) ./ SVR_std3(3,:) ;
[ypre_all ]=predict(SVRMdl3,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(3,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-2 100–10 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 3 3']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(3) = rmse(Y1,ypre_all);

%% 电池1 4
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl4_battery3.mat
index0 = 31:41;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ) ];Y1 = T(32501:1:end,:);
X1 = (X1 - SVR_mean3(4,:) ) ./ SVR_std3(4,:) ;
[ypre_all ]=predict(SVRMdl4,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(4,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-2 10–1 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 3 4']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(4) = rmse(Y1,ypre_all);

%% 电池1 5
Fn = 100;
realdata = EIS_real.(['freq',num2str(100),'Hz'])/1000000;imagdata = EIS_imag.(['freq',num2str(100),'Hz'])/1000000;
SOC = SOC0.(['freq',num2str(100),'Hz']);T = T0.(['freq',num2str(100),'Hz']);
load SVRMdl5_battery3.mat
index0 = 41:51;
X1 = [realdata(32501:1:end,index0 ),-imagdata(32501:1:end,index0 ) ];Y1 = T(32501:1:end,:);
X1 = (X1 - SVR_mean3(5,:) ) ./ SVR_std3(5,:) ;
[ypre_all ]=predict(SVRMdl5,X1);

figure,
plo_all = [];
set(gcf, 'Position',[0 0 800 800],'Color','White');

plo = plot(Y1,ypre_all,'o','Color',color(5,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([17 49 17 49])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,'Cell-2 1–0.1 Hz');

set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz 3 5']);
print(gcf, save_path,'-dsvg','-r1200');
RMSE_test3(5) = rmse(Y1,ypre_all);


save RMSE.mat RMSE_test1 RMSE_test3

%% RMSE 绘制
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
plot(-10,0,'sk','MarkerSize',12,'LineWidth',2);hold on
plot(-10,0,'^k','MarkerSize',12,'LineWidth',2);hold on
plot(-10,0,'ok','MarkerSize',12,'LineWidth',2);hold on
plot(-10,0,'vk','MarkerSize',12,'LineWidth',2);hold on
load RMSE.mat
for i = 1:1:5
    plot(i,RMSE_test1(i),'s','Color',color(i,:),'MarkerSize',16,'LineWidth',2);hold on
    plot(i,RMSE_test3(i),'^','Color',color(i,:),'MarkerSize',16,'LineWidth',2);
end
load ../SVR_EIS-SOC2Temp/RMSE_SOC.mat
for i = 1:1:5
    plot(i,RMSE_test1(i),'o','Color',color(i,:),'MarkerSize',16,'LineWidth',2);hold on
    plot(i,RMSE_test3(i),'v','Color',color(i,:),'MarkerSize',16,'LineWidth',2);
end
xticks(0.5:1:6)
xticklabels({"10^4",'10^3','10^2','10^1','10^{0}','10^{-1}'})
xlabel("Frequency Range (Hz)");ylabel('RMSE (\circC)');ytickformat('%.1f')
leg=legend('SVR model for cell-1','SVR model for cell-2','SVR model with SOC for cell-1','SVR model with SOC for cell-2');

set(leg,'Location','North','FontSize',24,'FontName','Times New Roman','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'ytick',-100:0.5:200,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
axis([0.2 5.8 0 2.9])
gca=boxoff(gca);clear gca
save_path=strcat(['SVR_figure','\','Pre EIS + SOC for Temp 100Hz RMSE']);
print(gcf, save_path,'-dsvg','-r1200');