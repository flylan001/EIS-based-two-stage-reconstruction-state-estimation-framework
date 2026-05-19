load data_mine.mat
%% 电池1 分开计算
index1 = 1201:1300;
X = [real0(index1,1:11),imag0(index1,1:11)];Y = T(index1);RMSE_mean1 = zeros(11,5);
load gprMdl1_battery1.mat
[sigma,RMSE_mean1(:,1)] = GPR_Monte_Carlo(gprMdl1,X,Y);

X = [real0(index1,11:21),imag0(index1,11:21)];Y = T(index1);
load gprMdl2_battery1.mat
[sigma,RMSE_mean1(:,2)] = GPR_Monte_Carlo(gprMdl2,X,Y);

X = [real0(index1,21:31),imag0(index1,21:31)];Y = T(index1);
load gprMdl3_battery1.mat
[sigma,RMSE_mean1(:,3)] = GPR_Monte_Carlo(gprMdl3,X,Y);

X = [real0(index1,31:41),imag0(index1,31:41)];Y = T(index1);
load gprMdl4_battery1.mat
[sigma,RMSE_mean1(:,4)] = GPR_Monte_Carlo(gprMdl4,X,Y);

X = [real0(index1,41:51),imag0(index1,41:51)];Y = T(index1);
load gprMdl5_battery1.mat
[sigma,RMSE_mean1(:,5)] = GPR_Monte_Carlo(gprMdl5,X,Y);
save battery1_gpr.mat sigma RMSE_mean1
%%
load battery1_gpr.mat
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
color=hsv(5);
for i=1:1:5
    plot(sigma* 1000000,RMSE_mean1(:,i),'Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
xlabel('Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:1000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend('10000-1000 Hz','1000-100 Hz','100-10 Hz','10-1 Hz','1-0.1 Hz');
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.5 7.9])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 eis Temp Sensitivity');
print(gcf, save_path,'-dsvg','-r1200');

%% 电池3
index3 = 1301:1400;
X = [real0(index3,1:11),imag0(index3,1:11)];Y = T(index3);RMSE_mean3 = zeros(11,5);
load gprMdl1_battery3.mat
[sigma,RMSE_mean3(:,1)] = GPR_Monte_Carlo(gprMdl1,X,Y);

X = [real0(index3,11:21),imag0(index3,11:21)];Y = T(index3);
load gprMdl2_battery3.mat
[sigma,RMSE_mean3(:,2)] = GPR_Monte_Carlo(gprMdl2,X,Y);

X = [real0(index3,21:31),imag0(index3,21:31)];Y = T(index3);
load gprMdl3_battery3.mat
[sigma,RMSE_mean3(:,3)] = GPR_Monte_Carlo(gprMdl3,X,Y);

X = [real0(index3,31:41),imag0(index3,31:41)];Y = T(index3);
load gprMdl4_battery3.mat
[sigma,RMSE_mean3(:,4)] = GPR_Monte_Carlo(gprMdl4,X,Y);

X = [real0(index3,41:51),imag0(index3,41:51)];Y = T(index3);
load gprMdl5_battery3.mat
[sigma,RMSE_mean3(:,5)] = GPR_Monte_Carlo(gprMdl5,X,Y);
save battery3_gpr.mat sigma RMSE_mean3
%%
load battery3_gpr.mat
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
color=hsv(5);
for i=1:1:5
    plot(sigma* 1000000,RMSE_mean3(:,i),'Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
end
xlabel('Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:1000,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend('10000-1000 Hz','1000-100 Hz','100-10 Hz','10-1 Hz','1-0.1 Hz');
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',1,'box','off');
leg.ItemTokenSize=[60,18];  %
axis([-0.5 5.5 -0.5 7.9])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP3 eis Temp Sensitivity');
print(gcf, save_path,'-dsvg','-r1200');

%%%%%%%%%%%%%%%%%%%%%%%%% 从频率角度出发计算 %%%%%%%%%%%%%%%%%%%%%%%%
%% 电池 合一块 计算
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,length(temp));color=hsv(length(temp)+3);plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ['LFP1'];
leg{2} = ['LFP2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,1:11),imag0(index1,1:11)];Y = T(index1);
    load gprMdl1_battery1.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl1,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
end
RMSE.battery1.RMSE1 = RMSE_mean1;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,1:11),imag0(index1,1:11)];Y = T(index1);
    load gprMdl1_battery3.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl1,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-.','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    % plo_all = [plo_all,plo];
    % leg{length(temp)+i} =  ['LFP2-',num2str(temp(i)),' \circC'];
