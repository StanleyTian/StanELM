% 该函数用来使用不同隐层节点数来循环测试数据集，比如从200个节点至5000个节点，结果
% 会以图像折线图显示
clc;clear;disp('开始');
% 参数设置区
mutationRate = 0.001;
hiddenNodesStart = 100;
hiddenNodesEnd = 5000;
activationFunction = 'sig';
% 1. 准备数据
%[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);% stl-10 使用这个
[t,v]=prepareTrainingDataForUstbPlate9('./dataSets/ustb-plate9/ustb-plate9-train.mat','./dataSets/ustb-plate9/ustb-plate9-test.mat','originLbp');% ustb-plate9 使用这个
% 2. 开始训练 采用随机inputweight和bias
history =[];
xAxis = [];
i = hiddenNodesStart;
while 1 
    if i > hiddenNodesEnd
        break;
    end
    [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,iw,b] ...
    = ELM(t, v, 1, i, activationFunction);
    xAxis = [xAxis;i];
    history = [history;TrainingAccuracy,TestingAccuracy];
    figure(1);
    x=xAxis;
    plot(xAxis,history);title('训练历史');
    legend('训练集准确率','验证集准确率', 'Location','NorthWest');drawnow;
    print(1,'-dpng','different_nodes_history.png'); %将句柄为3的figure，以png格式保存，文件名为test_loss.png
    fprintf('Nodes数：%i ：训练集：%.2f%% 验证集：%.2f%%\n',i,TrainingAccuracy*100,TestingAccuracy*100);
%     if i<1000
%         i=i+10;
%     elseif i>=1000 && i<10000
             i=i+100;
%     else    
%         i=i+1000;
%         
%     end
        
end

disp('结束');