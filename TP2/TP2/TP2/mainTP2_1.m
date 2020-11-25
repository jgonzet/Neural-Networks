%         TP2 - Ejercicio 1: Perceptron Simple
%         Red Neuronal capaz de apreder AND y OR para 2 y 4 entradas             
clear all,close all

X2 = [-1 -1             1;              % Entradas de 2 bits
      -1  1             1;
       1 -1             1;
       1  1             1 ];          
   
X4 = [-1 -1 -1 -1       1;              % Entradas de 4 bits
      -1 -1 -1  1       1;
      -1 -1  1 -1       1;
      -1 -1  1  1       1;
      -1  1 -1 -1       1;
      -1  1 -1  1       1;
      -1  1  1 -1       1;
      -1  1  1  1       1;
       1 -1 -1 -1       1;
       1 -1 -1  1       1;
       1 -1  1 -1       1;
       1 -1  1  1       1;
       1  1 -1 -1       1;
       1  1 -1  1       1;
       1  1  1 -1       1;
       1  1  1  1       1 ];

% salidas deseadas:
yd2and = [-1 -1 -1  1];  % AND
yd2or  = [-1 -1 -1  1];  % OR
yd4and = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1  1];  % AND
yd4or  = [-1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1];  % OR

% ===
x = X4;          % elijo tipo de entrada de 2 o 4 bits
yd = yd4or;     % elijo tipo de salida AND u OR de 2 o 4 bits
eta = .5;

[y,W] = perceptronSimple(x,yd,eta);


% ===
%figure
%subplot(2,1,1)
%stem(yd), title('Salida DESEADA'  ), ylim([-2 2])
%subplot(2,1,2)
%stem(y),  title('Salida APRENDIDA'), ylim([-2 2])

% --

% disp('TESTEO: Ingresar entrada de 4 bits')
% for i=1:4
%     in(i) = input('\n');
% end
% in(i+1) = 1;
% in = signNeu(in)';
% signNeu(W*in)
