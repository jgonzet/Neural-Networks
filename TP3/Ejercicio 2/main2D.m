% RED (BI)DIMENSIONAL - APRENDIZAJE NO SUPERVISADO:
% ejercicio muestras circulo unitario.
clear all, close all

         N = 10000;   % realizaciones.
         M = 10;      % tamanio de red.
     radio = 1;       % radio del circulo de muestras.
    radioW = .9;      % radio de dominio de muestras iniciales de W
       eta = .1;      % constante de aprendizaje.
     sigma = M;       % sigma de vecindad.
CANT_PASOS = 10;      % cantidad de pasos para actualizar ploteo.
    REDSIG = 0.9995;  % reduccion de sigma entre muestra y muestra.

in = muestrasCirculo(N,radio);  % esto genera las N muestras
figure('Name','inicializacion de W','NumberTitle','off')
plot(in(:,1),in(:,2),'.'), axis equal

for i=1:M  % w(x0,y0,[x,y]) <-- la onda es esta.
    w(i,:,:) = muestrasCirculo(M, radioW);
end

hold on     % PLOTEO BIDIMENSIONAL de las coord [x y] de cada w_ij:
plot(w(:,:,1)',w(:,:,2)','-*r','LineWidth',2)
plot(w(:,:,1), w(:,:,2), '-*r','LineWidth',2) 
xlabel('x'), ylabel('y')
hold off    % ---------------------

figure('Name','W actualizado','NumberTitle','off')
for k=1:N   % Se selecciona de a una muestra (in).
    p = ganadora2D(in(k,:),w);    % neurona w mas cercana a muestra in.
    for i=1:M                     % p es la pos ij de la w mas cercana.
        for j=1:M
            % correccion delta w (para cada neurona ij):
            w_actual = [w(i,j,1), w(i,j,2)];    % coord [x y] de w_ij
            w(i,j,:) = w_actual +         ...        
                       eta*vecindad2D(    ...   % exp(|{ij}-{i*j*}|^2)
                       [i,j],p,sigma(k))  ... 
                       *(in(k,:) - w_actual);
        end
    end
    sigma(k+1) = REDSIG*sigma(k); % para la sig muestra, reduce vecindad2D

    if 0 == mod(k-1,CANT_PASOS) % plotea cada CANT_PASOS.
        pause(.01)
        
        plot(in(:,1),in(:,2),'.'), axis equal
        
        hold on     % PLOTEO BIDIMENSIONAL:
        plot(w(:,:,1)', w(:,:,2)', '-*r','LineWidth',2)
        plot(w(:,:,1),  w(:,:,2) , '-*r','LineWidth',2)
        xlabel('x'), ylabel('y')
        hold off    % ---------------------
    end
end

figure('Name','reduccion de sigma','NumberTitle','off')
plot(sigma), xlabel('k'), ylabel('sigma(k)')
title('reduccion de sigma para cada nueva muestra')