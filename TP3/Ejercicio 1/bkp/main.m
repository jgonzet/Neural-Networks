clear all, close all

N = 20000;   % realizaciones
M = 20;   % tamanio de red
radio = 1;
eta = 1;
sigma(1) = 10;

in = muestrasCirculo(N,radio); % genero las N muestras
figure
plot(in(:,1),in(:,2),'.'), axis equal

w = muestrasCirculo(M, radio*0.75);

hold on, plot(w(:,1),w(:,2),'-*r','LineWidth',2), hold off

    for i=1:N
        p = ganadora(in(i,:),w);
        for j=1:M
            % delta w:
            w(j,:) = w(j,:) + eta*vecindad(j,p,sigma(i))*(in(i,:) - w(j,:));
        end
    sigma(i+1) = 0.999*sigma(i);
    end
    
figure, plot(sigma)
figure
plot(in(:,1),in(:,2),'.'), axis equal

w = muestrasCirculo(M, radio);
hold on, plot(w(:,1),w(:,2),'-*r','LineWidth',2), hold off