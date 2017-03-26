clc;
clear;
disp('开始');
[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-all-folds.mat',1);

total = 20;
dataForVisual = zeros(total,2);
for i=1:1:total
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = ELM(t, v, 1, 2000, 'sig');
dataForVisual(i,:) = [TrainingAccuracy, TestingAccuracy];
%drawnow; % 实时显示
fprintf('已完成: %i/%i\n',i,total);
end
plot(dataForVisual);
legend('训练集准确率','验证集准确率');

[~,trainIndex] = max(dataForVisual(:,1));
[~,validIndex] = max(dataForVisual(:,2));
fprintf('最高训练集准确率: %.2f%%- %.2f%%\n',dataForVisual(trainIndex,1)*100,dataForVisual(trainIndex,2)*100);
fprintf('最高验证集准确率: %.2f%%- %.2f%%\n',dataForVisual(validIndex,1)*100,dataForVisual(validIndex,2)*100);

disp('结束');