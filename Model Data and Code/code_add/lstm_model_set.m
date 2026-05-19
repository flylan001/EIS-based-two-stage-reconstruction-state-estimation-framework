function [layers,options] = lstm_model_set(numFeatures,numHiddenUnits,numResponses,XVal,YVal)
% numFeatures 输入特征数（电流+电压）
% numHiddenUnits LSTM隐藏单元
% numResponses 输出维度（实部+虚部）

layers = [
    sequenceInputLayer(numFeatures, 'Name','input')

    % 第一层 LSTM
    lstmLayer(numHiddenUnits, 'OutputMode','last', 'Name','lstm1')
    % dropoutLayer(0.2, 'Name','drop1')

    % 隐藏全连接层（提取特征）
    fullyConnectedLayer(128, 'Name','fc1')
    reluLayer('Name','relu1')
    % dropoutLayer(0.2, 'Name','drop2')

    % 输出层
    fullyConnectedLayer(numResponses, 'Name','fc_out')

    regressionLayer('Name','regression')
];


options = trainingOptions('adam', ...
    'MaxEpochs',500, ...
    'MiniBatchSize',256, ...
    'Shuffle','every-epoch', ...
    'ValidationData',{XVal, YVal}, ...   % ✅ 验证集
    'ValidationFrequency',20, ...        % 每20次迭代验证一次
    'Plots','training-progress', ...
    'ExecutionEnvironment','gpu', ...
    'InitialLearnRate',1e-3, ...
    'Verbose',false, ...
    'OutputNetwork','best-validation-loss');

end