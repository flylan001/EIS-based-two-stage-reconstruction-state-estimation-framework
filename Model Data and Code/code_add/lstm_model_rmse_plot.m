function lstm_model_rmse_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std)
freq = 10.^[4:-0.1:-1];
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
Fn = [100 50 25 10 5];
for i=1:1:5
    load(['lstm_ui2eis_battery1_',num2str(Fn(i)),'.mat']);
    YPred = predict(net,XTest);   % 预测第1个样本
    %%% RMSE
    EIS_exp_real = (YTest(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;
    EIS_exp_imag = (YTest(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;
    EIS_pre_real = (YPred(:,1:N_EIS)*eis_mean_std(1,2)+eis_mean_std(1,1) )*1000000;
    EIS_pre_imag = (YPred(:,N_EIS+1:end)*eis_mean_std(2,2)+eis_mean_std(2,1) )*1000000;
    rmse_EIS1 = rmse( EIS_exp_real , EIS_pre_real ,1);
    rmse_EIS2 = rmse( EIS_exp_imag , EIS_pre_imag ,1);


    plot(freq,rmse_EIS1,'-*r','LineWidth',3,'MarkerSize',8);hold on
    plot(freq,rmse_EIS2,'-*b','LineWidth',3,'MarkerSize',8);

end
set(gca, 'XScale', 'log','XDir', 'reverse'); % 设置横轴为对数坐标
leg=legend('RMSE of Real Part','RMSE of Imaginary Part');
set(leg,'Location','North','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
xlabel("Frequency (Hz)");ylabel('RMSE \rm(\mu\Omega)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');

set(gca,'xtick',10.^[-1:1:4],'ytick',-2000:1:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');

axis([0.01 100000 0.00 5])

end