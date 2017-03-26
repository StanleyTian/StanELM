% ²Ü²Ù
clc;
clear;

clc;
clear;
disp('¿ªÊ¼');
[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);


[~, ~, TrainingAccuracy, TestingAccuracy,iw,b] = ELM(t, v, 1, 200, 'sig');
[~, ~, TrainingAccuracy2, TestingAccuracy2,~,~] = elmWithInput(t, v, 1, 200, 'sig',iw,b);

disp('½áÊø');