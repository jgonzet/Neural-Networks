function [ p ] = ganadora(m, w)
%% Esta funcion devuelve la posicion de la ganadora.
% m = muesta en cuestion.
% w = pesos.
% p = posicion de la w ganadora.
[f,c]=size(w);
for i = 1:f
    distancias(i) = (( m(1) - w(i,1) )^2 + ( m(2) - w(i,2) )^2 ); % distancias entre w's y la muestra.
end
[minimo,p] = min(distancias); % se busca el indice p de minima distancia
end

