% ��stl-10���ݰ���ָ��fold��ȡ����������foldIndex�ķ�Χ 1~10
% trainingDataΪ stl-10��train���ݡ�eg��trainingData = load('./dataSets/stl-10/train.mat');
% ���ߣ�ʷ����������
% ���ڣ�2017��03��25��
function [ featureMatWithLabel ] = prepare1foldData( trainingData,foldIndex)
    % ��ȡlbp����
    fold.X = trainingData.X(trainingData.fold_indices{foldIndex},:);
    fold.y = trainingData.y(trainingData.fold_indices{foldIndex});
    featureMat = zeros(size(fold.X,1),59);%�洢�����ľ���

    for i=1:1:size(fold.X,1)
        imgData = fold.X(i,:);
        img = array_to_color_image(imgData,96,96);
        colorImage = imrotate(img,270);%stl-10��������Ҫ˳ʱ����ת90���Ϊ��
        grayImage = rgb2gray(colorImage);
        uniformLbp = extractLbpFeature(grayImage);
        featureMat(i,:) = uniformLbp;
        %subplot(1,2,1);imshow(grayImage);title(fold.y(i));
        %pause;
    end
    featureMatWithLabel = [fold.y,featureMat];

end

