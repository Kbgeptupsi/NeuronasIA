clc;
E=[0	1	1	0	0	0	0	0	1	1;
0	1	1	0	1	1	0	0	0	0;
0	1	1	0	1	1	1	1	1	1;
0	1	0	1	0	1	0	1	0	1;
];

S=[0	1	1	0	1	1	0	0	1	1];

net=newff( [min(E')' max(E')'],[10 1], {'tansig' 'purelin'},'trainlm');
net.IW{1,1};
net.b{1};
net.trainParam.epochs=100;
net.trainParam.goal=0;
net=train(net,E,S);
c=sim(net,E)

%Perceptrón 
net=newp([0 1 ; 0 1; 0 1 ;0 1],1);
net.IW{1,1};
net.b{1};
net.trainParam.epochs=100;
net.trainParam.goal=0;
net=train(net,E,S);
c=sim(net,E)
