% �ú�����������鿴stl-10���ݵ�ͼ�񣬼����Ӧ��uniform lbp����
% ���ߣ�ʷ����������
% ���ڣ�2017��03��25��
clc;
clear;
load('./dataSets/ustb-plate9/ustb-plate9-test.mat');
for i=1:1:size(X,1)
    imgData = X(i,:);
    img = array_to_gray_image(imgData,128);
    grayImage = imrotate(img,270);%stl-10��������Ҫ˳ʱ����ת90���Ϊ��
    %��ͼ
    figure(2);
    subplot(1,2,1);
    imshow(grayImage);
    title(char(class_names(Y(i,:))));
    uniformLbp = extractLbpFeature(grayImage);
    subplot(1,2,2);
    stem(uniformLbp);%stem ����������״ͼ
    pause;
end
