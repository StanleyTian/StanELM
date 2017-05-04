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
% 绘制基本的散点图  
figure(2);  
scatter(x,y,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5);  
set(gca,'Fontsize',12);  
title({'Iris数据集包含150个数据，每个数据含4个属性',...  
    '第32个属性值扩大后用来决定标志的大小',...  
    '标志使用自定义的大小和样式'});  
xlabel('属性1'); ylabel('属性2');  
box on;  
set(gcf,'color',[1 1 1],'paperpositionmode','auto');  

end

