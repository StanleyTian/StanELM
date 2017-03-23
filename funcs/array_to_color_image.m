% 2016-10-29
% author: Stanley
% Description: �ú���������һ��MATLAB��ʽ��ͼ������ת��Ϊ���ӻ���ͼ������
% ����һ��Ϊ��������ƽ����Ϊ���Σ��ֱ�Ϊ��ɫ����ɫ����ɫ����ͨ��ͼ������
% ���� cifar ����һ��Ϊ 3072 ������
% ǰ 1024 ���ݴ����ɫ,��������1024��������ɫ������1024��������ɫ
% ���������ͼ���С���� 32*32*3 ��һ�ű�׼�Ĳ�ͼ

function color_image = array_to_color_image(array,width,height)
    C = uint8(zeros(width,height,3));%�½�һ���հ�ͼ��
    
    imageLength = width*height;%����ͼ������ݳ��ȣ�ת��Ϊһά��
    redArray = array(1,1:imageLength);
    greenArray = array(1,imageLength+1:2*imageLength);
    blueArray = array(1,2*imageLength+1:3*imageLength);

    %ÿ��ͨ������ת��Ϊ����
    redMatrix = vec2mat(redArray,width);
    greenMatrix = vec2mat(greenArray,width);
    blueMatrix = vec2mat(blueArray,width);

    %����Ϊ����ͨ��ɫ�ʸ�ֵ
    C(:,:,1) = redMatrix; 
    C(:,:,2) = greenMatrix; 
    C(:,:,3) = blueMatrix; 
    
    imshow(redMatrix);
    color_image = C;
end