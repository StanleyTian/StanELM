imgData = X(6,:);
img = array_to_color_image(imgData,96,96);
B = imrotate(img,270);%stl-10的数据需要顺时针旋转90°才为正
imshow(B);