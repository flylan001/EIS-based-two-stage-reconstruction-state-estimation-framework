load ..\..\data_mine.mat
color = flipud(colorInterp_lan(6, 6));color(1,:)=[];

%% 前1
index0 = 1301:2600;
X = [real0(index0(:),1:11),imag0(index0(:),1:11)];
Y = T(index0(:));
[X,SVR_mean(1,:),SVR_std(1,:)] = zscore(X, 0, 1);
%%

SVRMdl1 = fitrsvm(X, Y,  'KernelFunction', 'RBF','OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus'), ...
    'Verbose', 0);

save SVRMdl1_battery3.mat SVRMdl1
%%
load SVRMdl1_battery3.mat
ypre_all= resubPredict(SVRMdl1);
ypre_all=predict(SVRMdl1,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y,ypre_all,'o','Color',color(1,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,['Cell-2 10000–1000 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.18,0.19,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 Temp SVR 1');
print(gcf, save_path,'-dsvg','-r1200');

RMSE_test3(1) = rmse(Y,ypre_all)

%% 前2
index0 = 1301:2600;
X = [real0(index0(:),11:21),imag0(index0(:),11:21)];
Y = T(index0(:));
[X,SVR_mean(2,:),SVR_std(2,:)] = zscore(X, 0, 1);

%%

SVRMdl2 = fitrsvm(X, Y,  'KernelFunction', 'RBF','OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus'), ...
    'Verbose', 0);
save SVRMdl2_battery3.mat SVRMdl2
%%
load SVRMdl2_battery3.mat
ypre_all= resubPredict(SVRMdl2);
ypre_all=predict(SVRMdl2,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y,ypre_all,'o','Color',color(2,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,['Cell-2 1000–100 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.18,0.19,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 Temp SVR 2');
print(gcf, save_path,'-dsvg','-r1200');


RMSE_test3(2) = rmse(Y,ypre_all);

%% 前3
index0 = 1301:2600;
X = [real0(index0(:),21:31),imag0(index0(:),21:31)];
Y = T(index0(:));
[X,SVR_mean(3,:),SVR_std(3,:)] = zscore(X, 0, 1);

%%

SVRMdl3 = fitrsvm(X, Y,  'KernelFunction', 'RBF','OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus'), ...
    'Verbose', 0);
save SVRMdl3_battery3.mat SVRMdl3
%%
load SVRMdl3_battery3.mat
ypre_all= resubPredict(SVRMdl3);
ypre_all=predict(SVRMdl3,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y,ypre_all,'o','Color',color(3,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,['Cell-2 100–10 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.18,0.19,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 Temp SVR 3');
print(gcf, save_path,'-dsvg','-r1200');


RMSE_test3(3) = rmse(Y,ypre_all);

%% 前4
index0 = 1301:2600;
X = [real0(index0(:),31:41),imag0(index0(:),31:41)];
Y = T(index0(:));
[X,SVR_mean(4,:),SVR_std(4,:)] = zscore(X, 0, 1);

%%

SVRMdl4 = fitrsvm(X, Y,  'KernelFunction', 'RBF','OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus'), ...
    'Verbose', 0);
save SVRMdl4_battery3.mat SVRMdl4
%%
load SVRMdl4_battery3.mat
ypre_all= resubPredict(SVRMdl4);
ypre_all=predict(SVRMdl4,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y,ypre_all,'o','Color',color(4,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,['Cell-2 10–1 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.18,0.19,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 Temp SVR 4');
print(gcf, save_path,'-dsvg','-r1200');


RMSE_test3(4) = rmse(Y,ypre_all);

%% 前5
index0 = 1301:2600;
X = [real0(index0(:),41:51),imag0(index0(:),41:51)];
Y = T(index0(:));
[X,SVR_mean(5,:),SVR_std(5,:)] = zscore(X, 0, 1);

%%

SVRMdl5 = fitrsvm(X, Y,  'KernelFunction', 'RBF','OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus'), ...
    'Verbose', 0);
save SVRMdl5_battery3.mat SVRMdl5
%%
load SVRMdl5_battery3.mat
ypre_all= resubPredict(SVRMdl5);
ypre_all=predict(SVRMdl5,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y,ypre_all,'o','Color',color(5,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([ypre_all;18]); mx=max([ypre_all;48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,['Cell-2 1–0.1 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.18,0.19,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 Temp SVR 5');
print(gcf, save_path,'-dsvg','-r1200');

RMSE_test3(5) = rmse(Y,ypre_all);


save battery3_SVR.mat

save std_mean_battry3.mat SVR_mean SVR_std