% �ú�����������鿴stl-10���ݵ�ͼ�񣬼����Ӧ��uniform lbp����
% ���ߣ�ʷ����������
% ���ڣ�2017��03��25��
clc;
clear;
load('./dataSets/test/stl-10.mat');
for i=1:1:size(X,1)
    imgData = X(i,:);
    img = array_to_color_image(imgData,96,96);
    colorImage = imrotate(img,270);%stl-10��������Ҫ˳ʱ����ת90���Ϊ��
    %��ͼ
    subplot(1,3,1);
    imshow(colorImage);

    grayImage = rgb2gray(colorImage);
    subplot(1,3,2);
    imshow(grayImage);

    uniformLbp = extractLbpFeature(grayImage);
    subplot(1,3,3);
    stem(uniformLbp);%stem ����������״ͼ
    pause;
end
