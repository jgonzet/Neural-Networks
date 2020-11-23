
%% ------------------------------------------------------------------------
%
%                      REDES NEURONALES 
%
%                           PARCIAL
%
% 
%                   Ejercicio 1 (2da. Parte)
%
%
%               González Etchemaite, J. Ignacio
%                     Padrón : 86866
%
% -------------------------------------------------------------------------

%% La primer parte es igual al ejercicio anterior.
clc, clear all, close all;

p = 4; %cantidad de patrones
img1 = imread('padrino.bmp');
img2 = imread('panda.bmp');
img3 = imread('perro.bmp');
img4 = imread('v.bmp');

s = size(img1);
largo = s(1)*s(2);

%pasamos a vectores fila
A =  reshape(img1(:,:,1),largo,1)*2 - 1;
B =  reshape(img2(:,:,1),largo,1)*2 - 1;
C =  reshape(img3(:,:,1),largo,1)*2 - 1;
D =  reshape(img4(:,:,1),largo,1)*2 - 1;

%Entrenamos y calculamos los Wij, segun regla Hebbiana:
P = [A B C D];
W = P*P' - p*eye(largo);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Generamos las entradas aleatorias a simular

m = 1000; %cantidad de pruebas

% Vamos a llevar una cuenta de la convergencia de las simulaciones.
% Entre paréntesis, los resultados de 1000 simulaciones:

Na = 0; %cantidad que convergen al 1er patrón ('padrino.bmp') - (70)
Nb = 0; %cantidad que convergen al 2do patrón ('panda.bmp') - (41)
Nc = 0; %cantidad que convergen al 3er patrón ('perro.bmp') - (89)
Nd = 0; %cantidad que convergen al 4to patrón ('v.bmp')  - (69)
Ne = 0; %cantidad que convergen a un estado espurio de la red - (731)

for i = 1:m
    
    entrada = sign(randn(largo,1)); %estado aleatorio

    %Filtrado sincrónico:
    distance = 1;
    aux = entrada;

    %vamos a actualizar hasta que no haya cambios (distancia Hamming = 0)
    while distance
        salida = signo(W*aux);
        distance = sum(salida ~=aux); %distancia de Hamming
        aux = salida;
    end
    
    %Nos fijamos a qué patrón convergió:
    
    if (isequal(salida,A))
        Na = Na+1;
    else if (isequal(salida,B))
            Nb = Nb+1;
        else if (isequal(salida,C))
                Nc = Nc+1;
            else if (isequal(salida,D))
                    Nd = Nd+1;
               
            else Ne = Ne+1;
                end
            end
        end
    end    
end

% Luego de hacer la simulacion, vemos que no son todos los estados equi-
% probables, y que la mayor cantidad de simulaciones fueron a parar a esta-
% dos espurios (aproximadamente un 70%)


