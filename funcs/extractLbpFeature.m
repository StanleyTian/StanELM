% ��ȡͼ���uniform lbp������������
function [ feature ] = extractLbpFeature( img )
      %mapping=getmapping(8,'u2');% ָ������ģʽ��81u2
      %feature=lbp(img,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood
                                 %using uniform patterns
      feature = lbp(img);
end