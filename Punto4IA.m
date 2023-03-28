clc;
E=[1 -1	1 -1;
1 1 1 -1;
1 1	-1 -1;];
S=[-1 -1 1 1;
-1 1 -1	1;];

net = newff( [min(E')', max(E')'], [3 2], {'tansig' 'purelin'},'trainlm');
net=init(net)
net.iw{1,1}
net.b{1}
net.iw{2,1}
net.b{2}
net.trainParam.epochs=500;
net.trainParam.goal=0
net=train(net,E,S);
b=sim(net,E)


