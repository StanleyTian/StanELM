clc;
clear;
disp('开始');
% 参数设置区
mutationRate = 0.001;
hiddenNodes = 200;
% 1. 准备数据
[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',100);
% 2. 初始训练 采用随机inputweight和bias

[ trainingAccuracy,validatingAccuracy,inputWeight,bias,isMinimumGap,currentGroupStatus ] ...
    = initialTraining(t,v,hiddenNodes,'sig',1);
lastValidatingAccuracy = validatingAccuracy;
lastTrainingAccuracy = trainingAccuracy;
history = [trainingAccuracy,validatingAccuracy];
generation = 1;
fprintf('第%i代：训练集：%.2f%% 验证集：%.2f%%\n',generation,trainingAccuracy*100,validatingAccuracy*100);
while validatingAccuracy <= 0.9
% 3. 使用初始种子iw和b来进行遗传算法计算
    [ currentTrainingAccuracy,currentValidatingAccuracy,mutatedIw,mutatedBias,isMinimumGap2,currentGroupStatus2 ] ...
        = geneticTraining(t,v,inputWeight,bias,hiddenNodes,'sig',20,mutationRate);
    if currentValidatingAccuracy > lastValidatingAccuracy %|| currentTrainingAccuracy > lastTrainingAccuracy %新的好
        inputWeight = mutatedIw;
        bias = mutatedBias;
        lastValidatingAccuracy = currentValidatingAccuracy;
        lastTrainingAccuracy = currentTrainingAccuracy;
        % 只有成功的提升了准确率才算一代
        generation = generation + 1;
        history = [history;currentTrainingAccuracy,currentValidatingAccuracy];
        figure(1);plot(history);title('训练历史');
        legend('训练集准确率','验证集准确率', 'Location','NorthWest');drawnow;
        print(1,'-dpng','train_history.png'); %将句柄为3的figure，以png格式保存，文件名为test_loss.png
        fprintf('第%i代：训练集：%.2f%% 验证集：%.2f%%\n',generation,currentTrainingAccuracy*100,currentValidatingAccuracy*100);
        fprintf('----------------------\n');
    end
end

disp('结束');