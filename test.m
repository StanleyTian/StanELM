% ²Ü²Ù
clc;
clear;

clc;
clear;
disp('¿ªÊ¼');
a=load('./dataSets/test/iwb.mat');
a.bias;
a.inputWeight;
randomTuneInputWeightAndBias(a.inputWeight,a.bias,0.0001);


disp('½áÊø');