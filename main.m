clc;
clear;
disp('��ʼ');
% 1. ׼������
[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);
% 2. ��ʼѵ�� �������inputweight��bias

[ trainingAccuracy,validatingAccuracy,inputWeight,bias,isMinimumGap,currentGroupStatus ] ...
    = initialTraining(t,v,200,'sig',20);
lastValidatingAccuracy = validatingAccuracy;
history = [trainingAccuracy,validatingAccuracy];
generation = 1;
fprintf('��%i����ѵ������%.2f%% ��֤����%.2f%%\n',generation,trainingAccuracy*100,validatingAccuracy*100);
while validatingAccuracy <= 0.9
% 3. ʹ�ó�ʼ����iw��b�������Ŵ��㷨����
    [ currentTrainingAccuracy,currentValidatingAccuracy,mutatedIw,mutatedBias,isMinimumGap2,currentGroupStatus2 ] ...
        = geneticTraining(t,v,inputWeight,bias,200,'sig',20);
    if currentValidatingAccuracy > lastValidatingAccuracy %�µĺ�
        inputWeight = mutatedIw;
        bias = mutatedBias;
        lastValidatingAccuracy = currentValidatingAccuracy;
        % ֻ�гɹ���������׼ȷ�ʲ���һ��
        generation = generation + 1;
        history = [history;currentTrainingAccuracy,currentValidatingAccuracy];
        figure;plot(history);title('ѵ����ʷ');
        legend('ѵ����׼ȷ��','��֤��׼ȷ��');drawnow;
        fprintf('��%i����ѵ������%.2f%% ��֤����%.2f%%\n',generation,currentTrainingAccuracy*100,currentValidatingAccuracy*100);
        fprintf('----------------------\n');
    end

end

disp('����');