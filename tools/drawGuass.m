x=-2:0.1:2;
y=gaussmf(x,[0.33 0]);%��һ������sigma���ڶ�������miu
plot(x,y)
xlabel('gaussmf, P=[2 0]');