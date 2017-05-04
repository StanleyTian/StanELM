% �ú���������Ŀ���stl-10 ����ǩ��ѵ������ת��Ϊ������ELM�����ݸ�ʽ
% filePath: ʹ��tools/saveAllFolds������������
% testFoldIndex: ���Լ���index��1~10��
% trainingData: ��ѡ�õ�ѵ�����ݣ�����������Ϊ9000
% validatingData: ��ѡ�õ���֤���ݣ�����������Ϊ1000����testFoldIndex����Ӧ������
% 
% ���ߣ�ʷ����������
% ʱ�䣺2017��03��25��

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

