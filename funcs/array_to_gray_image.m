% 2017-03-31
% author: Stanley
% Description: 该函数用来将一个MATLAB格式的图像数据转换为可视化的图像数据
% 数据一般为行向量，为灰度图像
% 比如 某灰度图像 数据一行为 16384 个数据
% 这样输出的图像大小就是 128*128 ，一张标准的灰度图

function gray_image = array_to_gray_image(array,width)
    gray_image = vec2mat(array,width);
end