clc;clear;close all;
addpath("..\../code_add")
%% 降采样频率设置为 100Hz
Fn = 100;
[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std] = lstm_data_set_no_onehot(Fn,1:51);
[layers,options] = lstm_model_set(2,128,2*N_EIS,XVal,YVal);
gpuDevice(1)
[net, trainInfo] = trainNetwork(XTrain,YTrain,layers,options);
save(['lstm_ui2eis_battery_',num2str(Fn),'.mat'], 'net', 'trainInfo' );
%% 降采样频率设置为 100Hz
Fn = 50;
[XTrain,YTrain,XVal,YVal,XTest,YTest,N_EIS,eis_mean_std] = lstm_data_set_no_onehot(Fn,11:41);
[layers,options] = lstm_model_set(2,128,2*N_EIS,XVal,YVal);
gpuDevice(1)
[net, trainInfo] = trainNetwork(XTrain,YTrain,layers,options);
save(['lstm_ui2eis_battery_',num2str(Fn),'.mat'], 'net', 'trainInfo' );



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