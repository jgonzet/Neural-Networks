
%% ------------------------------------------------------------------------
%
%                      REDES NEURONALES 
%
%                           PARCIAL
%
% 
%                   Ejercicio 1 (1ra. Parte)
%
%
%               González Etchemaite, J. Ignacio
%                     Padrón : 86866
%
% -------------------------------------------------------------------------

clc, clear all, close all;

p = 4; %cantidad de patrones

img1 = imread('padrino.bmp');
img2 = imread('panda.bmp');
img3 = imread('perro.bmp');
img4 = imread('v.bmp');

s = size(img1);
largo = s(1)*s(2);

%pasamos a vectores columna:
A =  reshape(img1(:,:,1),largo,1)*2 - 1;
B =  reshape(img2(:,:,1),largo,1)*2 - 1;
C =  reshape(img3(:,:,1),largo,1)*2 - 1;
D =  reshape(img4(:,:,1),largo,1)*2 - 1;

%Entrenamos a la red de Hopfield, segun regla Hebbiana:
P = [A B C D];
W = P*P' - p*eye(largo);

% Para comprobar si las imágenes fueron aprendidas por la red, lo que se 
% hace es poner a la red en un estado inicial igual igual cualquiera de los
% patrones enseñados, y ver que al actualizar, la red permanece allí en ese 
% estado (estable).

entrada = [A B C D]; %los 4 patrones aprendidos

salida = [];

for i = 1:p

    % Filtrado sincrónico: vamos a actualizar hasta que no haya diferencias
    % entre una actualización y la anterior (en el sentido de distancias 
    % de Hamming entre imágenes)
    % Este algoritmo tiene mas sentido cuando estamos filtrando imagenes
    % aleatorias. No es estrictamente necesario el loop, bien podriamos 
    % chequear que en la primer iteración, la red permanece en el mismo 
    % estado invariable y estable.

    distance = 1; %valor inicial para que comience el loop
    aux = entrada(:,i); %vector temporal para almacenar las transiciones

    while distance %hasta que no haya cambios en la red
        salida(:,i) = signo(W*aux); %actualización sincrónica
        distance = sum(salida(:,i) ~=aux); %calculamos la distancia de Hamming
        aux = salida(:,i);
    end

end




%% GRAFICOS:

%redimensionamos:
img1 = reshape(A,s(1),s(2));
img2 = reshape(B,s(1),s(2));
img3 = reshape(C,s(1),s(2));
img4 = reshape(D,s(1),s(2));

salida1 = reshape(salida(:,1),s(1),s(2));
salida2 = reshape(salida(:,2),s(1),s(2));
salida3 = reshape(salida(:,3),s(1),s(2));
salida4 = reshape(salida(:,4),s(1),s(2));

figure
subplot(4,2,1), imshow(img1), title('Entrada patrón 1');
subplot(4,2,3), imshow(img2), title('Entrada patrón 2');
subplot(4,2,5), imshow(img3), title('Entrada patrón 3');
subplot(4,2,7), imshow(img4), title('Entrada patrón 4');
subplot(4,2,2), imshow(salida1), title('Salida patrón 1');
subplot(4,2,4), imshow(salida2), title('Salida patrón 1');
subplot(4,2,6), imshow(salida3), title('Salida patrón 1');;
subplot(4,2,8), imshow(salida4), title('Salida patrón 1');
