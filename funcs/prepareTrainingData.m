% �ú���������Ŀ���stl-10 ����ǩ��ѵ������ת��Ϊ������ELM�����ݸ�ʽ
% ���ߣ�ʷ����������
% ʱ�䣺2017��03��25��

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

