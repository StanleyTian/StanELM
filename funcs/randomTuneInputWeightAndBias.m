% 遗传函数，输入一组inputWeight和bias，输出按照一定变异率变异的结果
% 输入
% iw,b
% mutationRate：变异率
% 输出
% iwNew,bNew

function [ iwNew,bNew ] = randomTuneInputWeightAndBias( iw,b,mutationRate )
    

    all = [iw,b];
    nodeToMutateCount = floor(size(all,1)*size(all,2)*mutationRate);
    miu = 0;
    sigma = 0.33;%3sigma准则，保证近乎-1~1之间的数概率为99.7%
    for i = 1:1:nodeToMutateCount
            row = randi([1,size(all,1)]);
            col = randi([1,size(all,2)]);
        while 1
            R = normrnd(miu,sigma);%在-1~1的范围内选取合适的数字
            if R > -1 && R < 1
                break;
            end
        end

        if col ~= size(all,2);%inputWeight 范围
            tmp = all(row,col);
            tmp = (1+R)*tmp;
            if tmp<1 && tmp>-1
                all(row,col)=tmp;
            end
        else% bias 范围
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

