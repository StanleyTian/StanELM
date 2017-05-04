clc;
clear;
disp('��ʼ');
% ����������
mutationRate = 0.001;
hiddenNodes = 300;
activationFunction = 'sig';%sig,sin,hardlim,tribas,radbas
% 1. ׼������
%[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);
[t,v]=prepareTrainingDataForUstbPlate9...
    ('./dataSets/ustb-plate9/ustb-plate9-test.mat',...
    './dataSets/ustb-plate9/ustb-plate9-train.mat','originLbp');% ustb-plate9 ʹ�����

% 2. ��ʼѵ�� �������inputweight��bias

[ trainingAccuracy,validatingAccuracy,inputWeight,bias,isMinimumGap,currentGroupStatus ] ...
    = initialTraining(t,v,hiddenNodes,activationFunction,1);
lastValidatingAccuracy = validatingAccuracy;
lastTrainingAccuracy = trainingAccuracy;
history = [trainingAccuracy,validatingAccuracy];
generation = 1;
fprintf('��%i����ѵ������%.2f%% ��֤����%.2f%%\n',generation,trainingAccuracy*100,validatingAccuracy*100);
while validatingAccuracy <= 0.9
% 3. ʹ�ó�ʼ����iw��b�������Ŵ��㷨����
    [ currentTrainingAccuracy,currentValidatingAccuracy,mutatedIw,mutatedBias,isMinimumGap2,currentGroupStatus2 ] ...
        = geneticTraining(t,v,inputWeight,bias,hiddenNodes,activationFunction,20,mutationRate);
    if currentValidatingAccuracy > lastValidatingAccuracy || currentTrainingAccuracy > lastTrainingAccuracy %�µĺ�
        inputWeight = mutatedIw;
        bias = mutatedBias;
        lastValidatingAccuracy = currentValidatingAccuracy;
        lastTrainingAccuracy = currentTrainingAccuracy;
        % ֻ�гɹ���������׼ȷ�ʲ���һ��
        generation = generation + 1;
        history = [history;currentTrainingAccuracy,currentValidatingAccuracy];
        figure(1);plot(history);title('ѵ����ʷ');
        legend('ѵ����׼ȷ��','��֤��׼ȷ��', 'Location','NorthWest');drawnow;
        print(1,'-dpng','train_history.png'); %�����Ϊ3��figure����png��ʽ���棬�ļ���Ϊtest_loss.png
        fprintf('��%i����ѵ������%.2f%% ��֤����%.2f%%\n',generation,currentTrainingAccuracy*100,currentValidatingAccuracy*100);
        fprintf('----------------------\n');
    end
end

disp('����');