clc;
E=[-1	-1	1	1;
-1	1	-1	1];

S=[-1	1	1	-1;
-1	-1	-1	1];

red = newff( [min(E')' max(E')'],[3 2],{'tansig','purelin'},'trainlm');

red=init(red)
red.iw{1,1}
red.b{1}
red.iw{2,1}
net.b{2}
red.trainParam.epochs=500
red.trainParam.goal=0
red=train(red,E,S)
a=sim(red,E)