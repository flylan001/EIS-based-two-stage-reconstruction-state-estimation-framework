function lstm_model_eis_plot(net,trainInfo,XTest,YTest,N_EIS,eis_mean_std,SOC_T)
YPred = predict(net,XTest);   % 预测第1个样本
figure,
set(gcf, 'Position',[0 0 600 600],'Color','White');
N = size(XTest,1);
color =  flipud(colorInterp_lan(4, 13));bias=0.02;
for i=1:450:size(XTest,1)
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

xlabel('Z'' (μΩ)');ylabel('-Z" (μΩ)');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
axis equal
axis([355 620 -180 85])
set(gca,'xtick',-1000:2000:5000,'ytick',-1000:2000:2000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');

end