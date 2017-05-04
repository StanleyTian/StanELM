% ��ʼ��elmѵ������������֤����ȷ����ߵ�inputWeight��bias
% ���룺
% trainingData��validatingData��ѵ���Ͳ������ݣ�ʹ��prepareTrainingData��������
% neuronCount������ڵ������������ֱ���<ѵ��������
% activationMethod�����������'sig'������μ�ELM.m
% iteration ������ѵ���������� 20
% �����
% trainingAccuracy,validatingAccuracy��ѵ����׼ȷ������������׼ȷ������
% inputWeight�������������Ȩ��
% bias���������ƫ�� inputWeight��bias����ֱ������elmWithInputʹ��
% isMinimumGap����ǰ�������Ƿ��ǵ�ǰ����ѵ������gap��С�ģ���ѵ��׼ȷ�ʺ���֤׼ȷ�ʵĲ�ľ���ֵ��С��������
% currentGroupStatus����ǰ����������ݣ���ά����iteration*2��ÿһ�е�һ��������trainingAccuracy���ڶ���ֵ��validatingAccuracy
% ���ߣ�ʷ����������
% ʱ�䣺2017��03��26��

function [ trainingAccuracy,validatingAccuracy,inputWeight,bias,currentGroupStatus ] ...
    = initialTraining( trainingData,validatingData,neuronCount,activationMethod,iteration )

dataForVisual = zeros(iteration,2);
allInputWeightAndBias = cell(iteration,2);
for i=1:1:iteration
[~, ~, TrainingAccuracy, TestingAccuracy,iw,b] ...
    = ELM(trainingData, validatingData, 1, neuronCount, activationMethod);
dataForVisual(i,:) = [TrainingAccuracy, TestingAccuracy];
allInputWeightAndBias{i,1} = iw;
allInputWeightAndBias{i,2} = b;

%drawnow; % ʵʱ��ʾ
%fprintf('�����: %i/%i\n',i,iteration);
end
currentGroupStatus = dataForVisual;

[~,trainIndex] = max(dataForVisual(:,1));
fprintf('ԭʼ����\n');
fprintf('               ѵ����    ��֤��\n');
fprintf('���ѵ����׼ȷ��: %.2f%% - %.2f%%\n',dataForVisual(trainIndex,1)*100,dataForVisual(trainIndex,2)*100);

trainingAccuracy = dataForVisual(trainIndex,1);
validatingAccuracy = dataForVisual(trainIndex,2);
% ������Ż���ѵ��������
inputWeight = allInputWeightAndBias{trainIndex,1};
bias = allInputWeightAndBias{trainIndex,2};

end

