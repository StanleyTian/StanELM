% ��ԭʼ��elm�㷨������ʵ�飬��diabetes���ݽ������顣������Դ
% http://archive.ics.uci.edu/ml/datasets.html
TrA = 0;
TeA = 0;
TrT = 0;
TeT = 0;
for i=1:100
    [t1,t2,a,b]=ELM_origin('./dataSets/diabetes/diabetes_train.txt', './dataSets/diabetes/diabetes_test.txt', 1, 20, 'sig');
    TrA = TrA + a;
    TeA = TeA + b;
    TrT = TrT + t1;
    TeT = TeT + t2;
end

% �������ʱ�估���㾫��
averageTrA = TrA/100
averageTeA = TeA/100
averageTrT = TrT/100
averageTeT = TeT/100