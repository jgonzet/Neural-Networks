
%% ------------------------------------------------------------------------
%
%                      REDES NEURONALES 
%
%                           PARCIAL
%
% 
%                   Ejercicio 2 (asincr�nico)
%
%
%               Gonz�lez Etchemaite, J. Ignacio
%                     Padr�n : 86866
%
% -------------------------------------------------------------------------
clc, clear all, close all;

N = 4; %cantidad de neuronas de la red
p = [1 1 1 -1]'; %unico patr�n a ense�ar a la red

W = p*p'-eye(N);

entrada = [1 -1 1 1]';
%asincronico:

salida = entrada;
positions = randperm(N);

for k = 1:10
for i = 1:N
    k = positions(i);
    salida(k)= signo(W(k,:)*salida); %se va actualizando sobre s� misma
end
    salida
end

% Se puede ver como la red converge a 1 entre 2 estados:
% el estado  [1 1 1 -1], que es el patr�n que le ense�amos,
% o su negado [-1 -1 -1 1].

% Como en el caso asincr�nico, la red se actualiza sobre si misma, mejora
% bastante la convergencia, en el sentido de que la red se mueve de forma
% continua sobre el espacio de estados hasta llegar a un punto estable.
% A cu�l de los 2 estados termina convergiendo?
% Eso depender� del orden en que las neuronas se vayan actualizando (pero
% siempre que se actualicen de a una a la vez).
%
% Por el contrario, cuando utilizamos actualizado sincr�nico, al estar la
% red actualizandose por completo en instantes discretos, la red se mueve
% de manera discontinua, saltando entre 2 estados opuestos,  produci�ndose
% de esta forma una oscilacion err�nea del sistema.

