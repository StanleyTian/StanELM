% �Ŵ�����������һ��inputWeight��bias���������һ�������ʱ���Ľ��
% ����
% iw,b
% mutationRate��������
% ���
% iwNew,bNew

function [ iwNew,bNew ] = randomTuneInputWeightAndBias( iw,b,mutationRate )
    

    all = [iw,b];
    nodeToMutateCount = floor(size(all,1)*size(all,2)*mutationRate);
    miu = 0;
    sigma = 0.33;%3sigma׼�򣬱�֤����-1~1֮���������Ϊ99.7%
    for i = 1:1:nodeToMutateCount
            row = randi([1,size(all,1)]);
            col = randi([1,size(all,2)]);
        while 1
            R = normrnd(miu,sigma);%��-1~1�ķ�Χ��ѡȡ���ʵ�����
            if R > -1 && R < 1
                break;
            end
        end

        if col ~= size(all,2);%inputWeight ��Χ
            tmp = all(row,col);
            tmp = (1+R)*tmp;
            if tmp<1 && tmp>-1
                all(row,col)=tmp;
            end
        else% bias ��Χ
            tmp = all(row,col);
            tmp = (1+R)*tmp;
            if tmp<1 && tmp>0
                all(row,col)=tmp;
            end
        end
    end
    iwNew = all(:,1:end-1);
    bNew = all(:,end);
end

