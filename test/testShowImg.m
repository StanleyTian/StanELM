imgData = X(6,:);
img = array_to_color_image(imgData,96,96);
B = imrotate(img,270);%stl-10��������Ҫ˳ʱ����ת90���Ϊ��
imshow(B);