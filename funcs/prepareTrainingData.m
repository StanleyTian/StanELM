% 该函数用来将目标的stl-10 带标签的训练数据转换为适用于ELM的数据格式
% filePath: 使用tools/saveAllFolds所产生的数据
% testFoldIndex: 测试集的index（1~10）
% trainingData: 挑选好的训练数据，正常的行数为9000
% validatingData: 挑选好的验证数据，正常的行数为1000，及testFoldIndex所对应的数据
% 
% 作者：史丹利复合田
% 时间：2017年03月25日

function [ trainingData,validatingData ] = prepareTrainingData( filePath ,testFoldIndex)
    tmp = load(filePath);
    allFolds = tmp.AllFold;
    fold = [];
    for i=1:1:10
        currentFold = allFolds{i};
        if i ~= testFoldIndex
                fold = [fold;currentFold];
        else
            validatingData = currentFold;
        end
    end

    trainingData = fold;
end

