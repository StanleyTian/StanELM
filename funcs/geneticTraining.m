% ��ʼ��elmѵ������������֤����ȷ����ߵ�inputWeight��bias
% ���룺
% trainingData��validatingData��ѵ���Ͳ������ݣ�ʹ��prepareTrainingData��������
% neuronCount������ڵ������������ֱ���<ѵ��������
% activationMethod�����������'sig'������μ�ELM.m
% iteration ������ѵ���������� 20
% �����
% trainingAccuracy,validatingAccuracy����֤׼ȷ������������׼ȷ������
% inputWeight�������������Ȩ��
% bias���������ƫ�� inputWeight��bias����ֱ������elmWithInputʹ��
% isMinimumGap����ǰ�������Ƿ��ǵ�ǰ����ѵ������gap��С�ģ���ѵ��׼ȷ�ʺ���֤׼ȷ�ʵĲ�ľ���ֵ��С��
% currentGroupStatus����ǰ����������ݣ���ά����iteration*2��ÿһ�е�һ��������trainingAccuracy���ڶ���ֵ��validatingAccuracy
% ���ߣ�ʷ����������
% ʱ�䣺2017��03��26��

function [ trainingAccuracy,validatingAccuracy,inputWeight,bias,isMinimumGap,currentGroupStatus ] ...
    = geneticTraining( trainingData,validatingData,iwOrigin,bOrigin,neuronCount,activationMethod,iteration )

    dataForVisual = zeros(iteration,2);
    allInputWeightAndBias = cell(iteration,2);
    for i=1:1:iteration
        % ִ�б������
        [iwNew,bNew] = randomTuneInputWeightAndBias(iwOrigin,bOrigin,0.01);
        [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,iw,b]...
            = elmWithInput(trainingData,validatingData,1,neuronCount,activationMethod,iwNew,bNew);
        dataForVisual(i,:) = [TrainingAccuracy, TestingAccuracy];
        allInputWeightAndBias{i,1} = iw;
        allInputWeightAndBias{i,2} = b;

        %drawnow; % ʵʱ��ʾ
        %fprintf('�����: %i/%i\n',i,iteration);
    end
    
    currentGroupStatus = dataForVisual;
    %figure;plot(dataForVisual);title('��ǰ������');drawnow;
    legend('ѵ����׼ȷ��','��֤��׼ȷ��');

    [~,trainIndex] = max(dataForVisual(:,1));
    [~,validIndex] = max(dataForVisual(:,2));
    [~,anotherIndex] = min(abs(dataForVisual(:,1)-dataForVisual(:,2)));
    fprintf('               ѵ����    ��֤��\n');
    fprintf('���ѵ����׼ȷ��: %.2f%% - %.2f%%\n',dataForVisual(trainIndex,1)*100,dataForVisual(trainIndex,2)*100);
    fprintf('�����֤��׼ȷ��: %.2f%% - %.2f%%\n',dataForVisual(validIndex,1)*100,dataForVisual(validIndex,2)*100);
    fprintf('��С׼ȷ�ʲ��: %.2f%%��%.2f%% - %.2f%%��\n',abs(dataForVisual(anotherIndex,1)-dataForVisual(anotherIndex,2))*100,dataForVisual(anotherIndex,1)*100,dataForVisual(anotherIndex,2)*100);
    
    trainingAccuracy = dataForVisual(validIndex,1);
    validatingAccuracy = dataForVisual(validIndex,2);
    inputWeight = allInputWeightAndBias{validIndex,1};
    bias = allInputWeightAndBias{validIndex,2};
    if validIndex == anotherIndex
        isMinimumGap = 1;%true
    else
        isMinimumGap = 0;%false
    end
end

