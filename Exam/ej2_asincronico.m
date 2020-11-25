
%% ------------------------------------------------------------------------
%
%                      REDES NEURONALES 
%
%                           PARCIAL
%
% 
%                   Ejercicio 2 (asincrónico)
%
%
%               González Etchemaite, J. Ignacio
%                     Padrón : 86866
%
% -------------------------------------------------------------------------
clc, clear all, close all;

N = 4; %cantidad de neuronas de la red
p = [1 1 1 -1]'; %unico patrón a enseñar a la red

W = p*p'-eye(N);

entrada = [1 -1 1 1]';
%asincronico:

salida = entrada;
positions = randperm(N);

for k = 1:10
for i = 1:N
    k = positions(i);
    salida(k)= signo(W(k,:)*salida); %se va actualizando sobre sí misma
end
    salida
end

% Se puede ver como la red converge a 1 entre 2 estados:
% el estado  [1 1 1 -1], que es el patrón que le enseñamos,
% o su negado [-1 -1 -1 1].

% Como en el caso asincrónico, la red se actualiza sobre si misma, mejora
% bastante la convergencia, en el sentido de que la red se mueve de forma
% continua sobre el espacio de estados hasta llegar a un punto estable.
% A cuál de los 2 estados termina convergiendo?
% Eso dependerá del orden en que las neuronas se vayan actualizando (pero
% siempre que se actualicen de a una a la vez).
%
% Por el contrario, cuando utilizamos actualizado sincrónico, al estar la
% red actualizandose por completo en instantes discretos, la red se mueve
% de manera discontinua, saltando entre 2 estados opuestos,  produciéndose
% de esta forma una oscilacion errónea del sistema.

