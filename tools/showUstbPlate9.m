% �ú�����������鿴ustb-plate9���ݵ�ͼ�񣬼����Ӧ��uniform lbp����
% ustb-plate9���ݸ�ʽ��
% �����֣�1.X��һ�������ÿһ�д���һ����һά����ͼ��ͼ���СΪ128*128 = 16384
%        2.Y��һ������������Xһһ��Ӧ��ÿ��Ԫ�ش��������1~9��ʾ����9��
%        3.class_names��1~9��������
% ���ߣ�ʷ����������
% ���ڣ�2017��03��25��
clc;
clear;
load('./dataSets/ustb-plate9/ustb-plate9-train.mat');
for i=1:1:size(X,1)
    imgData = X(i,:);
    img = array_to_gray_image(imgData,128);
    grayImage = imrotate(img,270);%������Ҫ˳ʱ����ת90���Ϊ��
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
