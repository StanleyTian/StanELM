% 提取图像的uniform lbp特征，并返回
function [ feature ] = extractLbpFeature( img )
      %mapping=getmapping(8,'u2');% 指定采样模式：81u2
      %feature=lbp(img,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood
                                 %using uniform patterns
      feature = lbp(img);
end