end
RMSE.battery3.RMSE1 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP eis temp senseitivity 1');
print(gcf, save_path,'-dsvg','-r1200');


%%
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,length(temp));color=hsv(length(temp)+3);plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ['LFP1'];
leg{2} = ['LFP2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,11:21),imag0(index1,11:21)];Y = T(index1);
    load gprMdl2_battery1.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl2,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
end
RMSE.battery1.RMSE2 = RMSE_mean1;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,11:21),imag0(index1,11:21)];Y = T(index1);
    load gprMdl2_battery3.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl2,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-.','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    % plo_all = [plo_all,plo];
    % leg{length(temp)+i} =  ['LFP2-',num2str(temp(i)),' \circC'];
end
RMSE.battery3.RMSE2 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP eis temp senseitivity 2');
print(gcf, save_path,'-dsvg','-r1200');
%%
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,length(temp));color=hsv(length(temp)+3);plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ['LFP1'];
leg{2} = ['LFP2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,21:31),imag0(index1,21:31)];Y = T(index1);
    load gprMdl3_battery1.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl3,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
end
RMSE.battery1.RMSE3 = RMSE_mean1;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,21:31),imag0(index1,21:31)];Y = T(index1);
    load gprMdl3_battery3.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl3,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-.','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    % plo_all = [plo_all,plo];
    % leg{length(temp)+i} =  ['LFP2-',num2str(temp(i)),' \circC'];
end
RMSE.battery3.RMSE3 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP eis temp senseitivity 3');
print(gcf, save_path,'-dsvg','-r1200');

%%
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,length(temp));color=hsv(length(temp)+3);plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ['LFP1'];
leg{2} = ['LFP2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,31:41),imag0(index1,31:41)];Y = T(index1);
    load gprMdl4_battery1.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl4,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
end
RMSE.battery1.RMSE4 = RMSE_mean1;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,31:41),imag0(index1,31:41)];Y = T(index1);
    load gprMdl4_battery3.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl4,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-.','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    % plo_all = [plo_all,plo];
    % leg{length(temp)+i} =  ['LFP2-',num2str(temp(i)),' \circC'];
end
RMSE.battery3.RMSE4 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP eis temp senseitivity 4');
print(gcf, save_path,'-dsvg','-r1200');

%%
figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
temp = 21:2 :45; RMSE_mean1 = zeros(11,length(temp));color=hsv(length(temp)+3);plo_all = [];leg =[];
plo = plot([-10,-9],[-10,-9],'-k','LineWidth',3,'MarkerSize',12);hold on;plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-.k','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
plo = plot([-10,-9],[-10,-9],'-w','LineWidth',3,'MarkerSize',12);plo_all = [plo_all,plo];
leg{1} = ['LFP1'];
leg{2} = ['LFP2'];
leg{3} = [' '];
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 ;
    X = [real0(index1,41:51),imag0(index1,41:51)];Y = T(index1);
    load gprMdl5_battery1.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl5,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
    leg{3+i} = [num2str(temp(i)),' \circC '];
end
RMSE.battery1.RMSE5 = RMSE_mean1;
for i=1:1:length(temp)
    index1 = [1:100] + (i-1) * 100 + 1300;
    X = [real0(index1,41:51),imag0(index1,41:51)];Y = T(index1);
    load gprMdl5_battery3.mat
    [sigma,RMSE_mean1(:,i)] = GPR_Monte_Carlo(gprMdl5,X,Y);
    plo = plot(sigma* 1000000,RMSE_mean1(:,i),'-.','Color',color(end-2-i,:),'LineWidth',3,'MarkerSize',12);hold on
    % plo_all = [plo_all,plo];
    % leg{length(temp)+i} =  ['LFP2-',num2str(temp(i)),' \circC'];
