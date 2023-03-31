clc;
E=[0.1	0.1	0.1	0.9;
0.9	0.1	0.1	0.9;
0.1	0.9	0.1	0.9;];

S=[0.1	0.1	0.1	0.9;
0.9	0.9	0.1	0.9;];

net = newff( [min(E')' max(E')'],[4 2], {'tansig' 'purelin'},'trainlm')
net.IW{1,1}
net.b{1}
net.trainParam.epochs=200
net.trainParam.goal=1e-8
net=train(net,E,S)
c=sim(net,E)
