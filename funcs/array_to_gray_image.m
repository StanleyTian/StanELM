% 2017-03-31
% author: Stanley
% Description: �ú���������һ��MATLAB��ʽ��ͼ������ת��Ϊ���ӻ���ͼ������
% ����һ��Ϊ��������Ϊ�Ҷ�ͼ��
% ���� ĳ�Ҷ�ͼ�� ����һ��Ϊ 16384 ������
% ���������ͼ���С���� 128*128 ��һ�ű�׼�ĻҶ�ͼ

function gray_image = array_to_gray_image(array,width)
    gray_image = vec2mat(array,width);
end