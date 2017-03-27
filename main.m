clc;
clear;
disp('开始');
% 1. 准备数据
[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);
% 2. 初始训练 采用随机inputweight和bias

[ trainingAccuracy,validatingAccuracy,inputWeight,bias,isMinimumGap,currentGroupStatus ] ...
    = initialTraining(t,v,200,'sig',20);
lastValidatingAccuracy = validatingAccuracy;
history = [trainingAccuracy,validatingAccuracy];
generation = 1;
fprintf('第%i代：训练集：%.2f%% 验证集：%.2f%%\n',generation,trainingAccuracy*100,validatingAccuracy*100);
while validatingAccuracy <= 0.9
% 3. 使用初始种子iw和b来进行遗传算法计算
    [ currentTrainingAccuracy,currentValidatingAccuracy,mutatedIw,mutatedBias,isMinimumGap2,currentGroupStatus2 ] ...
        = geneticTraining(t,v,inputWeight,bias,200,'sig',20);
    if currentValidatingAccuracy > lastValidatingAccuracy %新的好
        inputWeight = mutatedIw;
        bias = mutatedBias;
        lastValidatingAccuracy = currentValidatingAccuracy;
        % 只有成功的提升了准确率才算一代
        generation = generation + 1;
        history = [history;currentTrainingAccuracy,currentValidatingAccuracy];
        figure;plot(history);title('训练历史');
        legend('训练集准确率','验证集准确率');drawnow;
        fprintf('第%i代：训练集：%.2f%% 验证集：%.2f%%\n',generation,currentTrainingAccuracy*100,currentValidatingAccuracy*100);
        fprintf('----------------------\n');
    end

end

disp('结束');