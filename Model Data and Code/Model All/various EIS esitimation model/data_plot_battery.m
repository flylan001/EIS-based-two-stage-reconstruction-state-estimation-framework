clc;clear;close all;
addpath("..\../code_add")

%% 100Hz模型
Fn = 100;
[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,1);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP1-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');
eis_mean_std1 = eis_mean_std;

[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,3);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP3-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');
eis_mean_std2 = eis_mean_std;

save mean_std.mat eis_mean_std1 eis_mean_std2

%%
Fn = 50;
[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,1);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP1-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');

[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,3);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP3-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');

%%
Fn = 25;
[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,1);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP1-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');

[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,3);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP3-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');

%%
Fn = 10;
[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,1);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP1-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');

[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,3);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP3-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');

%%
Fn = 5;
[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,1);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP1-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');

[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,3);
load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T);gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP3-LSTM-EIS-',num2str(Fn),'Hz'],'-dsvg','-r1200');

%% 模型RMSE
freq = 10.^[4:-0.1:-1];
F = [100 50 25 10 5];
for i=1:1:5
    Fn = F(i);
    load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
    [XTrain1,YTrain1,XVal1,YVal1,XTest1,YTest1,N_EIS,eis_mean_std1,SOC_T1] = lstm_data_set_onehot(Fn,1);
    [XTrain3,YTrain3,XVal3,YVal3,XTest3,YTest3,N_EIS,eis_mean_std3,SOC_T3] = lstm_data_set_onehot(Fn,3);
    SOC_T.SOC_Train = [SOC_T1.SOC_Train;SOC_T3.SOC_Train];SOC_T.T_Train = [SOC_T1.T_Train;SOC_T3.T_Train];
    SOC_T.SOC_Val = [SOC_T1.SOC_Val;SOC_T3.SOC_Val];SOC_T.T_Val = [SOC_T1.T_Val;SOC_T3.T_Val];
    SOC_T.SOC_Test = [SOC_T1.SOC_Test;SOC_T3.SOC_Test];SOC_T.T_Test = [SOC_T1.T_Test;SOC_T3.T_Test];
    SOC_T.SOC = [SOC_T1.SOC;SOC_T3.SOC];SOC_T.T = [SOC_T1.T;SOC_T3.T];
    EIS_real_pre = [];EIS_imag_pre = [];
    %%% RMSE
    YPred1 = predict(net,XTrain1);YPred3 = predict(net,XTrain3);   % 预测训练集
    EIS_exp_real = [(YTrain1(:,1:N_EIS)*eis_mean_std1(1,2)+eis_mean_std1(1,1) )*1000000;(YTrain3(:,1:N_EIS)*eis_mean_std3(1,2)+eis_mean_std3(1,1) )*1000000];
    EIS_exp_imag = [(YTrain1(:,N_EIS+1:end)*eis_mean_std1(2,2)+eis_mean_std1(2,1) )*1000000;(YTrain3(:,N_EIS+1:end)*eis_mean_std3(2,2)+eis_mean_std3(2,1) )*1000000];
    EIS_pre_real = [(YPred1(:,1:N_EIS)*eis_mean_std1(1,2)+eis_mean_std1(1,1) )*1000000;(YPred3(:,1:N_EIS)*eis_mean_std3(1,2)+eis_mean_std3(1,1) )*1000000];
    EIS_pre_imag = [(YPred1(:,N_EIS+1:end)*eis_mean_std1(2,2)+eis_mean_std1(2,1) )*1000000;(YPred3(:,N_EIS+1:end)*eis_mean_std3(2,2)+eis_mean_std3(2,1) )*1000000];
    rmse_realEIS_battery(i*3-2,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery(i*3-2,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    relative_rmse_Am_battery(i*3-2,:) = mape( abs(EIS_pre_real +1j *  EIS_pre_imag),abs(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    relative_rmse_Phase_battery(i*3-2,:) =  rmse(angle(EIS_pre_real +1j *  EIS_pre_imag),angle(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    EIS_real_pre = [EIS_real_pre;EIS_exp_real];EIS_imag_pre = [EIS_imag_pre;EIS_pre_imag];
    %%% RMSE
    YPred1 = predict(net,XVal1);YPred3 = predict(net,XVal3);   % 预测验证集
    EIS_exp_real = [(YVal1(:,1:N_EIS)*eis_mean_std1(1,2)+eis_mean_std1(1,1) )*1000000;(YVal3(:,1:N_EIS)*eis_mean_std3(1,2)+eis_mean_std3(1,1) )*1000000];
    EIS_exp_imag = [(YVal1(:,N_EIS+1:end)*eis_mean_std1(2,2)+eis_mean_std1(2,1) )*1000000;(YVal3(:,N_EIS+1:end)*eis_mean_std3(2,2)+eis_mean_std3(2,1) )*1000000];
    EIS_pre_real = [(YPred1(:,1:N_EIS)*eis_mean_std1(1,2)+eis_mean_std1(1,1) )*1000000;(YPred3(:,1:N_EIS)*eis_mean_std3(1,2)+eis_mean_std3(1,1) )*1000000];
    EIS_pre_imag = [(YPred1(:,N_EIS+1:end)*eis_mean_std1(2,2)+eis_mean_std1(2,1) )*1000000;(YPred3(:,N_EIS+1:end)*eis_mean_std3(2,2)+eis_mean_std3(2,1) )*1000000];
    rmse_realEIS_battery(i*3-1,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery(i*3-1,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    relative_rmse_Am_battery(i*3-1,:) = mape( abs(EIS_pre_real +1j *  EIS_pre_imag),abs(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    relative_rmse_Phase_battery(i*3-1,:) =  rmse(angle(EIS_pre_real +1j *  EIS_pre_imag),angle(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    EIS_real_pre = [EIS_real_pre;EIS_exp_real];EIS_imag_pre = [EIS_imag_pre;EIS_pre_imag];
    %%% RMSE
    YPred1 = predict(net,XTest1);YPred3 = predict(net,XTest3);   % 预测测试集
    EIS_exp_real = [(YTest1(:,1:N_EIS)*eis_mean_std1(1,2)+eis_mean_std1(1,1) )*1000000;(YTest3(:,1:N_EIS)*eis_mean_std3(1,2)+eis_mean_std3(1,1) )*1000000];
    EIS_exp_imag = [(YTest1(:,N_EIS+1:end)*eis_mean_std1(2,2)+eis_mean_std1(2,1) )*1000000;(YTest3(:,N_EIS+1:end)*eis_mean_std3(2,2)+eis_mean_std3(2,1) )*1000000];
    EIS_pre_real = [(YPred1(:,1:N_EIS)*eis_mean_std1(1,2)+eis_mean_std1(1,1) )*1000000;(YPred3(:,1:N_EIS)*eis_mean_std3(1,2)+eis_mean_std3(1,1) )*1000000];
    EIS_pre_imag = [(YPred1(:,N_EIS+1:end)*eis_mean_std1(2,2)+eis_mean_std1(2,1) )*1000000;(YPred3(:,N_EIS+1:end)*eis_mean_std3(2,2)+eis_mean_std3(2,1) )*1000000];
    rmse_realEIS_battery(i*3-0,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery(i*3-0,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    relative_rmse_Am_battery(i*3-0,:) = mape( abs(EIS_pre_real +1j *  EIS_pre_imag),abs(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    relative_rmse_Phase_battery(i*3-0,:) =  rmse(angle(EIS_pre_real +1j *  EIS_pre_imag),angle(EIS_exp_real +1j *  EIS_exp_imag) ,1);
    EIS_real_pre = [EIS_real_pre;EIS_exp_real];EIS_imag_pre = [EIS_imag_pre;EIS_pre_imag];
    EIS_real.(['freq',num2str(Fn),'Hz']) = EIS_real_pre;EIS_imag.(['freq',num2str(Fn),'Hz']) = EIS_imag_pre;
    dataSOC_T.(['freq',num2str(Fn),'Hz']) = SOC_T;

    figure,
    color =  colorInterp_lan(6, 80);
    set(gcf, 'Position',[0 0 480 480],'Color','White');
    plot(100000,100000,'w');hold on
    plot(100000,100000,'ok','MarkerSize',12,'LineWidth',1);
    plot(100000,100000,'sk','MarkerSize',12,'LineWidth',1);
    for j =1:1:51
        plot(EIS_exp_real(:,j),EIS_pre_real(:,j),'o','Color',color(j,:),'MarkerSize',12,'LineWidth',1);hold on
        plot(EIS_exp_imag(:,j),EIS_pre_imag(:,j),'s','Color',color(j,:),'MarkerSize',12,'LineWidth',1);hold on
    end
    mn=-800; mx=4000;
    plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
    axis equal;
    axis([-600 3400 -600 3400])

    xlabel("Measured Z (μΩ)");ylabel('Reconstructed Z (μΩ)');
    leg=legend([num2str(Fn),' Hz'],"Z'",'-Z"');
    set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
    leg.ItemTokenSize=[10,18];  %
    set (gca,'LineWidth',3,'position',[0.16,0.16,0.8,0.8]);

    set(gca,'xtick',[],'ytick',[],'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
    gca=boxoff(gca);clear gca
    print(gcf, ['Figs/LFP-Real-Imag-Compare ',num2str(i)],'-dsvg','-r1200');
    [std(EIS_exp_real(:)-EIS_pre_real(:)),std(EIS_exp_imag(:)-EIS_pre_imag(:))]


    figure,
    color =  colorInterp_lan(6, 80);
    set(gcf, 'Position',[0 0 480 480],'Color','White');
    for j =1:1:51
        plot(freq(j)*ones(size(EIS_exp_real(:,j))),EIS_exp_real(:,j)-EIS_pre_real(:,j),'o','Color',color(j,:),'MarkerSize',12,'LineWidth',1);hold on
        % plot(freq(j)*ones(size(EIS_exp_real(:,j))),EIS_exp_imag(:,j)-EIS_pre_imag(:,j),'s','Color',color(j,:),'MarkerSize',12,'LineWidth',1);hold on
    end
    set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
    leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
    set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
    leg.ItemTokenSize=[60,18];  %
    xlabel("Frequency (Hz)");ylabel("RMSE of Z' (μΩ)");
    set (gca,'LineWidth',3,'position',[0.18,0.28,0.8,0.7]);

    set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:2:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
    axis([10^-1.5 10^4.5 0.00 9.9]);
    gca=boxoff(gca);clear gca;
    print(gcf, ['Figs/LFP-freq-error-',num2str(i)],'-dsvg','-r1200');

end
figure
set(gcf,'Position',[0 0 480 480],'Color','w');

colormap(color(1:51,:));
cb = colorbar;

cb.Ticks = linspace(0,1,10);
cb.TickLabels = 1:10;

pos = cb.Position;   % 读取当前位置
pos(3) = 0.1;       % ← 第3个元素 = 宽度（加大或减小）
cb.Position = pos;
cb.Box = 'off';
ax.XAxis.Visible = 'off';   % ← 删除横轴
% save EIS_pre.mat EIS_imag EIS_real dataSOC_T
mean(relative_rmse_Am_battery(3,:))
mean(relative_rmse_Phase_battery(3,:))/2/pi*360
mean(rmse_realEIS_battery(3,:))
mean(rmse_imagEIS_battery(3,:))

%%
figure
for i=1:1:1
    plot(EIS_exp_real(:),EIS_pre_real(:),'*');hold on
end
figure
for i=1:1:1
    plot(EIS_exp_imag(:),EIS_pre_imag(:),'*');hold on
end
%%
figure,
color =  colorInterp_lan(5, 8);
set(gcf, 'Position',[0 0 800 800],'Color','White');
for i=1:1:5

    plot(freq,rmse_realEIS_battery(3*i-2,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

set(gca,'xtick',10.^[-1:1:4],'ytick',-2000:2:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
axis([10^-1.5 10^4.5 0.00 11.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-RMSE-Real-Train'],'-dsvg','-r1200');

figure,
color =  colorInterp_lan(5, 8);
set(gcf, 'Position',[0 0 800 800],'Color','White');
for i=1:1:5

    plot(freq,rmse_realEIS_battery(3*i-0,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

set(gca,'xtick',10.^[-1:1:4],'ytick',-2000:2:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
axis([10^-1.5 10^4.5 0.00 11.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-RMSE-Real-Val'],'-dsvg','-r1200');

figure,
color =  colorInterp_lan(5, 8);
set(gcf, 'Position',[0 0 800 800],'Color','White');
for i=1:1:5

    plot(freq,rmse_realEIS_battery(3*i-0,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

set(gca,'xtick',10.^[-1:1:4],'ytick',-2000:2:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
axis([10^-1.5 10^4.5 0.00 11.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-RMSE-Real-Test'],'-dsvg','-r1200');

figure,
color =  colorInterp_lan(5, 8);
set(gcf, 'Position',[0 0 800 800],'Color','White');
for i=1:1:5
    plot(freq,rmse_imagEIS_battery(3*i-2,:),'-.s','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

set(gca,'xtick',10.^[-1:1:4],'ytick',-2000:2:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

axis([10^-1.5 10^4.5 0.00 11.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-RMSE-Imag-Train'],'-dsvg','-r1200');

figure,
color =  colorInterp_lan(5, 8);
set(gcf, 'Position',[0 0 800 800],'Color','White');
for i=1:1:5
    plot(freq,rmse_imagEIS_battery(3*i-1,:),'-.s','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

set(gca,'xtick',10.^[-1:1:4],'ytick',-2000:2:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

axis([10^-1.5 10^4.5 0.00 11.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-RMSE-Imag-Val'],'-dsvg','-r1200');

figure,
color =  colorInterp_lan(5, 8);
set(gcf, 'Position',[0 0 800 800],'Color','White');
for i=1:1:5
    plot(freq,rmse_imagEIS_battery(3*i-0,:),'-.s','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

set(gca,'xtick',10.^[-1:1:4],'ytick',-2000:2:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

axis([10^-1.5 10^4.5 0.00 11.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-RMSE-Imag-Test'],'-dsvg','-r1200');
%% 针对100Hz
figure,
color =  colorInterp_lan(4, 3);
set(gcf, 'Position',[0 0 800 800],'Color','White');
for j=2:-1:0
    plot(freq,rmse_realEIS_battery(3*1-j,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(j+1,:));hold on
    plot(freq,rmse_imagEIS_battery(3*1-j,:),'-.s','LineWidth',1,'MarkerSize',12,'Color',color(j+1,:));hold on
end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('Training RMSE of real part','Training RMSE of imaginary part', ...
    'Validation RMSE of real part','Validation RMSE of imaginary part', ...
    'Test RMSE of real part','Test RMSE of imaginary part');
set(leg,'Location','Northeast','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

set(gca,'xtick',10.^[-1:1:4],'ytick',-2000:2:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

axis([10^-1.5 10^4.5 0.00 9.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-RMSE-Imag-100Hz'],'-dsvg','-r1200');

%% 相对误差
figure,
color =  colorInterp_lan(6, 8);
set(gcf, 'Position',[0 0 480 480],'Color','White');
for i=1:1:5
    plot(freq,relative_rmse_Am_battery(3*i-0,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on
    for j=1:1:5
        aveRMSE(i*2-1,j) =round(mean( relative_rmse_Am_battery(3*i-0,[1:1:11] + 10*(j-1)) ) ,2) ;
    end
    aveRMSE(i*2-1,6) =round(mean( relative_rmse_Am_battery(3*i-0,:)  ) ,2 );
end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('MAPE of Magnitude \rm(%)');ytickformat('%.1f')
set (gca,'LineWidth',3,'position',[0.24,0.26,0.74,0.7]);
set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:0.4:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
mean(aveRMSE,1)
axis([10^-1.5 10^4.5 0.00 1.56])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-MAPE-AM'],'-dsvg','-r1200');
%% 实部
for i=1:1:5
    for j=1:1:5
        aveRMSE_real(i*2-1,j) =round(mean( rmse_realEIS_battery(3*i-0,[1:1:11] + 10*(j-1)) ) ,2) ;
    end
    aveRMSE_real(i*2-1,6) =round(mean( rmse_realEIS_battery(3*i-0,:)  ) ,2 );
end
% 虚部
for i=1:1:5
    for j=1:1:5
        aveRMSE_real(i*2,j) =round(mean( rmse_imagEIS_battery(3*i-0,[1:1:11] + 10*(j-1)) ) ,2) ;
    end
    aveRMSE_real(i*2,6) =round(mean( rmse_imagEIS_battery(3*i-0,:)  ) ,2 );
end
%% 针对100Hz phase
figure,
color =  colorInterp_lan(6, 8);
set(gcf, 'Position',[0 0 480 480],'Color','White');
for i=1:1:5
    plot(freq,relative_rmse_Phase_battery(3*i-0,:)/2/pi*360,'-o','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on
    for j=1:1:5
        aveRMSE(i*2,j) =round(mean( relative_rmse_Phase_battery(3*i-0,[1:1:11] + 10*(j-1)) )/2/pi*360 ,2) ;
    end
    aveRMSE(i*2,6) =round(mean( relative_rmse_Phase_battery(3*i-0,:)  )/2/pi*360 ,2 );
end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE of Phase Angle (°)');
set (gca,'LineWidth',3,'position',[0.24,0.26,0.74,0.7]);
set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:0.4:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');

axis([10^-1.5 10^4.5 0.00 1.56])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP-MAPE-Phase'],'-dsvg','-r1200');
SCPER_MAPE = aveRMSE;
aveRMSE_Z = aveRMSE_real;
save SCPER_Error.mat SCPER_MAPE aveRMSE_Z
%% 不同模型RMSE battery1
freq = 10.^[4:-0.1:-1];
F = [100 50 25 10 5];
for i=1:1:5
    Fn = F(i);
    load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
    [XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,1);
    YPred = predict(net,XTest);   % 预测第1个样本
    %%% RMSE
    
    EIS_exp_real = (YTest(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;
    EIS_exp_imag = (YTest(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;
    EIS_pre_real = (YPred(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;
    EIS_pre_imag = (YPred(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;
    rmse_realEIS_battery1(i,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery1(i,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
    ind_nan = find(~isnan(trainInfo.ValidationLoss));
    TrainingLoss(i,:) = trainInfo.TrainingLoss(ind_nan);
    TrainingRMSE(i,:) = trainInfo.TrainingRMSE(ind_nan);
    ValidationLoss(i,:) =  trainInfo.ValidationLoss(ind_nan);
    ValidationRMSE(i,:) = trainInfo.ValidationRMSE(ind_nan);
end

for i=1:1:5
    Fn = F(i);
    load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
    [XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,3);
    YPred = predict(net,XTest);   % 预测第1个样本
    %%% RMSE
    EIS_exp_real = (YTest(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;
    EIS_exp_imag = (YTest(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;
    EIS_pre_real = (YPred(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;
    EIS_pre_imag = (YPred(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;
    rmse_realEIS_battery3(i,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery3(i,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
end
%%

figure,
color =  colorInterp_lan(6, 8);
set(gcf, 'Position',[0 0 480 480],'Color','White');
for i=1:1:5

    plot(freq,rmse_realEIS_battery1(i,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel("RMSE of Z' (μΩ)");
set (gca,'LineWidth',3,'position',[0.18,0.28,0.8,0.7]);

set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:2:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
axis([10^-1.5 10^4.5 0.00 9.9]);
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP1-RMSE-Real-Hz'],'-dsvg','-r1200');

figure,
color =  colorInterp_lan(6, 8);
set(gcf, 'Position',[0 0 480 480],'Color','White');
for i=1:1:5
    plot(freq,rmse_imagEIS_battery1(i,:),'-s','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE of Z" (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.28,0.8,0.7]);
set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:2:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');

axis([10^-1.5 10^4.5 0.00 9.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP1-RMSE-Imag-Hz'],'-dsvg','-r1200');

%% 不同模型RMSE battery3
figure,
color =  colorInterp_lan(6, 8);
set(gcf, 'Position',[0 0 480 480],'Color','White');
for i=1:1:5

    plot(freq,rmse_realEIS_battery3(i,:),'-o','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel("RMSE of Z' (μΩ)");
set (gca,'LineWidth',3,'position',[0.18,0.28,0.8,0.7]);

set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:2:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
axis([10^-1.5 10^4.5 0.00 9.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP3-RMSE-Real-Hz'],'-dsvg','-r1200');

figure,
color =  colorInterp_lan(6, 8);
set(gcf, 'Position',[0 0 480 480],'Color','White');
for i=1:1:5
    plot(freq,rmse_imagEIS_battery3(i,:),'-s','LineWidth',1,'MarkerSize',12,'Color',color(i,:));hold on

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('100 Hz','50 Hz','25 Hz','10 Hz','5 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE of Z" (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.28,0.8,0.7]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

set(gca,'xtick',10.^[-1:2:4],'ytick',-2000:2:2000,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');

axis([10^-1.5 10^4.5 0.00 9.9])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP3-RMSE-Imag-Hz'],'-dsvg','-r1200');
%%
figure,
color =  colorInterp_lan(6, 8);
set(gcf, 'Position',[0 0 960 960],'Color','White');
index = 1:50:3801;
for i=1:1:5

    plot(ind_nan(index)/ind_nan(end)*500,TrainingLoss(i,(index)),'-','LineWidth',3,'MarkerSize',12,'Color',color(i,:));hold on
    plot(ind_nan(index)/ind_nan(end)*500,ValidationLoss(i,(index)),'-.','LineWidth',3,'MarkerSize',12,'Color',color(i,:));hold on

end
leg=legend('Training Loss (100 Hz)','Validation Loss (100 Hz)', ...
    'Training Loss (50 Hz)','Validation Loss (50 Hz)', ...
    'Training Loss (25 Hz)','Validation Loss (25 Hz)', ...
    'Training Loss (10 Hz)','Validation Loss (10 Hz)', ...
    'Training Loss (5 Hz)','Validation Loss (5 Hz)');
set(leg,'Location','Northeast','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[45,18];  %
xlabel("Epoch");ylabel('Loss');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);ytickformat('%.1f')

set(gca,'xtick',0:100:500,'ytick',-2000:0.1:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
axis([-10 510 0.00 0.58])
gca=boxoff(gca);clear gca;
print(gcf, ['Figs/LFP LOSS'],'-dsvg','-r1200');

%% 数据汇总 GPR SVR

freq = 10.^[4:-0.1:-1];
F = [100];
for i=1:1:length(F)
    Fn = F(i);
    load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
    [XTrain1,YTrain1,XVal1,YVal1,XTest1,YTest1,N_EIS,eis_mean_std1,SOC_T1] = lstm_data_set_onehot(Fn,1);
    [XTrain3,YTrain3,XVal3,YVal3,XTest3,YTest3,N_EIS,eis_mean_std3,SOC_T3] = lstm_data_set_onehot(Fn,3);
    SOC=[SOC_T1.SOC_Test;SOC_T3.SOC_Test];Temp = [SOC_T1.T_Test;SOC_T3.T_Test];
    %%% RMSE
    YPred1 = predict(net,XTest1);YPred3 = predict(net,XTest3);
    EIS_exp_real = [(YTest1(:,1:N_EIS)*eis_mean_std1(1,2)+eis_mean_std1(1,1) )*1000000;(YTest3(:,1:N_EIS)*eis_mean_std3(1,2)+eis_mean_std3(1,1) )*1000000];
    EIS_exp_imag = [(YTest1(:,N_EIS+1:end)*eis_mean_std1(2,2)+eis_mean_std1(2,1) )*1000000;(YTest3(:,N_EIS+1:end)*eis_mean_std3(2,2)+eis_mean_std3(2,1) )*1000000];
    EIS_pre_real = [(YPred1(:,1:N_EIS)*eis_mean_std1(1,2)+eis_mean_std1(1,1) )*1000000;(YPred3(:,1:N_EIS)*eis_mean_std3(1,2)+eis_mean_std3(1,1) )*1000000];
    EIS_pre_imag = [(YPred1(:,N_EIS+1:end)*eis_mean_std1(2,2)+eis_mean_std1(2,1) )*1000000;(YPred3(:,N_EIS+1:end)*eis_mean_std3(2,2)+eis_mean_std3(2,1) )*1000000];
    rmse_realEIS_battery(i*3-2,:) = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_imagEIS_battery(i*3-2,:) = rmse( EIS_exp_imag , EIS_pre_imag ,1);
 
    EIS_real0.(['freq',num2str(Fn),'Hz']) = EIS_exp_real;EIS_imag0.(['freq',num2str(Fn),'Hz']) = EIS_exp_imag;
    EIS_real.(['freq',num2str(Fn),'Hz']) = EIS_pre_real;EIS_imag.(['freq',num2str(Fn),'Hz']) = EIS_pre_imag;
    T0.(['freq',num2str(Fn),'Hz']) = Temp;SOC0.(['freq',num2str(Fn),'Hz']) = SOC;
end
save EIS_pre.mat EIS_imag EIS_real T0 SOC0 EIS_real0 EIS_imag0
    
%% 数据汇总 LSTM EIS for TEMP SOC
F = [100 50 25 10 5];
for i=1:1:5
    Fn = F(i);
    load(['lstm_ui2eis_battery_',num2str(Fn),'.mat']);
    [X1,Y1,eis_mean_std1,SOC1,Temp1,N_EIS] = lstm_data_set_onehot_all(Fn,1);
    [X3,Y3,eis_mean_std3,SOC3,Temp3,N_EIS] = lstm_data_set_onehot_all(Fn,3);
    X =[X1;X3];Y =[Y1;Y3];SOC=[SOC1;SOC3];Temp = [Temp1;Temp3];
    %%% RMSE
    YPred1 = predict(net,X1);YPred3 = predict(net,X3);
end
save EIS_pre4temp_soc.mat Y1 Y3 YPred1 YPred3 eis_mean_std1 eis_mean_std3 SOC1 Temp1 SOC3 Temp3

%% ========================================================================
%% 本地函数 1：onehot 版本（无数据泄露）
%% ========================================================================
function [XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std,SOC_T] = lstm_data_set_onehot(Fn,Number)

Nf = 100 / Fn;
Nt = 10;

voltage = [];
current = [];
realEIS = [];
imagEIS = [];
SOC     = [];
Temp    = [];
onehot  = [];

for temp = 21:2:45
    load(['../../data_need\data_need_', num2str(temp), '_', num2str(Number), '.mat']);

    index1 = 1:Nt:size(voltage0,1);
    index2 = 1:Nf:size(voltage0,2);

    voltage = [voltage; voltage0(index1,index2)];
    current = [current; current0(index1,index2)];
    realEIS = [realEIS; real0(index1,:)];
    imagEIS = [imagEIS; imag0(index1,:)];
    SOC     = [SOC; SOC0(index1,:)];
    Temp    = [Temp; temp0(index1,:)];

    onehot0 = zeros(size(voltage0(index1,index2)));
    if Number == 1
        onehot0(:,:) = 1;
    else
        onehot0(:,:) = -1;
    end
    onehot = [onehot; onehot0];
end

[N, ~] = size(current);
N_EIS = size(realEIS,2);

if any(isnan(current(:))) || any(isnan(voltage(:))) || any(isnan(realEIS(:))) || any(isnan(imagEIS(:)))
    error('数据中包含 NaN，请先处理');
end
if any(isinf(current(:))) || any(isinf(voltage(:))) || any(isinf(realEIS(:))) || any(isinf(imagEIS(:)))
    error('数据中包含 Inf，请先处理');
end

rng(20)
idx = randperm(N);

Ntrain = round(0.6 * N);
Nval   = round(0.2 * N);
Ntest  = N - Ntrain - Nval;

idxTrain = idx(1:Ntrain);
idxVal   = idx(Ntrain+1:Ntrain+Nval);
idxTest  = idx(Ntrain+Nval+1:end);

currentMean = mean(current(idxTrain,:), 'all');
currentStd  = std(current(idxTrain,:), 0, 'all');
voltageMean = mean(voltage(idxTrain,:), 'all');
voltageStd  = std(voltage(idxTrain,:), 0, 'all');
realMean    = mean(realEIS(idxTrain,:), 'all');
realStd     = std(realEIS(idxTrain,:), 0, 'all');
imagMean    = mean(imagEIS(idxTrain,:), 'all');
imagStd     = std(imagEIS(idxTrain,:), 0, 'all');

if currentStd == 0, currentStd = 1; end
if voltageStd == 0, voltageStd = 1; end
if realStd == 0, realStd = 1; end
if imagStd == 0, imagStd = 1; end

currentNorm = (current - currentMean) ./ currentStd;
voltageNorm = (voltage - voltageMean) ./ voltageStd;
realNorm    = (realEIS - realMean) ./ realStd;
imagNorm    = (imagEIS - imagMean) ./ imagStd;

XTrain = cell(Ntrain,1);
for i = 1:Ntrain
    XTrain{i} = [currentNorm(idxTrain(i),:); voltageNorm(idxTrain(i),:); onehot(idxTrain(i),:)];
end
YTrain = [realNorm(idxTrain,:), imagNorm(idxTrain,:)];

XVal = cell(Nval,1);
for i = 1:Nval
    XVal{i} = [currentNorm(idxVal(i),:); voltageNorm(idxVal(i),:); onehot(idxVal(i),:)];
end
YVal = [realNorm(idxVal,:), imagNorm(idxVal,:)];

XTest = cell(Ntest,1);
for i = 1:Ntest
    XTest{i} = [currentNorm(idxTest(i),:); voltageNorm(idxTest(i),:); onehot(idxTest(i),:)];
end
YTest = [realNorm(idxTest,:), imagNorm(idxTest,:)];

eis_mean_std = [realMean, realStd;
                imagMean, imagStd];

SOC_T.SOC_Train = SOC(idxTrain,:);
SOC_T.T_Train   = Temp(idxTrain,:);
SOC_T.SOC_Val   = SOC(idxVal,:);
SOC_T.T_Val     = Temp(idxVal,:);
SOC_T.SOC_Test  = SOC(idxTest,:);
SOC_T.T_Test    = Temp(idxTest,:);
SOC_T.SOC       = SOC([idxTrain, idxVal, idxTest], :);
SOC_T.T         = Temp([idxTrain, idxVal, idxTest], :);
end

%% ========================================================================
%% 本地函数 2：全部样本版本（用于汇总）
%% ========================================================================
function [X,Y,eis_mean_std,SOC,Temp,N_EIS] = lstm_data_set_onehot_all(Fn,Number)

Nf = 100 / Fn;
Nt = 10;

voltage = [];
current = [];
realEIS = [];
imagEIS = [];
SOC     = [];
Temp    = [];
onehot  = [];

for temp = 21:2:45
    load(['../../data_need\data_need_', num2str(temp), '_', num2str(Number), '.mat']);

    index1 = 1:Nt:size(voltage0,1);
    index2 = 1:Nf:size(voltage0,2);

    voltage = [voltage; voltage0(index1,index2)];
    current = [current; current0(index1,index2)];
    realEIS = [realEIS; real0(index1,:)];
    imagEIS = [imagEIS; imag0(index1,:)];
    SOC     = [SOC; SOC0(index1,:)];
    Temp    = [Temp; temp0(index1,:)];

    onehot0 = zeros(size(voltage0(index1,index2)));
    if Number == 1
        onehot0(:,:) = 1;
    else
        onehot0(:,:) = -1;
    end
    onehot = [onehot; onehot0];
end

N_EIS = size(realEIS,2);

rng(20)
idx = randperm(size(current,1));
Ntrain = round(0.6 * size(current,1));
idxTrain = idx(1:Ntrain);

currentMean = mean(current(idxTrain,:), 'all');
currentStd  = std(current(idxTrain,:), 0, 'all');
voltageMean = mean(voltage(idxTrain,:), 'all');
voltageStd  = std(voltage(idxTrain,:), 0, 'all');
realMean    = mean(realEIS(idxTrain,:), 'all');
realStd     = std(realEIS(idxTrain,:), 0, 'all');
imagMean    = mean(imagEIS(idxTrain,:), 'all');
imagStd     = std(imagEIS(idxTrain,:), 0, 'all');

if currentStd == 0, currentStd = 1; end
if voltageStd == 0, voltageStd = 1; end
if realStd == 0, realStd = 1; end
if imagStd == 0, imagStd = 1; end

currentNorm = (current - currentMean) ./ currentStd;
voltageNorm = (voltage - voltageMean) ./ voltageStd;
realNorm    = (realEIS - realMean) ./ realStd;
imagNorm    = (imagEIS - imagMean) ./ imagStd;

N = size(currentNorm,1);
X = cell(N,1);
for i = 1:N
    X{i} = [currentNorm(i,:); voltageNorm(i,:); onehot(i,:)];
end
Y = [realNorm, imagNorm];

eis_mean_std = [realMean, realStd;
                imagMean, imagStd];
end