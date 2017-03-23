imgData = X(6,:);
img = array_to_color_image(imgData,96,96);
colorImage = imrotate(img,270);%stl-10的数据需要顺时针旋转90°才为正
subplot(1,3,1);
imshow(colorImage);
grayImage = rgb2gray(colorImage);
subplot(1,3,2);
imshow(grayImage);
re = lbp(grayImage);
subplot(1,3,3);
plot(re);