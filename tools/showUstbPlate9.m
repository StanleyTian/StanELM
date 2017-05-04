% 该函数用来逐个查看ustb-plate9数据的图像，及其对应的uniform lbp特征
% ustb-plate9数据格式：
% 三部分：1.X：一个大矩阵，每一行代表一个已一维化的图像，图像大小为128*128 = 16384
%        2.Y：一个列向量，与X一一对应，每个元素代表类别，用1~9表示，共9类
%        3.class_names：1~9类的类别名
% 作者：史丹利复合田
% 日期：2017年03月25日
clc;
clear;
load('./dataSets/ustb-plate9/ustb-plate9-train.mat');
for i=1:1:size(X,1)
    imgData = X(i,:);
    img = array_to_gray_image(imgData,128);
    grayImage = imrotate(img,270);%数据需要顺时针旋转90°才为正
    %绘图
    figure(2);
    subplot(1,2,1);
    imshow(grayImage);
    title(char(class_names(Y(i,:))));
    uniformLbp = extractLbpFeature(grayImage);
    subplot(1,2,2);
    stem(uniformLbp);%stem 用来绘制针状图
    pause;
end
