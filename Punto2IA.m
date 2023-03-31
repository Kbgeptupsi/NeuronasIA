clc;

%Vector de entrada
E=[1.22	1.45 1.46 1.47 2.48 2.49 2.50 2.51 2.52 5.53 5.54 5.55 3.56 5.57 3.58 3.59 4.60 4.61 4.62 4.63;
1.21 2.55 2.56 2.57 2.58 3.59 3.60 3.61 3.62 4.63 4.64 4.65 4.66 4.67 3.68 5.69 5.70 5.71 5.72 5.73;
0.1	0.2	0.3	0.4	0.5	0.6	0.7	0.8	0.9	0.10 0.11 0.12 0.13 0.14 0.15 0.16 0.17 0.18 0.19 0.20];

X=[1.22	1.45 1.46 1.47 2.48 2.49 2.50 2.51 2.52 5.53 5.54 5.55 3.56 5.57 3.58 3.59 4.60 4.61 4.62 4.63];
Y=[1.21 2.55 2.56 2.57 2.58 3.59 3.60 3.61 3.62 4.63 4.64 4.65 4.66 4.67 3.68 5.69 5.70 5.71 5.72 5.73];
%Vector de salida
S=[1.3921	0.3627	0.4583	0.5539	0.2680	0.3053	0.4017	0.4981	0.5946	-0.6663	-0.6390	-0.6116	-0.3287	-0.5566	-1.1330	0.5556	0.0110	0.0254	0.0398	0.0542];

%Inicializo mi red con los valores max y min
%Y con las Funciones de Activacion tansig y purelin
%Y el Algoritmo de entrenamiento trainlm
red = newff([min(E')' max(E')'],[8 1],{'tansig' 'purelin'},'trainlm');

%Inicializo los pesos 
red.iw{1,1};
red.iw{2,1};

%Inicializo los Umbrales
red.b{1};
red.b{2};

%Numero de iteraciones
red.trainParam.epochs=400;

%Error maximo permitido
red.trainParam.goal=1e-9;

%Entrenar la red neuronal
red=train(red,E,S);

%Testear la red neuronal
a=sim(red,E)
R=[a];
subplot(1,2,1);plot3(X,Y,S,"r");...
title('Entrada VS Salida');
subplot(1,2,2);plot3(X,Y,R,"m");
title('Entrada VS Salida Simulada');

