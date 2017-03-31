clc;
clear;
disp('��ʼ');
% ����������
mutationRate = 0.001;

% 2. ��ʼѵ�� �������inputweight��bias
hiddenNodesStart = 100;
hiddenNodesEnd = 5000;
% 1. ׼������
[t,v]=prepareTrainingData('./dataSets/stl-10/train-lbp-origin-all-folds.mat',1);
% 2. ��ʼѵ�� �������inputweight��bias
history =[];
xAxis = [];
i = hiddenNodesStart;
while 1 
    if i > hiddenNodesEnd
        break;
    end
    [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,iw,b] ...
    = ELM(t, v, 1, i, 'sin');
    xAxis = [xAxis;i];
    history = [history;TrainingAccuracy,TestingAccuracy];
    figure(1);
    x=xAxis;
    plot(xAxis,history);title('ѵ����ʷ');
    legend('ѵ����׼ȷ��','��֤��׼ȷ��', 'Location','NorthWest');drawnow;
    print(1,'-dpng','different_nodes_history.png'); %�����Ϊ3��figure����png��ʽ���棬�ļ���Ϊtest_loss.png
    fprintf('Nodes����%i ��ѵ������%.2f%% ��֤����%.2f%%\n',i,TrainingAccuracy*100,TestingAccuracy*100);
%     if i<1000
%         i=i+10;
%     elseif i>=1000 && i<10000
             i=i+100;
%     else    
%         i=i+1000;
%         
%     end
        
end

disp('����');