% �ܲ�
clc;
clear;

clc;
clear;
disp('��ʼ');
a=load('./dataSets/test/iwb.mat');
a.bias;
a.inputWeight;
randomTuneInputWeightAndBias(a.inputWeight,a.bias,0.0001);


disp('����');