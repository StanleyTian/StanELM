% 该脚本用来将stl-10的训练数据进行特征提取，并按照其预定的fold划分，分为十个fold存储起来
% 使用的时候，应该取9个fold作为训练集，1个fold作为测试集，即所谓交叉验证
% 作者：史丹利复合田
% 日期：2017年03月25日

clc;clear;disp('开始');
trainingData = load('./dataSets/stl-10/train.mat');
for i=1:1:10
    AllFold{i} = prepare1foldData(trainingData,i);
end
%%保存数据
outputfile = './dataSets/stl-10/train-lbp-origin-all-folds.mat';

save(outputfile,'AllFold');%Sample?Labels ?这里注意，后面的变量名要加单引号

disp('结束');