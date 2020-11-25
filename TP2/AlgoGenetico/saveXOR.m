function [ ] = saveXOR( cantNCapas, numEntr)
% Genera un archivo 'XOR.mat' con las tablas de entrada salida
% y los numeros por cada capa oculta.
%
% p. ej.          saveXORin4([4 3], 2);
%                 genera una tabla de entradas X y salidas Y de una XOR
%                 multicapa de 2 entradas con:
%                 4 neuronas en 1er capa oculta.
%                 3 neuronas en 2da capa oculta.
%
%              .---------.
%        x1 ---|         |
% inX2         |   XOR   |--- y    outX2
%        x2 ---|         |
%              '---------'
%              .---------------------.
%        x1 ---|                     |
%              |                     |
%        x2 ---|                     |
% inX4         |         XOR         |--- y  outX4
%        x3 ---|                     |
%              |                     |
%        x4 ---|                     |
%              '---------------------'

%% Entradas XOR:
inX4 = [  -1 -1 -1 -1        1;      % Entrada x de 4 elementos.
		  -1 -1 -1  1        1;
		  -1 -1  1 -1        1;
		  -1 -1  1  1        1;
		  -1  1 -1 -1        1;
		  -1  1 -1  1        1;
		  -1  1  1 -1        1;
		  -1  1  1  1        1;
		   1 -1 -1 -1        1;
		   1 -1 -1  1        1;
		   1 -1  1 -1        1; 
		   1 -1  1  1        1;
		   1  1 -1 -1        1;
		   1  1 -1  1        1;
		   1  1  1 -1        1;
		   1  1  1  1        1
];

inX2 = [  -1 -1              1;
          -1  1              1;
           1 -1              1;
           1  1              1
];

%% Salidas XOR (deseada):
outX4 = [-1; 1; 1; -1; 1; -1; -1; -1; 1; -1; -1; -1; -1; -1; -1; -1];

outX2 = [-1; 1; 1; -1];

%% Seleccion de Entrada y Salida Deseada:
if numEntr == 2
    x  = inX2;
    yd = outX2;
else
    x  = inX4;
    yd = outX4;
end
    
%% Guarda los datos:
save XOR.mat 'x' 'yd' 'cantNCapas';
end
