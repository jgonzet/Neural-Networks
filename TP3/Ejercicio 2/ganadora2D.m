function [ coord_del_minimo ] = ganadora2D(m, w)
%% Esta funcion devuelve la posicion de la ganadora.
%   p. ej.:     p = ganadora(m,w);
% m >> muesta en cuestion.
% w >> pesos.
% p << posicion de la w mas cercana a m.

f = length(w(:,1,1));
c = length(w(1,:,1));
for i = 1:f
    for j = 1:c     % distancias entre w's y la muestra.
        distancias(i,j) = ( m(1) - w(i,j,1) )^2 + ( m(2) - w(i,j,2) )^2 ;
    end
end
[minimos,fmin] = min(distancias); % busca fil min de cada col.
[minimo, cmin] = min(minimos);

coord_del_minimo = [fmin(cmin), cmin]; % minima distancia.
end