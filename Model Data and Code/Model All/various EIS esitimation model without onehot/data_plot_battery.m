clc;clear;close all;
addpath("..\../code_add")
%% 100Hz模型
Fn = 100;
[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_no_onehot(100,1:51);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
YPred = predict(net,XTest);   % 预测第1个样本
figure,
set(gcf, 'Position',[0 0 600 600],'Color','White');
N = size(XTest,1);
color =  flipud(colorInterp_lan(4, 13));bias=0.02;
for i=1:450:8000
    plot( (YTest(i,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000+bias*i,-(YTest(i,N_EIS+1:N_EIS*2)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000-bias*i,'o','Color',color(( SOC_T.T_Test(i)-19 )/2,:),'LineWidth',1,'MarkerSize',12);hold on
    plot( (YPred(i,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000+bias*i,-(YPred(i,N_EIS+1:N_EIS*2)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000-bias*i,'-*','Color',color(( SOC_T.T_Test(i)-19 )/2,:),'LineWidth',1,'MarkerSize',12)
    %%axis equal
end
plo_all=[];
plo=plot(-1000,0,'ok','LineWidth',1,'MarkerSize',12);
plo_all=[plo_all plo];
plo=plot(-1000,0,'-*k','LineWidth',1,'MarkerSize',12);
plo_all=[plo_all plo];

leg=legend(plo_all,'Measured EIS','Reconstructed EIS');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %

xlabel("Z' (μΩ)");ylabel('-Z" (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
axis equal
axis([355 620 -180 85])
set(gca,'xtick',-1000:2000:5000,'ytick',-1000:2000:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP100'],'-dsvg','-r1200');
%% 50Hz模型
Fn = 50;
[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_no_onehot(100,11:41);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
YPred = predict(net,XTest);   % 预测第1个样本
figure,
set(gcf, 'Position',[0 0 600 600],'Color','White');
N = size(XTest,1);
color =  flipud(colorInterp_lan(4, 13));bias=0.02;
for i=1:450:8000
    plot( (YTest(i,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000+bias*i,-(YTest(i,N_EIS+1:N_EIS*2)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000-bias*i,'o','Color',color(( SOC_T.T_Test(i)-19 )/2,:),'LineWidth',1,'MarkerSize',12);hold on
    plot( (YPred(i,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000+bias*i,-(YPred(i,N_EIS+1:N_EIS*2)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000-bias*i,'-*','Color',color(( SOC_T.T_Test(i)-19 )/2,:),'LineWidth',1,'MarkerSize',12)
    %%axis equal
end
plo_all=[];
plo=plot(-1000,0,'ok','LineWidth',1,'MarkerSize',12);
plo_all=[plo_all plo];
plo=plot(-1000,0,'-*k','LineWidth',1,'MarkerSize',12);
plo_all=[plo_all plo];

leg=legend(plo_all,'Measured EIS','Reconstructed EIS');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %

xlabel("Z' (μΩ)");ylabel('-Z" (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
axis equal
axis([355 620 -180 85])
set(gca,'xtick',-1000:2000:5000,'ytick',-1000:2000:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP50'],'-dsvg','-r1200');
%% 模型RMSE
freq = 10.^[4:-0.1:-1];
freq1 = 10.^[3:-0.1:0];
F = [100 50 25 10 5];
index{1} = [1:51];index{2} = [11:41];

for i=1
    Fn = F(i);
    load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
    [XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_no_onehot(100,index{i} );
    EIS_real_pre = [];EIS_imag_pre = [];
    %%% RMSE
    YPred = predict(net,XTrain);
    EIS_exp_real = [(YTrain(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_exp_imag = [(YTrain(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    EIS_pre_real = [(YPred(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_pre_imag = [(YPred(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    rmse_realEIS_battery(i*3-2,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery(i*3-2,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    relative_rmse_Am_battery(i*3-2,:) = mape( abs(EIS_pre_real +1j *  EIS_pre_imag),abs(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    relative_rmse_Phase_battery(i*3-2,:) =  rmse(angle(EIS_pre_real +1j *  EIS_pre_imag),angle(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    EIS_real_pre = [EIS_real_pre;EIS_exp_real];EIS_imag_pre = [EIS_imag_pre;EIS_pre_imag];
    %%% RMSE
    YPred = predict(net,XVal);   % 预测验证集
    EIS_exp_real = [(YVal(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_exp_imag = [(YVal(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    EIS_pre_real = [(YPred(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_pre_imag = [(YPred(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    rmse_realEIS_battery(i*3-1,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery(i*3-1,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    relative_rmse_Am_battery(i*3-1,:) = mape( abs(EIS_pre_real +1j *  EIS_pre_imag),abs(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    relative_rmse_Phase_battery(i*3-1,:) =  rmse(angle(EIS_pre_real +1j *  EIS_pre_imag),angle(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    EIS_real_pre = [EIS_real_pre;EIS_exp_real];EIS_imag_pre = [EIS_imag_pre;EIS_pre_imag];
    %%% RMSE
    YPred = predict(net,XTest);   % 预测测试集
    EIS_exp_real = [(YTest(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_exp_imag = [(YTest(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    EIS_pre_real = [(YPred(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_pre_imag = [(YPred(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    rmse_realEIS_battery(i*3-0,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_realEIS_battery(i*3-0,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery(i*3-0,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    relative_rmse_Am_battery(i*3-0,:) = mape( abs(EIS_pre_real +1j *  EIS_pre_imag),abs(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    relative_rmse_Phase_battery(i*3-0,:) =  rmse(angle(EIS_pre_real +1j *  EIS_pre_imag),angle(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    EIS_real_pre = [EIS_real_pre;EIS_exp_real];EIS_imag_pre = [EIS_imag_pre;EIS_pre_imag];

end

for i=1
    Fn = F(i+1);
    load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
    [XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_no_onehot(100,index{i+1} );
    EIS_real_pre = [];EIS_imag_pre = [];
    %%% RMSE
    YPred = predict(net,XTrain);
    EIS_exp_real = [(YTrain(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_exp_imag = [(YTrain(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    EIS_pre_real = [(YPred(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_pre_imag = [(YPred(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    rmse_realEIS_battery1(i*3-2,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery1(i*3-2,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    relative_rmse_Am_battery1(i*3-2,:) = mape( abs(EIS_pre_real +1j *  EIS_pre_imag),abs(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    relative_rmse_Phase_battery1(i*3-2,:) =  rmse(angle(EIS_pre_real +1j *  EIS_pre_imag),angle(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    EIS_real_pre = [EIS_real_pre;EIS_exp_real];EIS_imag_pre = [EIS_imag_pre;EIS_pre_imag];
    %%% RMSE
    YPred = predict(net,XVal);   % 预测验证集
    EIS_exp_real = [(YVal(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_exp_imag = [(YVal(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    EIS_pre_real = [(YPred(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_pre_imag = [(YPred(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    rmse_realEIS_battery1(i*3-1,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery1(i*3-1,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    relative_rmse_Am_battery1(i*3-1,:) = mape( abs(EIS_pre_real +1j *  EIS_pre_imag),abs(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    relative_rmse_Phase_battery1(i*3-1,:) =  rmse(angle(EIS_pre_real +1j *  EIS_pre_imag),angle(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    EIS_real_pre = [EIS_real_pre;EIS_exp_real];EIS_imag_pre = [EIS_imag_pre;EIS_pre_imag];
    %%% RMSE
    YPred = predict(net,XTest);   % 预测测试集
    EIS_exp_real = [(YTest(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_exp_imag = [(YTest(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    EIS_pre_real = [(YPred(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;];
    EIS_pre_imag = [(YPred(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;];
    rmse_realEIS_battery1(i*3-0,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_realEIS_battery1(i*3-0,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery1(i*3-0,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    relative_rmse_Am_battery1(i*3-0,:) = mape( abs(EIS_pre_real +1j *  EIS_pre_imag),abs(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    relative_rmse_Phase_battery1(i*3-0,:) =  rmse(angle(EIS_pre_real +1j *  EIS_pre_imag),angle(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    EIS_real_pre = [EIS_real_pre;EIS_exp_real];EIS_imag_pre = [EIS_imag_pre;EIS_pre_imag];

end

%% 相对误差
figure,
color =  colorInterp_lan(6, 4);
set(gcf, 'Position',[0 0 480 480],'Color','White');
for i=1:1:1
    plot(freq,relative_rmse_Am_battery(3*i-0,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(1,:));hold on
    for j=1:1:3
        aveRMSE(i*2-1,j) =round(mean( relative_rmse_Am_battery(3*i-0,[1:1:11] + 10*(j-1)) ) ,2) ;
    end
    aveRMSE(i*2-1,6) =round(mean( relative_rmse_Am_battery(3*i-0,:)  ) ,2 );
end
for i=1:1:1
    plot(freq1,relative_rmse_Am_battery1(3*i-0,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(2,:));hold on
    for j=1:1:3
        aveRMSE(i*2-1,j) =round(mean( relative_rmse_Am_battery(3*i-0,[1:1:11] + 10*(j-1)) ) ,2) ;
    end
    aveRMSE(i*2-1,6) =round(mean( relative_rmse_Am_battery(3*i-0,:)  ) ,2 );
end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('10000–0.1 Hz','1000–1 Hz');
set(leg,'Location','Northeast','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[45,18];  %
xlabel("Frequency (Hz)");ylabel('MAPE of Magnitude \rm(%)');ytickformat('%.0f')
set (gca,'LineWidth',3,'position',[0.24,0.26,0.74,0.7]);
set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:1:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');

axis([10^-1.5 10^4.5 0.00 4.46])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-MAPE-AM'],'-dsvg','-r1200');

%% 针对100Hz phase
figure,
color =  colorInterp_lan(6, 4);
set(gcf, 'Position',[0 0 800 800],'Color','White');

for i=1:1:1
    plot(freq,relative_rmse_Phase_battery(3*i-0,:)/2/pi*360,'-o','LineWidth',1,'MarkerSize',12,'Color',color(1,:));hold on
    for j=1:1:3
        aveRMSE(i*2,j) =round(mean( relative_rmse_Phase_battery(3*i-0,[1:1:11] + 10*(j-1)) )/2/pi*360 ,2) ;
    end
    aveRMSE(i*2,6) =round(mean( relative_rmse_Phase_battery(3*i-0,:)  )/2/pi*360 ,2 );
end
for i=1:1:1
    plot(freq1,relative_rmse_Phase_battery1(3*i-0,:)/2/pi*360,'-o','LineWidth',1,'MarkerSize',12,'Color',color(2,:));hold on
    for j=1:1:3
        aveRMSE(i*2,j) =round(mean( relative_rmse_Phase_battery(3*i-0,[1:1:11] + 10*(j-1)) )/2/pi*360 ,2) ;
    end
    aveRMSE(i*2,6) =round(mean( relative_rmse_Phase_battery(3*i-0,:)  )/2/pi*360 ,2 );
end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('10000–0.1 Hz','1000–1 Hz');
set(leg,'Location','Northeast','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[45,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE of Phase Angle (°)');
set (gca,'LineWidth',3,'position',[0.24,0.26,0.74,0.7]);
set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:1:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

axis([10^-1.5 10^4.5 0.00 4.46])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-MAPE-Phase'],'-dsvg','-r1200');

%%
%% 针对100 phase
color =  colorInterp_lan(6, 5);
fig=figure,
set(gcf, 'Position',[0 0 480 480],'Color','White')
set(fig,'defaultAxesColorOrder',[color(3,:); color(2,:)]);
yyaxis left
plot(100000,1,'ow');hold on
plot(freq,relative_rmse_Am_battery(3*i-0,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(3,:));hold on
set(gca,'xlim',[10^-1.5 10^4.5],'ylim',[0.00 4.46]);

xlabel("Frequency (Hz)");ylabel('MAPE of Magnitude \rm(%)');
yyaxis right
plot(freq,relative_rmse_Phase_battery(3*i-0,:)/2/pi*360,'-o','LineWidth',1,'MarkerSize',12,'Color',color(2,:));hold on
set(gca,'xlim',[10^-1.5 10^4.5],'ylim',[0.00 4.46]);
ylabel('RMSE of Phase Angle (°)');
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('10000–0.1 Hz');
set(leg,'Location','Northeast','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[5,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE of Phase Angle (°)');
set (gca,'LineWidth',3,'position',[0.18,0.2,0.66,0.72]);
set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:1:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');

print(gcf, ['Figs/LFP-AM-Phase 100'],'-dsvg','-r1200');

%% 针对 50
color =  colorInterp_lan(6, 5);
fig=figure,
set(gcf, 'Position',[0 0 480 480],'Color','White');
set(fig,'defaultAxesColorOrder',[color(3,:); color(2,:)]);
yyaxis left
plot(100000,1,'ow');hold on
plot(freq1,relative_rmse_Am_battery1(3*i-0,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(3,:));hold on
set(gca,'xlim',[10^-0.5 10^3.5],'ylim',[0.00 4.46]);

xlabel("Frequency (Hz)");ylabel('MAPE of Magnitude \rm(%)');
yyaxis right
plot(freq1,relative_rmse_Phase_battery1(3*i-0,:)/2/pi*360,'-o','LineWidth',1,'MarkerSize',12,'Color',color(2,:));hold on
set(gca,'xlim',[10^-0.5 10^3.5],'ylim',[0.00 4.46]);
ylabel('RMSE of Phase Angle (°)');
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('1000–1 Hz');
set(leg,'Location','Northeast','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[5,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE of Phase Angle (°)');
set (gca,'LineWidth',3,'position',[0.18,0.2,0.66,0.72]);
set(gca,'xtick',10.^[-1:1:4],'ytick',-2000:1:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');

print(gcf, ['Figs/LFP-AM-Phase 50'],'-dsvg','-r1200');



function [XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_no_onehot(Fn,Number)
% 原始数据采样频率为5000Hz，这里已经将数据直接降采样至100Hz，按100Hz的采样率在时间轴上不重合的截取50段数据
% 即5000*2的数据被转化成不重复的200*50组数据 Nt与50组数据中选取数目有关，这里默认10
% 请设置所需要的采样率Fn，直接等间隔降采样
% Number 为电池编号 1：电池1 3：电池2
Nf = 100/Fn;
Nt = 10;
%%
voltage = [];current = [];realEIS = [];imagEIS = [];SOC = [];Temp =[];onehot=[];
for temp = 21:2:45
    load(['../../data_need\data_need_',num2str(temp),'_',num2str(1),'.mat']);
    index1 = 1:Nt:size(voltage0,1);
    index2 = 1:Nf:size(voltage0,2);
    voltage = [voltage;voltage0(index1,index2)];current = [current;current0(index1,index2)];
    realEIS = [realEIS;real0(index1,Number)];imagEIS = [imagEIS;imag0(index1,Number)];
    SOC = [SOC;SOC0(index1,:)];Temp =[Temp;temp0(index1,:)];
    onehot0 = zeros(size(voltage0(index1,index2)));
    onehot = [onehot;onehot0];
end

for temp = 21:2:45
    load(['../../data_need\data_need_',num2str(temp),'_',num2str(3),'.mat']);
    index1 = 1:Nt:size(voltage0,1);
    index2 = 1:Nf:size(voltage0,2);
    voltage = [voltage;voltage0(index1,index2)];current = [current;current0(index1,index2)];
    realEIS = [realEIS;real0(index1,Number)];imagEIS = [imagEIS;imag0(index1,Number)];
    SOC = [SOC;SOC0(index1,:)];Temp =[Temp;temp0(index1,:)];
    onehot0 = zeros(size(voltage0(index1,index2)));
    onehot = [onehot;onehot0];
end

%% ===================== 数据准备 =====================
% 假设已有变量：
% current: N×200
% voltage: N×200
% realEIS: N×a
% imagEIS: N×a

[N, T] = size(current);   % N个样本
N_EIS = size(realEIS,2);   % EIS 频点数

% ---- 1. 检查 NaN / Inf ----
if any(isnan(current(:))) || any(isnan(voltage(:))) || ...
   any(isnan(realEIS(:))) || any(isnan(imagEIS(:)))
    error('数据中包含 NaN，请先处理');
end

if any(isinf(current(:))) || any(isinf(voltage(:))) || ...
   any(isinf(realEIS(:))) || any(isinf(imagEIS(:)))
    error('数据中包含 Inf，请先处理');
end


%% ===================== 数据划分 6:2:2 =====================
% 打乱数据索引 增加随机种子保证训练可重复性
rng(20)
idx = randperm(N);

% 计算样本数
Ntrain = round(0.6 * N);
Nval   = round(0.2 * N);
Ntest  = N - Ntrain - Nval;

% 划分索引
idxTrain = idx(1:Ntrain);
idxVal   = idx(Ntrain+1:Ntrain+Nval);
idxTest  = idx(Ntrain+Nval+1:end);

% 只使用训练集统计量
currentMean = mean(current(idxTrain,:), 'all');
currentStd  = std(current(idxTrain,:), 0, 'all');
voltageMean = mean(voltage(idxTrain,:), 'all');
voltageStd  = std(voltage(idxTrain,:), 0, 'all');
realMean    = mean(realEIS(idxTrain,:), 'all');
realStd     = std(realEIS(idxTrain,:), 0, 'all');
imagMean    = mean(imagEIS(idxTrain,:), 'all');
imagStd     = std(imagEIS(idxTrain,:), 0, 'all');

% 防止 std 为 0
if currentStd == 0, currentStd = 1; end
if voltageStd == 0, voltageStd = 1; end
if realStd == 0, realStd = 1; end
if imagStd == 0, imagStd = 1; end

currentNorm = (current - currentMean) ./ currentStd;
voltageNorm = (voltage - voltageMean) ./ voltageStd;
realNorm    = (realEIS - realMean) ./ realStd;
imagNorm    = (imagEIS - imagMean) ./ imagStd; 

% 构造训练集
XTrain = cell(Ntrain,1);
for i = 1:Ntrain
    XTrain{i} = [currentNorm(idxTrain(i),:); voltageNorm(idxTrain(i),:)];
end
YTrain = [realNorm(idxTrain,:), imagNorm(idxTrain,:)];

% 构造验证集
XVal = cell(Nval,1);
for i = 1:Nval
    XVal{i} = [currentNorm(idxVal(i),:); voltageNorm(idxVal(i),:)];
end
YVal = [realNorm(idxVal,:), imagNorm(idxVal,:)];

% 构造测试集
XTest = cell(Ntest,1);
for i = 1:Ntest
    XTest{i} = [currentNorm(idxTest(i),:); voltageNorm(idxTest(i),:)];
end
YTest = [realNorm(idxTest,:), imagNorm(idxTest,:)];
% 仅保存训练集统计量
eis_mean_std = [realMean, realStd;
    imagMean, imagStd];

SOC_T.SOC_Train = SOC(idxTrain,:);
SOC_T.T_Train = Temp(idxTrain,:);
SOC_T.SOC_Val = SOC(idxVal,:);
SOC_T.T_Val = Temp(idxVal,:);
SOC_T.SOC_Test = SOC(idxTest,:);
SOC_T.T_Test = Temp(idxTest,:);
SOC_T.SOC = SOC([idxTrain,idxVal,idxTest],:);
SOC_T.T = Temp([idxTrain,idxVal,idxTest],:);
end
