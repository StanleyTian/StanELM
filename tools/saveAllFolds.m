% �ýű�������stl-10��ѵ�����ݽ���������ȡ����������Ԥ����fold���֣���Ϊʮ��fold�洢����
% ʹ�õ�ʱ��Ӧ��ȡ9��fold��Ϊѵ������1��fold��Ϊ���Լ�������ν������֤
% ���ߣ�ʷ����������
% ���ڣ�2017��03��25��

clc;clear;disp('��ʼ');
trainingData = load('./dataSets/stl-10/train.mat');
for i=1:1:10
    AllFold{i} = prepare1foldData(trainingData,i);
end
%%��������
outputfile = './dataSets/stl-10/train-lbp-origin-all-folds.mat';

save(outputfile,'AllFold');%Sample?Labels ?����ע�⣬����ı�����Ҫ�ӵ�����

disp('����');