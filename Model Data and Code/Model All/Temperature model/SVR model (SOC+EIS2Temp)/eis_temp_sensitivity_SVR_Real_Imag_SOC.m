load ..\..\data_mine.mat
load std_mean_battry1_SOC.mat
mean1 = SVR_mean;std1 =  SVR_std;
load std_mean_battry3_SOC.mat
mean3 = SVR_mean;std3 =  SVR_std;
%%%%%%%%%%%%%%%%%%%%%%%%% 从频率角度出发计算 %%%%%%%%%%%%%%%%%%%%%%%%
%% 电池 合一块 计算 电池1 实部虚部 1
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,1:11),imag0(index1,1:11),soc(index1)'];Y = T(index1);
    load SVRMdl1_battery1_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl1,X,Y,mean1(1,:),std1(1,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl1,X,Y,mean1(1,:),std1(1,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    
end
RMSE_R_I.battery1_SOC.RMSE1 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 5.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP1 eis SOC temp senseitivity Real and Imag 1');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 2
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,11:21),imag0(index1,11:21),soc(index1)'];Y = T(index1);
    load SVRMdl2_battery1_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl2,X,Y,mean1(2,:),std1(2,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl2,X,Y,mean1(2,:),std1(2,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery1_SOC.RMSE2 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 3.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP1 eis SOC temp senseitivity Real and Imag 2');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 3
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,21:31),imag0(index1,21:31),soc(index1)'];Y = T(index1);
    load SVRMdl3_battery1_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl3,X,Y,mean1(3,:),std1(3,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl3,X,Y,mean1(3,:),std1(3,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery1_SOC.RMSE3 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 3.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP1 eis SOC temp senseitivity Real and Imag 3');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 4
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,31:41),imag0(index1,31:41),soc(index1)'];Y = T(index1);
    load SVRMdl4_battery1_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl4,X,Y,mean1(4,:),std1(4,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl4,X,Y,mean1(4,:),std1(4,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery1_SOC.RMSE4 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 3.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP1 eis SOC temp senseitivity Real and Imag 4');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 5
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,41:51),imag0(index1,41:51),soc(index1)'];Y = T(index1);
    load SVRMdl5_battery1_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl5,X,Y,mean1(5,:),std1(5,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl5,X,Y,mean1(5,:),std1(5,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery1_SOC.RMSE5 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 3.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP1 eis SOC temp senseitivity Real and Imag 5');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池 合一块 计算 电池3 实部虚部 1
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300 ;
    X = [real0(index1,1:11),imag0(index1,1:11),soc(index1)'];Y = T(index1);
    load SVRMdl1_battery3_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl1,X,Y,mean3(1,:),std3(1,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl1,X,Y,mean3(1,:),std3(1,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    
end
RMSE_R_I.battery3.RMSE1 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 eis SOC temp senseitivity Real and Imag 1');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池3 实部虚部 2
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,11:21),imag0(index1,11:21),soc(index1)'];Y = T(index1);
    load SVRMdl2_battery3_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl2,X,Y,mean3(2,:),std3(2,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl2,X,Y,mean3(2,:),std3(2,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery3.RMSE2 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 3.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 eis SOC temp senseitivity Real and Imag 2');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池3 实部虚部 3
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,21:31),imag0(index1,21:31),soc(index1)'];Y = T(index1);
    load SVRMdl3_battery3_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl3,X,Y,mean3(3,:),std3(3,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl3,X,Y,mean3(3,:),std3(3,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery3.RMSE3 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 3.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 eis SOC temp senseitivity Real and Imag 3');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池3 实部虚部 4
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,31:41),imag0(index1,31:41),soc(index1)'];Y = T(index1);
    load SVRMdl4_battery3_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl4,X,Y,mean3(4,:),std3(4,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl4,X,Y,mean3(4,:),std3(4,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery3.RMSE4 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 3.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 eis SOC temp senseitivity Real and Imag 4');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池3 实部虚部 5
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,41:51),imag0(index1,41:51),soc(index1)'];Y = T(index1);
    load SVRMdl5_battery3_SOC.mat
    [sigma,RMSE_mean1(:,2*i-1)] = SVR_Monte_Carlo_Real(SVRMdl5,X,Y,mean3(5,:),std3(5,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = SVR_Monte_Carlo_Imag(SVRMdl5,X,Y,mean3(5,:),std3(5,:));
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery3.RMSE5 = RMSE_mean1;
xlabel('Additional Noise of EIS (μΩ)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:1:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 3.5])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 eis SOC temp senseitivity Real and Imag 5');
print(gcf, save_path,'-dsvg','-r1200');
save rmse_R_I_noise.mat RMSE_R_I sigma

%% 评价曲线 EIS对电池温度
load rmse_R_I_noise.mat
Temp_error_per_noisy = zeros(5,13*2);plo_all = [];leg =[];
color = flipud(colorInterp_lan(6, 6));color(1,:)=[];temp = 21:2:45;
for i =1:1:5
    RMSE_SVR = RMSE_R_I.battery1_SOC.(['RMSE',num2str(i)]);
    for j = 1:1:13*2
        x = sigma(3:end)*1e6;
        y = RMSE_SVR(3:end,j);
        p = polyfit(x, y, 1);
        Temp_error_per_noisy(i,j) = p(1);
    end
end

figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i =1:1:5
    plo = plot(temp,Temp_error_per_noisy(i,1:2:26),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    plo = plot(temp,Temp_error_per_noisy(i,2:2:26),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
leg{4} = '10000-1000 Hz';leg{5} = '1000-100 Hz';leg{6} = '100-100 Hz';leg{7} = '10-1 Hz';leg{8} = '1-0.1 Hz';

xlabel('Temperature (\circC)'); 
ylabel('d\rmT/d\rmN (\circC/μΩ)');ytickformat('%.1f')

 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([20 46 -0.05 1.99])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP1 eis SOC temp senseitivity freq Real and Imag');
print(gcf, save_path,'-dsvg','-r1200');

%%%%电池3
Temp_error_per_noisy = zeros(5,13*2);plo_all = [];leg =[];
for i =1:1:5
    RMSE_SVR = RMSE_R_I.battery3.(['RMSE',num2str(i)]);
    for j = 1:1:13*2
        x = sigma(3:end)*1e6;
        y = RMSE_SVR(3:end,j);
        p = polyfit(x, y, 1);
        Temp_error_per_noisy(i,j) = p(1);
    end
end

figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Z'"];
leg{2} = ['Z"'];
leg{3} = [' '];
for i =1:1:5
    plo = plot(temp,Temp_error_per_noisy(i,1:2:26),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    plo = plot(temp,Temp_error_per_noisy(i,2:2:26),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
leg{4} = '10000-1000 Hz';leg{5} = '1000-100 Hz';leg{6} = '100-100 Hz';leg{7} = '10-1 Hz';leg{8} = '1-0.1 Hz';

xlabel('Temperature (\circC)'); 
ylabel('d\rmT/d\rmN (\circC/μΩ)');ytickformat('%.1f')
 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([20 46 -0.05 1.99])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP3 eis SOC temp senseitivity freq Real and Imag');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 SOC 1
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');plo_all = [];leg =[];
temp = 21:2 :45; RMSE_mean_SOC = zeros(11,length(temp));color=flipud(colorInterp_lan(4, 13));

plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Cell-1"];
leg{2} = ['Cell-2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 0 ;
    X = [real0(index1,1:11),imag0(index1,1:11),soc(index1)'];Y = T(index1);
    load SVRMdl1_battery1_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl1,X,Y,mean1(1,:),std1(1,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{i+3} = [num2str(temp(i)),' \circC '];
end
RMSE_R_I_SOC.battery1.RMSE1 = RMSE_mean_SOC;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300 ;
    X = [real0(index1,1:11),imag0(index1,1:11),soc(index1)'];Y = T(index1);
    load SVRMdl1_battery3_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl1,X,Y,mean3(1,:),std3(1,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I_SOC.battery3.RMSE1 = RMSE_mean_SOC;

xlabel('Additional Noise of SOC (%)'); ylabel('RMSE of Temperature (\circC)'); ytickformat('%.1f');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:4:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-2 22 -0.1 2.4])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP eis SOC temp senseitivity freq SOC 1');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 SOC 2
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');plo_all = [];leg =[];
temp = 21:2 :45; RMSE_mean_SOC = zeros(11,length(temp));color=flipud(colorInterp_lan(4, 13));

plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Cell-1"];
leg{2} = ['Cell-2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 0 ;
    X = [real0(index1,11:21),imag0(index1,11:21),soc(index1)'];Y = T(index1);
    load SVRMdl2_battery1_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl2,X,Y,mean1(2,:),std1(2,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{i+3} = [num2str(temp(i)),' \circC '];
end
RMSE_R_I_SOC.battery1.RMSE2 = RMSE_mean_SOC;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300 ;
    X = [real0(index1,11:21),imag0(index1,11:21),soc(index1)'];Y = T(index1);
    load SVRMdl2_battery3_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl2,X,Y,mean3(2,:),std3(2,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I_SOC.battery3.RMSE2 = RMSE_mean_SOC;

xlabel('Additional Noise of SOC (%)'); ylabel('RMSE of Temperature (\circC)'); ytickformat('%.1f');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:4:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-2 22 -0.1 1.4])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP eis SOC temp senseitivity freq SOC 2');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 SOC 3
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');plo_all = [];leg =[];
temp = 21:2 :45; RMSE_mean_SOC = zeros(11,length(temp));color=flipud(colorInterp_lan(4, 13));

plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Cell-1"];
leg{2} = ['Cell-2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 0 ;
    X = [real0(index1,21:31),imag0(index1,21:31),soc(index1)'];Y = T(index1);
    load SVRMdl3_battery1_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl3,X,Y,mean1(3,:),std1(3,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{i+3} = [num2str(temp(i)),' \circC '];
end
RMSE_R_I_SOC.battery1.RMSE3 = RMSE_mean_SOC;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300 ;
    X = [real0(index1,21:31),imag0(index1,21:31),soc(index1)'];Y = T(index1);
    load SVRMdl3_battery3_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl3,X,Y,mean3(3,:),std3(3,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I_SOC.battery3.RMSE3 = RMSE_mean_SOC;

xlabel('Additional Noise of SOC (%)'); ylabel('RMSE of Temperature (\circC)'); ytickformat('%.1f');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:4:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-2 22 -0.1 1.4])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP eis SOC temp senseitivity freq SOC 3');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 SOC 4
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');plo_all = [];leg =[];
temp = 21:2 :45; RMSE_mean_SOC = zeros(11,length(temp));color=flipud(colorInterp_lan(4, 13));

plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Cell-1"];
leg{2} = ['Cell-2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 0 ;
    X = [real0(index1,31:41),imag0(index1,31:41),soc(index1)'];Y = T(index1);
    load SVRMdl4_battery1_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl4,X,Y,mean1(4,:),std1(4,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{i+3} = [num2str(temp(i)),' \circC '];
end
RMSE_R_I_SOC.battery1.RMSE4 = RMSE_mean_SOC;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300 ;
    X = [real0(index1,31:41),imag0(index1,31:41),soc(index1)'];Y = T(index1);
    load SVRMdl4_battery3_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl4,X,Y,mean3(4,:),std3(4,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I_SOC.battery3.RMSE4 = RMSE_mean_SOC;

xlabel('Additional Noise of SOC (%)'); ylabel('RMSE of Temperature (\circC)'); ytickformat('%.1f');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:4:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-2 22 -0.1 1.4])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP eis SOC temp senseitivity freq SOC 4');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 SOC 5
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');plo_all = [];leg =[];
temp = 21:2 :45; RMSE_mean_SOC = zeros(11,length(temp));color=flipud(colorInterp_lan(4, 13));

plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Cell-1"];
leg{2} = ['Cell-2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 0 ;
    X = [real0(index1,41:51),imag0(index1,41:51),soc(index1)'];Y = T(index1);
    load SVRMdl5_battery1_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl5,X,Y,mean1(5,:),std1(5,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{i+3} = [num2str(temp(i)),' \circC '];
end
RMSE_R_I_SOC.battery1.RMSE5 = RMSE_mean_SOC;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300 ;
    X = [real0(index1,41:51),imag0(index1,41:51),soc(index1)'];Y = T(index1);
    load SVRMdl5_battery3_SOC.mat
    [sigma,RMSE_mean_SOC(:,i)] = SVR_Monte_Carlo_SOC(SVRMdl5,X,Y,mean3(5,:),std3(5,:));
    plo = plot(sigma* 100,RMSE_mean_SOC(:,i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I_SOC.battery3.RMSE5 = RMSE_mean_SOC;

xlabel('Additional Noise of SOC (%)'); ylabel('RMSE of Temperature (\circC)'); ytickformat('%.1f');
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:4:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-2 22 -0.1 1.4])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP eis SOC temp senseitivity freq SOC 5');
print(gcf, save_path,'-dsvg','-r1200');

save rmse_R_I_SOC_noise.mat RMSE_R_I_SOC sigma
%% 合并讨论
load rmse_R_I_SOC_noise.mat
Temp_error_per_noisy = zeros(5,13*2);plo_all = [];leg =[];
color = flipud(colorInterp_lan(6, 6));color(1,:)=[];temp = 21:2:45;
for i =1:1:5
    RMSE_SVR = RMSE_R_I_SOC.battery1.(['RMSE',num2str(i)]);
    for j = 1:1:13
        x = sigma(3:end)*10;
        y = RMSE_SVR(3:end,j);
        p = polyfit(x, y, 1);
        Temp_error_per_noisy(i,j) = p(1);
    end
end
for i =1:1:5
    RMSE_SVR = RMSE_R_I_SOC.battery3.(['RMSE',num2str(i)]);
    for j = 1:1:13
        x = sigma(3:end)*10;
        y = RMSE_SVR(3:end,j);
        p = polyfit(x, y, 1);
        Temp_error_per_noisy(i,13+j) = p(1);
    end
end
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["Cell-1"];
leg{2} = ['Cell-2'];
leg{3} = [' '];
for i =1:1:5
    plo = plot(temp,Temp_error_per_noisy(i,1:1:13),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    plo = plot(temp,Temp_error_per_noisy(i,14:1:26),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
leg{4} = '10000-1000 Hz';leg{5} = '1000-100 Hz';leg{6} = '100-100 Hz';leg{7} = '10-1 Hz';leg{8} = '1-0.1 Hz';

xlabel('Temperature (\circC)'); 
ylabel('dT/d(10% SOC) (°C)');
ytickformat('%.1f')

 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-0:0.2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Arial');
leg=legend(plo_all,leg);
set(leg,'Location','North','FontSize',24,'FontName','Arial','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([20 46 -0.05 1.19])
gca=boxoff(gca);clear gca
save_path=strcat('SVR_figure','\','LFP eis SOC temp senseitivity freq Real and Imag');
print(gcf, save_path,'-dsvg','-r1200');





%%% 蒙特卡洛算法 
function [sigma,RMSE_mean] = SVR_Monte_Carlo_Real(SVRMdl,X,Y,mean0,std0)
NumC = 50;
RMSE_test =zeros(10,NumC);
% 添加噪声 0 sigma1 sigma2 sigma3 sigma4
sigma = [0:1:10]*5e-7;
for j =1:1:NumC
    for i=1:1:length(sigma)
        sigma1 = sigma(i)*randn(size(X));
        sigma1(:,(size(X,2)-1)/2+1:end) = 0;
        Xn = X + sigma1;
        [ypre_all ]=predict(SVRMdl,(Xn-mean0)./std0 );
        RMSE_test(i,j) = rmse(Y,ypre_all);

    end
    j;
end
RMSE_mean = mean(RMSE_test,2);

end

%%% 蒙特卡洛算法 
function [sigma,RMSE_mean] = SVR_Monte_Carlo_Imag(SVRMdl,X,Y,mean0,std0)
NumC = 50;
RMSE_test =zeros(10,NumC);
% 添加噪声 0 sigma1 sigma2 sigma3 sigma4
sigma = [0:1:10]*5e-7;
for j =1:1:NumC
    for i=1:1:length(sigma)
        sigma1 = sigma(i)*randn(size(X));
        
        sigma1(:,1:(size(X,2)-1)/2) = 0;
        sigma1(:,end) = 0;
        Xn = X + sigma1;
        [ypre_all ]=predict(SVRMdl,(Xn-mean0)./std0 );
        RMSE_test(i,j) = rmse(Y,ypre_all);

    end
    j;
end
RMSE_mean = mean(RMSE_test,2);

end

%%% 蒙特卡洛算法 
function [sigma,RMSE_mean] = SVR_Monte_Carlo_SOC(SVRMdl,X,Y,mean0,std0)
NumC = 50;
RMSE_test =zeros(10,NumC);
% 添加噪声 0 sigma1 sigma2 sigma3 sigma4
sigma = [0:1:10]*0.02;
for j =1:1:NumC
    for i=1:1:length(sigma)
        sigma1 = sigma(i)*randn(size(X));
        
        sigma1(:,1:size(X,2)-1) = 0;
        Xn = X + sigma1;
        [ypre_all ]=predict(SVRMdl,(Xn-mean0)./std0 );
        RMSE_test(i,j) = rmse(Y,ypre_all);

    end
    j;
end
RMSE_mean = mean(RMSE_test,2);

end