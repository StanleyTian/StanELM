% 该函数用来逐个查看stl-10数据的图像，及其对应的uniform lbp特征
% 作者：史丹利复合田
% 日期：2017年03月25日
clc;
clear;
load('./dataSets/test/stl-10.mat');
for i=1:1:size(X,1)
    imgData = X(i,:);
    img = array_to_color_image(imgData,96,96);
    colorImage = imrotate(img,270);%stl-10的数据需要顺时针旋转90°才为正
    %绘图
    subplot(1,3,1);
    imshow(colorImage);

    grayImage = rgb2gray(colorImage);
    subplot(1,3,2);
    imshow(grayImage);

    uniformLbp = extractLbpFeature(grayImage);
    subplot(1,3,3);
    stem(uniformLbp);%stem 用来绘制针状图
    pause;
end
