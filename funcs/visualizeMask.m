function [] = visualizeMask( mask )
attrib  = mask;  
  x = [];
  y = [];
  for i = 1:size(mask,1)
      for j = 1:size(mask,2)
          if(mask(i,j) == 1)
              x = [x,i];
              y = [y,j];
          end
      end
  end
% ���ƻ�����ɢ��ͼ  
figure(2);  
scatter(x,y,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5);  
set(gca,'Fontsize',12);  
title({'Iris���ݼ�����150�����ݣ�ÿ�����ݺ�4������',...  
    '��32������ֵ���������������־�Ĵ�С',...  
    '��־ʹ���Զ���Ĵ�С����ʽ'});  
xlabel('����1'); ylabel('����2');  
box on;  
set(gcf,'color',[1 1 1],'paperpositionmode','auto');  

end

