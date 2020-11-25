
%% ------------------------------------------------------------------------
%
%                      REDES NEURONALES 
%
%                           PARCIAL
%
% 
%                   Ejercicio 2 (sincr�nico)
%
%
%               Gonz�lez Etchemaite, J. Ignacio
%                     Padr�n : 86866
%
% -------------------------------------------------------------------------


%% Atenci�n: As� como est� corriendo el script, entra en un loop infinito
%% Si sucede eso, apretar Ctrl+C en la ventana de comandos de Matlab.

% Las conclusiones de este ejercicio se encuentran al final del script
% ej2_asincronico.m.

clc, clear all, close all;

N = 4; %cantidad de neuronas de la red
p = [1 1 1 -1]'; %unico patr�n a ense�ar a la red

W = p*p'-eye(N);

entrada = [1 -1 1 1]';

%Sincronico:
distance = 1;
aux = entrada;

% Vamos a actualizar la red hasta que no cambie mas.
while distance
    salida = signo(W*aux);
    distance = sum(salida ~=aux); %distancia de Hamming
    aux = salida
end

% Se puede ver que la red oscila entre 2 estados, el inicial e=[1 -1 1 1],
% y su negado, [-1 1 -1 -1].


