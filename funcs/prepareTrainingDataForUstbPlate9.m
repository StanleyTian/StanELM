% 该函数用来将目标的ustb-plate9 带标签的训练数据转换为适用于ELM的数据格式
% filePath: 使用tools/saveAllFolds所产生的数据
% testFoldIndex: 测试集的index（1~10）
% trainingData: 挑选好的训练数据，正常的行数为9000
% validatingData: 挑选好的验证数据，正常的行数为1000，及testFoldIndex所对应的数据
% 
% 作者：史丹利复合田
% 时间：2017年04月10日

function [ t,v ] = prepareTrainingDataForUstbPlate9...
    ( trainingFilePath,testingFilePath,featureType)
    trainingData = load(trainingFilePath);
    testingData = load(testingFilePath);


    if strcmp(featureType,'originLbp')
        trainingFeatureMat = zeros(size(trainingData.X,1),256);%存储特征的矩阵
        for i = 1:1:size(trainingData.X,1)
            imgData = trainingData.X(i,:);
            img = array_to_gray_image(imgData,128);
            grayImage = imrotate(img,270);%ustb-plate9的数据需要顺时针旋转90°才为正
            originLbp = extractLbpFeature(grayImage);
            trainingFeatureMat(i,:) = originLbp;
        end
        trainingFeatureMatWithLabel = [trainingData.Y,trainingFeatureMat];
        
        testingFeatureMat = zeros(size(testingData.X,1),256);%存储特征的矩阵
        for i = 1:1:size(testingData.X,1)
            imgData = testingData.X(i,:);
            img = array_to_gray_image(imgData,128);
            grayImage = imrotate(img,270);%ustb-plate9的数据需要顺时针旋转90°才为正
            originLbp = extractLbpFeature(grayImage);
            testingFeatureMat(i,:) = originLbp;
        end
        testingFeatureMatWithLabel = [testingData.Y,testingFeatureMat];
    end
    t = trainingFeatureMatWithLabel;
    v = testingFeatureMatWithLabel;
end

