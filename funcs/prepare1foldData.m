% 给stl-10数据按照指定fold提取数据特征，foldIndex的范围 1~10
% trainingData为 stl-10的train数据。eg：trainingData = load('./dataSets/stl-10/train.mat');
% 作者：史丹利复合田
% 日期：2017年03月25日
function [ featureMatWithLabel ] = prepare1foldData( trainingData,foldIndex)
    % 提取lbp特征
    fold.X = trainingData.X(trainingData.fold_indices{foldIndex},:);
    fold.y = trainingData.y(trainingData.fold_indices{foldIndex});
    featureMat = zeros(size(fold.X,1),59);%存储特征的矩阵

    for i=1:1:size(fold.X,1)
        imgData = fold.X(i,:);
        img = array_to_color_image(imgData,96,96);
        colorImage = imrotate(img,270);%stl-10的数据需要顺时针旋转90°才为正
        grayImage = rgb2gray(colorImage);
        uniformLbp = extractLbpFeature(grayImage);
        featureMat(i,:) = uniformLbp;
        %subplot(1,2,1);imshow(grayImage);title(fold.y(i));
        %pause;
    end
    featureMatWithLabel = [fold.y,featureMat];

end

