clc;
clear;
disp('��ʼ');
load gong
sound(y,Fs)
% ����������
mutationRate = 0.4;
hiddenNodes = 20;
activationFunction = 'sig';%sig,sin,hardlim,tribas,radbas
totalTry = 10000;
haveTried = 0;
iteration = 20;
% 1. ׼������
%[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);
% [t,v]=prepareTrainingDataForUstbPlate9...
%     ('./dataSets/ustb-plate9/ustb-plate9-test.mat',...
%     './dataSets/ustb-plate9/ustb-plate9-train.mat','originLbp');% ustb-plate9 ʹ�����

% ����diabetes����
t = load('./dataSets/diabetes/diabetes_train.txt');
v = load('./dataSets/diabetes/diabetes_test.txt');
% 2. ��ʼѵ�� �������inputweight��bias

[ trainingAccuracy,validatingAccuracy,inputWeight,bias,currentGroupStatus ] ...
    = initialTraining(t,v,hiddenNodes,activationFunction,1);
lastValidatingAccuracy = validatingAccuracy;
lastTrainingAccuracy = trainingAccuracy;
history = [trainingAccuracy,validatingAccuracy];
generation = 1;
fprintf('��%i����ѵ������%.2f%% ��֤����%.2f%%\n',generation,trainingAccuracy*100,validatingAccuracy*100);
mask = zeros(size([inputWeight,bias]));
while validatingAccuracy <= 0.9
% 3. ʹ�ó�ʼ����iw��b�������Ŵ��㷨����
if haveTried >= totalTry
    break;
end
    visualizeMask(mask);
    [ currentTrainingAccuracy,currentValidatingAccuracy,~,~,...
        isMinimumGap2,currentGroupStatus2,mutatedIw4Train,mutatedBias4Train,maskNew ] ...
        = geneticTraining(t,v,inputWeight,bias,hiddenNodes,activationFunction,iteration,mutationRate,mask);
    haveTried = haveTried + iteration;
    if currentTrainingAccuracy > lastTrainingAccuracy %�µĺ�
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
        % ֻ�гɹ���������׼ȷ�ʲ���һ��
        generation = generation + 1;
        history = [history;currentTrainingAccuracy,currentValidatingAccuracy];
        figure(1);plot(history);title('ѵ����ʷ');
        legend('ѵ����׼ȷ��','��֤��׼ȷ��', 'Location','NorthWest');drawnow;
        print(1,'-dpng','train_history.png'); %�����Ϊ3��figure����png��ʽ���棬�ļ���Ϊtest_loss.png
        fprintf('��%i����ѵ������%.2f%% ��֤����%.2f%% have tried %d\n',generation,currentTrainingAccuracy*100,currentValidatingAccuracy*100,haveTried);
        
        fprintf('----------------------\n');
    end
end
fprintf('have tried %d\n',haveTried);

disp('����');
load chirp
sound(y,Fs)