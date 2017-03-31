%����ű�����������ʽ����ʦ���������ĸְ����ݼ�����Ϊ������stl-10��ʽ��mat����
clear;
clc;
originImageFolder = './dataSets/ustb-plate9/ԭʼ����/���Լ�';
%dir(originImageFolder);

% ��Ӧ1~9�����
class_names = {'���','����','���','��������','������','������Ƥ','��������','������','ѹ��'};
tempX = [];
tempY = [];
%1. ����class_names��ȡÿ�������ļ���
fileFolder=fullfile(strcat(originImageFolder,'/',class_names,'2'));
for i = 1:1:size(fileFolder,2);
    currentFolder = char(fullfile(fileFolder(i),'*.bmp'));
    filesInFolder=dir(currentFolder);%��ȡ��ǰ�ļ���������ͼƬ

    fileNames={filesInFolder.name};
    fileFullNames = fullfile(fileFolder(i),fileNames);
    for j = 1:size(fileFullNames,2)
        currentImg = imread(char(fileFullNames(j)));% ͼ���СΪ128*128���Ҷ�ͼ
        if size(currentImg,3) == 3
            currentImg = rgb2gray(currentImg);
        end
        lineImage = reshape(currentImg,[1,16384]);
        tempX = [tempX;lineImage];
        tempY = [tempY;i];
        %figure(1);imshow(currentImg);

    end
end
newOrder = randperm(size(tempX,1));
X = tempX(newOrder, :);                              %����������ж�A������������
Y = tempY(newOrder, :);
save('ustb-plate9-test.mat','class_names','X','Y');