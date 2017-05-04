clc;
clear;
disp('开始');
load gong
sound(y,Fs)
% 参数设置区
mutationRate = 0.4;
hiddenNodes = 20;
activationFunction = 'sig';%sig,sin,hardlim,tribas,radbas
totalTry = 10000;
haveTried = 0;
iteration = 20;
% 1. 准备数据
%[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);
% [t,v]=prepareTrainingDataForUstbPlate9...
%     ('./dataSets/ustb-plate9/ustb-plate9-test.mat',...
%     './dataSets/ustb-plate9/ustb-plate9-train.mat','originLbp');% ustb-plate9 使用这个

% 载入diabetes数据
t = load('./dataSets/diabetes/diabetes_train.txt');
v = load('./dataSets/diabetes/diabetes_test.txt');
% 2. 初始训练 采用随机inputweight和bias

[ trainingAccuracy,validatingAccuracy,inputWeight,bias,currentGroupStatus ] ...
    = initialTraining(t,v,hiddenNodes,activationFunction,1);
lastValidatingAccuracy = validatingAccuracy;
lastTrainingAccuracy = trainingAccuracy;
history = [trainingAccuracy,validatingAccuracy];
generation = 1;
fprintf('第%i代：训练集：%.2f%% 验证集：%.2f%%\n',generation,trainingAccuracy*100,validatingAccuracy*100);
mask = zeros(size([inputWeight,bias]));
while validatingAccuracy <= 0.9
% 3. 使用初始种子iw和b来进行遗传算法计算
if haveTried >= totalTry
    break;
end
    visualizeMask(mask);
    [ currentTrainingAccuracy,currentValidatingAccuracy,~,~,...
        isMinimumGap2,currentGroupStatus2,mutatedIw4Train,mutatedBias4Train,maskNew ] ...
        = geneticTraining(t,v,inputWeight,bias,hiddenNodes,activationFunction,iteration,mutationRate,mask);
    haveTried = haveTried + iteration;
    if currentTrainingAccuracy > lastTrainingAccuracy %新的好
        mask = maskNew;
%         if currentValidatingAccuracy > lastValidatingAccuracy
%             inputWeight = mutatedIw;
%             bias = mutatedBias;
%         else
            inputWeight = mutatedIw4Train;
            bias = mutatedBias4Train;
%         end
        
        lastValidatingAccuracy = currentValidatingAccuracy;
        lastTrainingAccuracy = currentTrainingAccuracy;
        % 只有成功的提升了准确率才算一代
        generation = generation + 1;
        history = [history;currentTrainingAccuracy,currentValidatingAccuracy];
        figure(1);plot(history);title('训练历史');
        legend('训练集准确率','验证集准确率', 'Location','NorthWest');drawnow;
        print(1,'-dpng','train_history.png'); %将句柄为3的figure，以png格式保存，文件名为test_loss.png
        fprintf('第%i代：训练集：%.2f%% 验证集：%.2f%% have tried %d\n',generation,currentTrainingAccuracy*100,currentValidatingAccuracy*100,haveTried);
        
        fprintf('----------------------\n');
    end
end
fprintf('have tried %d\n',haveTried);

disp('结束');
load chirp
sound(y,Fs)