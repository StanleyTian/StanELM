clc;
clear;
disp('��ʼ');
% 1. ׼������
[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);
% 2. ��ʼѵ�� �������inputweight��bias
[ trainingAccuracy,validatingAccuracy,inputWeight,bias,isMinimumGap,currentGroupStatus ] = initialTraining(t,v,200,'sig',20);
% 3. ʹ�ó�ʼ����iw��b�������Ŵ��㷨����
[~, ~, TrainingAccuracy2, TestingAccuracy2,~,~] = elmWithInput(t, v, 1, 200, 'sig',inputWeight,bias);
% total = 20;
% dataForVisual = zeros(total,2);
% for i=1:1:total
% [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,iw,b] = ELM(t, v, 1, 200, 'sig');
% dataForVisual(i,:) = [TrainingAccuracy, TestingAccuracy];
% %drawnow; % ʵʱ��ʾ
% fprintf('�����: %i/%i\n',i,total);
% end
% plot(dataForVisual);
% legend('ѵ����׼ȷ��','��֤��׼ȷ��');
% 
% [~,trainIndex] = max(dataForVisual(:,1));
% [~,validIndex] = max(dataForVisual(:,2));
% [~,anotherIndex] = min(abs(dataForVisual(:,1)-dataForVisual(:,2)));
% fprintf('               ѵ����    ��֤��\n');
% fprintf('���ѵ����׼ȷ��: %.2f%% - %.2f%%\n',dataForVisual(trainIndex,1)*100,dataForVisual(trainIndex,2)*100);
% fprintf('�����֤��׼ȷ��: %.2f%% - %.2f%%\n',dataForVisual(validIndex,1)*100,dataForVisual(validIndex,2)*100);
% fprintf('��С׼ȷ�ʲ��: %.2f%%��%.2f%% - %.2f%%��\n',abs(dataForVisual(anotherIndex,1)-dataForVisual(anotherIndex,2))*100,dataForVisual(anotherIndex,1)*100,dataForVisual(anotherIndex,2)*100);

disp('����');