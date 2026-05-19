load ..\..\data_mine.mat
%%%%%%%%%%%%%%%%%%%%%%%%% 从频率角度出发计算 %%%%%%%%%%%%%%%%%%%%%%%%
%% 电池 合一块 计算 电池1 实部虚部 1
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,1:11),imag0(index1,1:11)];Y = T(index1);
    load gprMdl1_battery1.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl1,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl1,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    
end
RMSE_R_I.battery1.RMSE1 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 eis temp senseitivity Real and Imag 1');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 2
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,11:21),imag0(index1,11:21)];Y = T(index1);
    load gprMdl2_battery1.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl2,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl2,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery1.RMSE2 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 eis temp senseitivity Real and Imag 2');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 3
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,21:31),imag0(index1,21:31)];Y = T(index1);
    load gprMdl3_battery1.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl3,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl3,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery1.RMSE3 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 eis temp senseitivity Real and Imag 3');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 4
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,31:41),imag0(index1,31:41)];Y = T(index1);
    load gprMdl4_battery1.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl4,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl4,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery1.RMSE4 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 eis temp senseitivity Real and Imag 4');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 5
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,41:51),imag0(index1,41:51)];Y = T(index1);
    load gprMdl5_battery1.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl5,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl5,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery1.RMSE5 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 eis temp senseitivity Real and Imag 5');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池 合一块 计算 电池3 实部虚部 1
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300 ;
    X = [real0(index1,1:11),imag0(index1,1:11)];Y = T(index1);
    load gprMdl1_battery3.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl1,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl1,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    
end
RMSE_R_I.battery3.RMSE1 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP3 eis temp senseitivity Real and Imag 1');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池3 实部虚部 2
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,11:21),imag0(index1,11:21)];Y = T(index1);
    load gprMdl2_battery3.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl2,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl2,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery3.RMSE2 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP3 eis temp senseitivity Real and Imag 2');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 3
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,21:31),imag0(index1,21:31)];Y = T(index1);
    load gprMdl3_battery3.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl3,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl3,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery3.RMSE3 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP3 eis temp senseitivity Real and Imag 3');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 4
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,31:41),imag0(index1,31:41)];Y = T(index1);
    load gprMdl4_battery3.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl4,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl4,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery3.RMSE4 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP3 eis temp senseitivity Real and Imag 4');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池1 实部虚部 5
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,2*length(temp));color=flipud(colorInterp_lan(4, 13));plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,41:51),imag0(index1,41:51)];Y = T(index1);
    load gprMdl5_battery3.mat
    [sigma,RMSE_mean1(:,2*i-1)] = GPR_Monte_Carlo_Real(gprMdl5,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i-1),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
    [sigma,RMSE_mean1(:,2*i)] = GPR_Monte_Carlo_Imag(gprMdl5,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,2*i),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
RMSE_R_I.battery3.RMSE5 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP3 eis temp senseitivity Real and Imag 5');
print(gcf, save_path,'-dsvg','-r1200');
save rmse_R_I_noise.mat RMSE_R_I sigma
%% 评价曲线 %%%%电池1
load rmse_R_I_noise.mat
Temp_error_per_noisy = zeros(5,13*2);plo_all = [];leg =[];
color=cool(6);temp = 21:2:45;
for i =1:1:5
    RMSE_Gpr = RMSE_R_I.battery1.(['RMSE',num2str(i)]);
    for j = 1:1:13*2
        x = sigma(3:end)*1e6;
        y = RMSE_Gpr(3:end,j);
        p = polyfit(x, y, 1);
        Temp_error_per_noisy(i,j) = p(1);
    end
end

figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i =1:1:5
    plo = plot(temp,Temp_error_per_noisy(i,1:2:26),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    plo = plot(temp,Temp_error_per_noisy(i,2:2:26),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
leg{4} = '10000-1000 Hz';leg{5} = '1000-100 Hz';leg{6} = '100-100 Hz';leg{7} = '10-1 Hz';leg{8} = '1-0.1 Hz';

xlabel('Temperature (\circC)'); 
ylabel('$dT/dN\ (\mathrm{^\circ C/\mu\Omega})$', 'Interpreter', 'latex');ytickformat('%.1f')

 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','North','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([20 46 -0.05 1.99])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 eis temp senseitivity freq Real and Imag');
print(gcf, save_path,'-dsvg','-r1200');

%%%%电池3
Temp_error_per_noisy = zeros(5,13*2);plo_all = [];leg =[];
color=cool(6);
for i =1:1:5
    RMSE_Gpr = RMSE_R_I.battery3.(['RMSE',num2str(i)]);
    for j = 1:1:13*2
        x = sigma(3:end)*1e6;
        y = RMSE_Gpr(3:end,j);
        p = polyfit(x, y, 1);
        Temp_error_per_noisy(i,j) = p(1);
    end
end

figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ["\itZ'"];
leg{2} = ['\itZ"'];
leg{3} = [' '];
for i =1:1:5
    plo = plot(temp,Temp_error_per_noisy(i,1:2:26),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    plo = plot(temp,Temp_error_per_noisy(i,2:2:26),'-.','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
leg{4} = '10000-1000 Hz';leg{5} = '1000-100 Hz';leg{6} = '100-100 Hz';leg{7} = '10-1 Hz';leg{8} = '1-0.1 Hz';

xlabel('Temperature (\circC)'); 
ylabel('$dT/dN\ (\mathrm{^\circ C/\mu\Omega})$', 'Interpreter', 'latex');ytickformat('%.1f')
 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','North','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([20 46 -0.05 1.99])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP3 eis temp senseitivity freq Real and Imag');
print(gcf, save_path,'-dsvg','-r1200');







%%% 蒙特卡洛算法 
function [sigma,RMSE_mean] = GPR_Monte_Carlo_Real(gprMdl,X,Y)
NumC = 5;
RMSE_test =zeros(10,NumC);
% 添加噪声 0 sigma1 sigma2 sigma3 sigma4
sigma = [0:1:10]*5e-7;
for j =1:1:NumC
    for i=1:1:length(sigma)
        sigma1 = sigma(i)*randn(size(X));
        sigma1(:,size(X,2)/2+1:end) = 0;
        Xn = X + sigma1;
        [ypre_all,~,yint]=predict(gprMdl,Xn);
        RMSE_test(i,j) = rmse(Y,ypre_all);

    end
    j
end
RMSE_mean = mean(RMSE_test,2);

end

%%% 蒙特卡洛算法 
function [sigma,RMSE_mean] = GPR_Monte_Carlo_Imag(gprMdl,X,Y)
NumC = 5;
RMSE_test =zeros(10,NumC);
% 添加噪声 0 sigma1 sigma2 sigma3 sigma4
sigma = [0:1:10]*5e-7;
for j =1:1:NumC
    for i=1:1:length(sigma)
        sigma1 = sigma(i)*randn(size(X));
        
        sigma1(:,1:size(X,2)/2) = 0;
        Xn = X + sigma1;
        [ypre_all,~,yint]=predict(gprMdl,Xn);
        RMSE_test(i,j) = rmse(Y,ypre_all);

    end
    j
end
RMSE_mean = mean(RMSE_test,2);

end