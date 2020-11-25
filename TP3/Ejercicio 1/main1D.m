% RED (UNI)DIMENSIONAL - APRENDIZAJE NO SUPERVISADO:
% ejercicio muestras circulo unitario.
clear all, close all

         N = 1000;    % realizaciones
         M = 100;     % tamanio de red
     radio = 1;       % radio del circulo de muestras.
    radioW = .9;      % radio de dominio de muestras iniciales de W
       eta = .4;      % constante de aprendizaje.
     sigma = M;       % sigma de vecindad.
CANT_PASOS = 10;      % cantidad de pasos para actualizar ploteo.
    REDSIG = 0.99;    % reduccion de sigma entre muestra y muestra.

in = muestrasCirculo(N,radio);  % esto genera las N muestras
figure('Name','inicializacion de W','NumberTitle','off')
plot(in(:,1),in(:,2),'.'), axis equal

w = muestrasCirculo(M, radioW);

hold on     % plot de las coord [x y] iniciales de cada w_i.
plot(w(:,1),w(:,2),'-*r','LineWidth',2)
xlabel('x'), ylabel('y')
hold off

figure('Name','w actualizado','NumberTitle','off')
for i=1:N   % Se selecciona de a una muestra (in).
    p = ganadora1D(in(i,:),w);    % neurona w mas cercana a muestra in.
    for j=1:M                     % p es la pos i de la w mas cercana.
        % correccion delta w (para cada neurona i):
        w(j,:) = w(j,:) + eta*vecindad1D( ... % exp(|{ij}-{i*j*}|^2)
                                    j,p,sigma(i))*(in(i,:) - w(j,:));
    end
    sigma(i+1) = REDSIG*sigma(i); % para la sig muestra, reduce vecindad1D

    if 0 == mod(i-1,CANT_PASOS)   % plotea cada CANT_PASOS.
        pause(.1)
        plot(in(:,1),in(:,2),'.'), axis equal
        hold on
        plot(w(:,1),w(:,2),'-*r','LineWidth',2)
        xlabel('x'), ylabel('y')
        hold off
    end
end    

figure('Name','reduccion de sigma','NumberTitle','off')
plot(sigma), xlabel('k'), ylabel('sigma(k)')
title('reduccion de sigma para cada nueva muestra')