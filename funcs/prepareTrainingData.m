% 该函数用来将目标的stl-10 带标签的训练数据转换为适用于ELM的数据格式
% 作者：史丹利复合田
% 时间：2017年03月25日

function [ featureMatWithLabel ] = prepareTrainingData( filePath ,testFoldIndex)
    trainingData = load(filePath);
    fold = [];
    for i=1:1:10
        if i ~= testFoldIndex
                currentFold = prepare1foldData(trainingData,i);
                fold = [fold;currentFold];
        end
    end

end

