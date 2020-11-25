function [y] = pMultiCapa(x, cantNCapas, w, b)
% Perceptron multicapa.
%
%   p. ej.:     y = pMultiCapa(x,cantNCapas,w,beta);
%
%     x:            Entrada a la red.
%     cantNCapas:   Num. de Neuronas por cada capa (INCLUSO LA DE SALIDA).
%     w:            Vector de pesos de la red.
%     beta:         constante beta de ajuste de funcion de activacion.
%
%     y:            Salida de la red.
%
% NOTA: por ejemplo vector w puede ser de la forma:
% w=[ wji wj1 w31 w41 <--- pesos de las 4 neu. (capa1) para elemento in(x1) 
%     w1i w22 w32 w42 <--- pesos de las 4 neu. (capa1) para elemento in(x2)
%     w13 w23 w33 w43 <--- pesos de las 4 neu. (capa1) para elemento in(x3)
%     w14 w24 w34 w44 <--- pesos de las 4 neu. (capa1) para elemento in(x4)
%     w1  w2  w3  w4  <--- pesos de offset de cada neurona en capa1.
%     w01 w02 w03 w04 <--- pesos de salida (capa2) para cada elemento in.
%     w0  ]           <--- peso  de offset de neurona de salida.

dimX = length(x);
k = 0;
for m = 1:length(cantNCapas) % esto resuelve de a capas.
    for j =1:cantNCapas(m)
        h = 0;
        for i=1:dimX    % suma las i+1 entradas de la neu. j de la capa m
%            fprintf(['w(' num2str(k+ j+(i-1)*(cantNCapas(m)) ) ') ']) %DEBUG
            h = h + w(k+ j+(i-1)*(cantNCapas(m)) )*x(i);            
        end
%        fprintf([' <-- Neurona Nro: ' num2str(j) '\n']) % DEBUG
        u(j) = triggerNeu(1,b,h);  % salida de cada neu. j de la capa m.
    end
%    fprintf(['CAPA ' num2str(m) ': Total ' num2str(cantNCapas(m)) ...
%             ' neuronas\n']) % DEBUG
%    fprintf('========================================\n') % DEBUG
    u(j+1) = 1;
    k = k + dimX*cantNCapas(m);
    x = u;       % se guarda la salida U de la capa en X.
    dimX = length(u);
    clear u;     % se limpia para volver a generar U en la siguiente capa.
end
%% Salida:
y = x(1:end-1);
end