end
RMSE.battery3.RMSE5 = RMSE_mean1;
xlabel('Additional Noise of EIS \rm(\mu\Omega)'); ylabel('RMSE of Temperature (\circC)'); 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:1:1000,'ytick',-0:2:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,leg);
set(leg,'Location','Northwest','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([-0.5 5.5 -0.1 6.5])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP eis temp senseitivity 5');
print(gcf, save_path,'-dsvg','-r1200');
save rmse_noise.mat RMSE sigma
%% 评价曲线 %%%%电池1
load rmse_noise.mat
Temp_error_per_noisy = zeros(5,13);plo_all = [];leg =[];
color=cool(6);
for i =1:1:5
    RMSE_Gpr = RMSE.battery1.(['RMSE',num2str(i)]);
    for j = 1:1:13
        x = sigma(3:end)*1e6;
        y = RMSE_Gpr(3:end,j);
        p = polyfit(x, y, 1);
        Temp_error_per_noisy(i,j) = p(1);
    end
end

figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
for i =1:1:5
    plo = plot(temp,Temp_error_per_noisy(i,:),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
end
xlabel('Temperature (\circC)'); 
ylabel('$dT/dN\ (\mathrm{^\circ C/\mu\Omega})$', 'Interpreter', 'latex');ytickformat('%.1f')

 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,'10000-1000 Hz','1000-100 Hz','100-100 Hz','10-1 Hz','1-0.1 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([20 46 -0.05 1.99])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP1 eis temp senseitivity freq');
print(gcf, save_path,'-dsvg','-r1200');

%%%%电池3
Temp_error_per_noisy = zeros(5,13);plo_all = [];leg =[];
color=cool(6);
for i =1:1:5
    RMSE_Gpr = RMSE.battery3.(['RMSE',num2str(i)]);
    for j = 1:1:13
        x = sigma(3:end)*1e6;
        y = RMSE_Gpr(3:end,j);
        p = polyfit(x, y, 1);
        Temp_error_per_noisy(i,j) = p(1);
    end
end

figure,
set(gcf, 'Position',[0 0 800 800],'Color','White');
for i =1:1:5
    plo = plot(temp,Temp_error_per_noisy(i,:),'-','Color',color(i,:),'LineWidth',3,'MarkerSize',12);hold on
    plo_all = [plo_all,plo];
end
xlabel('Temperature (\circC)'); 
ylabel('$dT/dN\ (\mathrm{^\circ C/\mu\Omega})$', 'Interpreter', 'latex');ytickformat('%.1f')

 
set (gca,'LineWidth',3,'position',[0.18,0.18,0.8,0.8]);
set(gca,'xtick',-100:5:1000,'ytick',-0:0.5:8,'FontSize',32,'LabelFontSizeMultiplier',1.2,'FontName','Times New Roman');
leg=legend(plo_all,'10000-1000 Hz','1000-100 Hz','100-100 Hz','10-1 Hz','1-0.1 Hz');
set(leg,'Location','North','FontSize',24,'FontName','Times New Roman','Orientation','v','NumColumns',2,'box','off');
leg.ItemTokenSize=[45,18];  %
axis([20 46 -0.05 1.99])
gca=boxoff(gca);clear gca
save_path=strcat('GPR_figure','\','LFP3 eis temp senseitivity freq');
print(gcf, save_path,'-dsvg','-r1200');







%%% 蒙特卡洛算法 
function [sigma,RMSE_mean] = GPR_Monte_Carlo(gprMdl,X,Y)
NumC = 50;
RMSE_test =zeros(10,NumC);
% 添加噪声 0 sigma1 sigma2 sigma3 sigma4
sigma = [0:1:10]*5e-7;
for j =1:1:NumC
    for i=1:1:length(sigma)
        sigma1 = sigma(i)*randn(size(X));
        Xn = X + sigma1;
        [ypre_all,~,yint]=predict(gprMdl,Xn);
        RMSE_test(i,j) = rmse(Y,ypre_all);

    end
    j
end
RMSE_mean = mean(RMSE_test,2);

end