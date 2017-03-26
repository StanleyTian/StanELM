% 初始化elm训练，并调出验证集正确率最高的inputWeight和bias
% 输入：
% trainingData，validatingData：训练和测试数据，使用prepareTrainingData函数生成
% neuronCount：隐层节点数量，该数字必须<训练样本数
% activationMethod：激活函数，如'sig'，具体参见ELM.m
% iteration ：反复训练次数，如 20
% 输出：
% trainingAccuracy,validatingAccuracy：验证准确率最高组的两个准确率数据
% inputWeight：最优组的输入权重
% bias：最优组的偏置 inputWeight和bias可以直接塞给elmWithInput使用
% isMinimumGap：当前最优组是否是当前所有训练里面gap最小的（即训练准确率和验证准确率的差的绝对值最小）
% currentGroupStatus：当前所有组的数据，二维矩阵：iteration*2，每一行第一个数据是trainingAccuracy，第二个值是validatingAccuracy
% 作者：史丹利复合田
% 时间：2017年03月26日

function [ trainingAccuracy,validatingAccuracy,inputWeight,bias,isMinimumGap,currentGroupStatus ] = geneticTraining( trainingData,validatingData,iw2,b2,neuronCount,activationMethod,iteration )

dataForVisual = zeros(iteration,2);
allInputWeightAndBias = cell(iteration,2);
for i=1:1:iteration
% 此处为更改iw2和b2的函数
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,iw,b] = elmWithInput(trainingData,validatingData,neuronCount,activationMethod,iw2,b2);
dataForVisual(i,:) = [TrainingAccuracy, TestingAccuracy];
allInputWeightAndBias{i,1} = iw;
allInputWeightAndBias{i,2} = b;

%drawnow; % 实时显示
fprintf('已完成: %i/%i\n',i,iteration);
end
currentGroupStatus = dataForVisual;
plot(dataForVisual);title('初始化数据');
legend('训练集准确率','验证集准确率');

[~,trainIndex] = max(dataForVisual(:,1));
[~,validIndex] = max(dataForVisual(:,2));
[~,anotherIndex] = min(abs(dataForVisual(:,1)-dataForVisual(:,2)));
fprintf('               训练集    验证集\n');
fprintf('最高训练集准确率: %.2f%% - %.2f%%\n',dataForVisual(trainIndex,1)*100,dataForVisual(trainIndex,2)*100);
fprintf('最高验证集准确率: %.2f%% - %.2f%%\n',dataForVisual(validIndex,1)*100,dataForVisual(validIndex,2)*100);
fprintf('最小准确率差距: %.2f%%（%.2f%% - %.2f%%）\n',abs(dataForVisual(anotherIndex,1)-dataForVisual(anotherIndex,2))*100,dataForVisual(anotherIndex,1)*100,dataForVisual(anotherIndex,2)*100);
trainingAccuracy = dataForVisual(validIndex,1)*100;
validatingAccuracy = dataForVisual(validIndex,2)*100;
inputWeight = allInputWeightAndBias{validIndex,1};
bias = allInputWeightAndBias{validIndex,2};
if validIndex == anotherIndex
    isMinimumGap = 1;%true
else
    isMinimumGap = 0;%false
end
end

