load ..\..\data_mine.mat
color = flipud(colorInterp_lan(6, 6));color(1,:)=[];
%% 前1
index0 = 1:1300;
X = [real0(index0(:),1:11),imag0(index0(:),1:11)];
Y = soc(index0(:))';
%%
gprMdl1 = fitrgp(X,Y,'KernelFunction','ardsquaredexponential','Verbose',1, ...
    'Optimizer','lbfgs', ...z
    'Sigma',0.1,'InitialStepSize',1);
save gprMdl1_battery1.mat gprMdl1
%%
load gprMdl1_battery1.mat
ypre_all= resubPredict(gprMdl1);
[ypre_all,~,yint]=predict(gprMdl1,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y*100,ypre_all*100,'o','Color',color(1,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([-10;110]); mx=max([-10;110]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([-5 110 -5 110])
xlabel("Measured SOC (%)");ylabel('Predicted SOC (%)');
leg=legend(plo_all,['Cell-1 10000–1000 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'xtick',-100:25:1000,'ytick',-100:25:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass 1');
print(gcf, save_path,'-dsvg','-r1200');

sigmaL = gprMdl1.KernelInformation.KernelParameters(1:end-1); % Learned length scales
weights = exp(-sigmaL); % Predictor weights
weights1 = weights/sum(weights); % Normalized predictor weights

figure,
set(gcf, 'Position',[0 0 480 480],'Color','White');
freq = 10.^[4:-0.1:3];
plo=plot(freq,weights1(1:11),'ro','MarkerSize',16,'LineWidth',3);hold on
plo=plot(freq,weights1(12:22),'b^','MarkerSize',16,'LineWidth',3);
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
xlabel("Frequency (Hz)");ylabel('Weight');
xscale log
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'ytick',-100:0.01:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
axis([790 12600 0 0.065])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass w 1');
print(gcf, save_path,'-dsvg','-r1200');

RMSE_test1(1) = rmse(Y*100,ypre_all*100);

%% 前2
index0 = 1:1300;
X = [real0(index0(:),11:21),imag0(index0(:),11:21)];
Y = soc(index0(:))';
%%
gprMdl2 = fitrgp(X,Y,'KernelFunction','ardsquaredexponential','Verbose',1, ...
    'Optimizer','lbfgs', ...
    'Sigma',0.1,'InitialStepSize',1);
save gprMdl2_battery1.mat gprMdl2
%%
load gprMdl2_battery1.mat
ypre_all= resubPredict(gprMdl2);
[ypre_all,~,yint]=predict(gprMdl2,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y*100,ypre_all*100,'o','Color',color(2,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([-10;110]); mx=max([-10;110]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([-5 110 -5 110])
xlabel("Measured SOC (%)");ylabel('Predicted SOC (%)');
leg=legend(plo_all,['Cell-1 1000–100 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'xtick',-100:25:1000,'ytick',-100:25:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass 2');
print(gcf, save_path,'-dsvg','-r1200');

sigmaL = gprMdl2.KernelInformation.KernelParameters(1:end-1); % Learned length scales
weights = exp(-sigmaL); % Predictor weights
weights1 = weights/sum(weights); % Normalized predictor weights

figure,
set(gcf, 'Position',[0 0 480 480],'Color','White');
freq = 10.^[3:-0.1:2];
plo=plot(freq,weights1(1:11),'ro','MarkerSize',16,'LineWidth',3);hold on
plo=plot(freq,weights1(12:22),'b^','MarkerSize',16,'LineWidth',3);
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
xlabel("Frequency (Hz)");ylabel('Weight');
xscale log
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'ytick',-100:0.01:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
axis([79 1260 0 0.065])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass w 2');
print(gcf, save_path,'-dsvg','-r1200');

RMSE_test1(2) = rmse(Y*100,ypre_all*100);

%% 前3
index0 = 1:1300;
X = [real0(index0(:),21:31),imag0(index0(:),21:31)];
Y = soc(index0(:))';

%%
gprMdl3 = fitrgp(X,Y,'KernelFunction','ardsquaredexponential','Verbose',1, ...
    'Optimizer','lbfgs', ...
    'Sigma',0.1,'InitialStepSize',1);
save gprMdl3_battery1.mat gprMdl3
%%
load gprMdl3_battery1.mat
ypre_all= resubPredict(gprMdl3);
[ypre_all,~,yint]=predict(gprMdl3,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y*100,ypre_all*100,'o','Color',color(3,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([-10;110]); mx=max([-10;110]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([-5 110 -5 110])
xlabel("Measured SOC (%)");ylabel('Predicted SOC (%)');
leg=legend(plo_all,['Cell-1 100–10 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'xtick',-100:25:1000,'ytick',-100:25:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass 3');
print(gcf, save_path,'-dsvg','-r1200');

sigmaL = gprMdl3.KernelInformation.KernelParameters(1:end-1); % Learned length scales
weights = exp(-sigmaL); % Predictor weights
weights1 = weights/sum(weights); % Normalized predictor weights

figure,
set(gcf, 'Position',[0 0 480 480],'Color','White');
freq = 10.^[2:-0.1:1];
plo=plot(freq,weights1(1:11),'ro','MarkerSize',16,'LineWidth',3);hold on
plo=plot(freq,weights1(12:22),'b^','MarkerSize',16,'LineWidth',3);
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
xlabel("Frequency (Hz)");ylabel('Weight');
xscale log
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'ytick',-100:0.01:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
axis([7.9 126 0 0.065])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass w 3');
print(gcf, save_path,'-dsvg','-r1200');

RMSE_test1(3) = rmse(Y*100,ypre_all*100);

%% 前4
index0 = 1:1300;
X = [real0(index0(:),31:41),imag0(index0(:),31:41)];
Y = soc(index0(:))';

%%
gprMdl4 = fitrgp(X,Y,'KernelFunction','ardsquaredexponential','Verbose',1, ...
    'Optimizer','lbfgs', ...
    'Sigma',0.1,'InitialStepSize',1);
save gprMdl4_battery1.mat gprMdl4
%%
load gprMdl4_battery1.mat
ypre_all= resubPredict(gprMdl4);
[ypre_all,~,yint]=predict(gprMdl4,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y*100,ypre_all*100,'o','Color',color(4,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([-10;110]); mx=max([-10;110]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([-5 110 -5 110])
xlabel("Measured SOC (%)");ylabel('Predicted SOC (%)');
leg=legend(plo_all,['Cell-1 10–1 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'xtick',-100:25:1000,'ytick',-100:25:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass 4');
print(gcf, save_path,'-dsvg','-r1200');

sigmaL = gprMdl4.KernelInformation.KernelParameters(1:end-1); % Learned length scales
weights = exp(-sigmaL); % Predictor weights
weights1 = weights/sum(weights); % Normalized predictor weights

figure,
set(gcf, 'Position',[0 0 480 480],'Color','White');
freq = 10.^[1:-0.1:0];
plo=plot(freq,weights1(1:11),'ro','MarkerSize',16,'LineWidth',3);hold on
plo=plot(freq,weights1(12:22),'b^','MarkerSize',16,'LineWidth',3);
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
xlabel("Frequency (Hz)");ylabel('Weight');
xscale log
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'ytick',-100:0.01:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
axis([0.79 12.6 0 0.065])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass w 4');
print(gcf, save_path,'-dsvg','-r1200');

RMSE_test1(4) = rmse(Y*100,ypre_all*100);

%% 前5
index0 = 1:1300;
X = [real0(index0(:),41:51),imag0(index0(:),41:51)];
Y = soc(index0(:))';

%%
gprMdl5 = fitrgp(X,Y,'KernelFunction','ardsquaredexponential','Verbose',1, ...
    'Optimizer','lbfgs', ...
    'Sigma',0.1,'InitialStepSize',1);
save gprMdl5_battery1.mat gprMdl5
%%
load gprMdl5_battery1.mat
ypre_all= resubPredict(gprMdl5);
[ypre_all,~,yint]=predict(gprMdl5,X);
%%
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(Y*100,ypre_all*100,'o','Color',color(5,:),'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([-10;110]); mx=max([-10;110]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([-5 110 -5 110])
xlabel("Measured SOC (%)");ylabel('Predicted SOC (%)');
leg=legend(plo_all,['Cell-1 1–0.1 Hz' newline 'Training Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'xtick',-100:25:1000,'ytick',-100:25:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass 5');
print(gcf, save_path,'-dsvg','-r1200');

sigmaL = gprMdl5.KernelInformation.KernelParameters(1:end-1); % Learned length scales
weights = exp(-sigmaL); % Predictor weights
weights1 = weights/sum(weights); % Normalized predictor weights

figure,
set(gcf, 'Position',[0 0 480 480],'Color','White');
freq = 10.^[0:-0.1:-1];
plo=plot(freq,weights1(1:11),'ro','MarkerSize',16,'LineWidth',3);hold on
plo=plot(freq,weights1(12:22),'b^','MarkerSize',16,'LineWidth',3);
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
xlabel("Frequency (Hz)");ylabel('Weight');
xscale log
set (gca,'LineWidth',3,'position',[0.21,0.21,0.78,0.78]);
set(gca,'ytick',-100:0.01:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
axis([0.079 1.26 0 0.065])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 SOC Guass w 5');
print(gcf, save_path,'-dsvg','-r1200');

RMSE_test1(5) = rmse(Y*100,ypre_all*100);


save battery1_guass.mat