clc;
clear;
disp('��ʼ');
[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-all-folds.mat',1);

total = 20;
dataForVisual = zeros(total,2);
for i=1:1:total
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = ELM(t, v, 1, 2000, 'sig');
dataForVisual(i,:) = [TrainingAccuracy, TestingAccuracy];
%drawnow; % ʵʱ��ʾ
fprintf('�����: %i/%i\n',i,total);
end
plot(dataForVisual);
legend('ѵ����׼ȷ��','��֤��׼ȷ��');

[~,trainIndex] = max(dataForVisual(:,1));
[~,validIndex] = max(dataForVisual(:,2));
fprintf('���ѵ����׼ȷ��: %.2f%%- %.2f%%\n',dataForVisual(trainIndex,1)*100,dataForVisual(trainIndex,2)*100);
fprintf('�����֤��׼ȷ��: %.2f%%- %.2f%%\n',dataForVisual(validIndex,1)*100,dataForVisual(validIndex,2)*100);

disp('����');