function lstm_model_T_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,color)
YPred = predict(net,XTest);   % 预测第1个样本
figure,
plo_all = [];
set(gcf, 'Position',[0 0 480 480],'Color','White');

plo = plot(YTest(:,1:N_EIS) .* eis_mean_std(1,2) + eis_mean_std(1,1),YPred(:,1:N_EIS) .* eis_mean_std(1,2) + eis_mean_std(1,1),'o','Color',color,'MarkerSize',12,'LineWidth',1);hold on
plo_all = [plo_all,plo];
mn=min([YPred(:,1:N_EIS);18]); mx=max([YPred(:,1:N_EIS);48]);
plot([mn mx],[mn mx],'k--','LineWidth',2);hold on
axis equal;
axis([19 47 19 47])
xlabel("Measured Temperature (\circC)");ylabel('Predicted Temperature (\circC)');
leg=legend(plo_all,['Cell-2' newline 'Test Data']);

set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','h','NumColumns',1,'box','off');
leg.ItemTokenSize=[10,18];  %
set(gca,'LineWidth',3,'position',[0.18,0.19,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-100:5:200,'FontSize',24,'LabelFontSizeMultiplier',1,'FontName','Arial');
rmse(YTest(:,1:N_EIS) .* eis_mean_std(1,2) + eis_mean_std(1,1),YPred(:,1:N_EIS) .* eis_mean_std(1,2) + eis_mean_std(1,1))
end