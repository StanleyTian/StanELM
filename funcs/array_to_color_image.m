% 2016-10-29
% author: Stanley
% Description: 该函数用来将一个MATLAB格式的图像数据转换为可视化的图像数据
% 数据一般为行向量，平均分为三段，分别为红色、绿色、蓝色的三通道图像数据
% 比如 cifar 数据一行为 3072 个数据
% 前 1024 数据代表红色,接下来的1024个代表绿色、最后的1024个代表蓝色
% 这样输出的图像大小就是 32*32*3 ，一张标准的彩图

function color_image = array_to_color_image(array,width,height)
    C = uint8(zeros(width,height,3));%新建一个空白图像
    
    imageLength = width*height;%单张图像的数据长度（转换为一维）
    redArray = array(1,1:imageLength);
    greenArray = array(1,imageLength+1:2*imageLength);
    blueArray = array(1,2*imageLength+1:3*imageLength);

    %每个通道向量转换为矩阵
    redMatrix = vec2mat(redArray,width);
    greenMatrix = vec2mat(greenArray,width);
    blueMatrix = vec2mat(blueArray,width);

    %单独为各个通道色彩赋值
    C(:,:,1) = redMatrix; 
    C(:,:,2) = greenMatrix; 
    C(:,:,3) = blueMatrix; 
    
    imshow(redMatrix);
    color_image = C;
end