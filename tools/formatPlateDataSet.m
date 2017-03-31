%这个脚本工具用来格式化艾师姐留下来的钢板数据集，存为类似于stl-10格式的mat数据
clear;
clc;
originImageFolder = './dataSets/ustb-plate9/原始数据/测试集';
%dir(originImageFolder);

% 对应1~9种类别
class_names = {'麻点','网纹','结疤','纵向裂纹','纵向划伤','氧化铁皮','横向裂纹','横向划伤','压痕'};
tempX = [];
tempY = [];
%1. 根据class_names读取每种类别的文件夹
fileFolder=fullfile(strcat(originImageFolder,'/',class_names,'2'));
for i = 1:1:size(fileFolder,2);
    currentFolder = char(fullfile(fileFolder(i),'*.bmp'));
    filesInFolder=dir(currentFolder);%读取当前文件夹内所有图片

    fileNames={filesInFolder.name};
    fileFullNames = fullfile(fileFolder(i),fileNames);
    for j = 1:size(fileFullNames,2)
        currentImg = imread(char(fileFullNames(j)));% 图像大小为128*128，灰度图
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
X = tempX(newOrder, :);                              %根据这个序列对A进行重新排序
Y = tempY(newOrder, :);
save('ustb-plate9-test.mat','class_names','X','Y');