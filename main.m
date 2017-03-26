clc;
clear;
disp('开始');
% 1. 准备数据
[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);
% 2. 初始训练 采用随机inputweight和bias
[ trainingAccuracy,validatingAccuracy,inputWeight,bias,isMinimumGap,currentGroupStatus ] = initialTraining(t,v,200,'sig',20);
% 3. 使用初始种子iw和b来进行遗传算法计算
[~, ~, TrainingAccuracy2, TestingAccuracy2,~,~] = elmWithInput(t, v, 1, 200, 'sig',inputWeight,bias);
% total = 20;
% dataForVisual = zeros(total,2);
% for i=1:1:total
% [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,iw,b] = ELM(t, v, 1, 200, 'sig');
% dataForVisual(i,:) = [TrainingAccuracy, TestingAccuracy];
% %drawnow; % 实时显示
% fprintf('已完成: %i/%i\n',i,total);
% end
% plot(dataForVisual);
% legend('训练集准确率','验证集准确率');
% 
% [~,trainIndex] = max(dataForVisual(:,1));
% [~,validIndex] = max(dataForVisual(:,2));
% [~,anotherIndex] = min(abs(dataForVisual(:,1)-dataForVisual(:,2)));
% fprintf('               训练集    验证集\n');
% fprintf('最高训练集准确率: %.2f%% - %.2f%%\n',dataForVisual(trainIndex,1)*100,dataForVisual(trainIndex,2)*100);
% fprintf('最高验证集准确率: %.2f%% - %.2f%%\n',dataForVisual(validIndex,1)*100,dataForVisual(validIndex,2)*100);
% fprintf('最小准确率差距: %.2f%%（%.2f%% - %.2f%%）\n',abs(dataForVisual(anotherIndex,1)-dataForVisual(anotherIndex,2))*100,dataForVisual(anotherIndex,1)*100,dataForVisual(anotherIndex,2)*100);

disp('结束');