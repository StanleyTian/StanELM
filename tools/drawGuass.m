x=-2:0.1:2;
y=gaussmf(x,[0.33 0]);%第一个参数sigma，第二个参数miu
plot(x,y)
xlabel('gaussmf, P=[2 0]');