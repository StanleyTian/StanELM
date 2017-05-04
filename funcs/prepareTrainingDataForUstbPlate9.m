% �ú���������Ŀ���ustb-plate9 ����ǩ��ѵ������ת��Ϊ������ELM�����ݸ�ʽ
% filePath: ʹ��tools/saveAllFolds������������
% testFoldIndex: ���Լ���index��1~10��
% trainingData: ��ѡ�õ�ѵ�����ݣ�����������Ϊ9000
% validatingData: ��ѡ�õ���֤���ݣ�����������Ϊ1000����testFoldIndex����Ӧ������
% 
% ���ߣ�ʷ����������
% ʱ�䣺2017��04��10��

function [ t,v ] = prepareTrainingDataForUstbPlate9...
    ( trainingFilePath,testingFilePath,featureType)
    trainingData = load(trainingFilePath);
    testingData = load(testingFilePath);


    if strcmp(featureType,'originLbp')
        trainingFeatureMat = zeros(size(trainingData.X,1),256);%�洢�����ľ���
        for i = 1:1:size(trainingData.X,1)
            imgData = trainingData.X(i,:);
            img = array_to_gray_image(imgData,128);
            grayImage = imrotate(img,270);%ustb-plate9��������Ҫ˳ʱ����ת90���Ϊ��
            originLbp = extractLbpFeature(grayImage);
            trainingFeatureMat(i,:) = originLbp;
        end
        trainingFeatureMatWithLabel = [trainingData.Y,trainingFeatureMat];
        
        testingFeatureMat = zeros(size(testingData.X,1),256);%�洢�����ľ���
        for i = 1:1:size(testingData.X,1)
            imgData = testingData.X(i,:);
            img = array_to_gray_image(imgData,128);
            grayImage = imrotate(img,270);%ustb-plate9��������Ҫ˳ʱ����ת90���Ϊ��
            originLbp = extractLbpFeature(grayImage);
            testingFeatureMat(i,:) = originLbp;
        end
        testingFeatureMatWithLabel = [testingData.Y,testingFeatureMat];
    end
    t = trainingFeatureMatWithLabel;
    v = testingFeatureMatWithLabel;
end

