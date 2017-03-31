% 该函数用来逐个查看stl-10数据的图像，及其对应的uniform lbp特征
% 作者：史丹利复合田
% 日期：2017年03月25日
clc;
clear;
load('./dataSets/ustb-plate9/ustb-plate9-test.mat');
for i=1:1:size(X,1)
    imgData = X(i,:);
    img = array_to_gray_image(imgData,128);
    grayImage = imrotate(img,270);%stl-10的数据需要顺时针旋转90°才为正
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
