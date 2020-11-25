function [ N ] = dimMulticapa(x,cantNCapas,yd)
% Retorna el numero de pesos totales de la red multicapa.
%           N = dimMulticapa(tablaX,cantNeuCapas,tablaY);
%
% tablaX:        lista de entradas.
% cantNeuCapas:  cantidad de neuronas en cada capa oculta.
% tablaY:        lista de salidas.
%
% N:            cantidad N de pesos de la red.
%
% por ejemplo:
%    tabla X - 1er capa oc. 4 neuronas - 2da capa oc. 3 neuronas - tabla Y.
%                     N = dimMulticapa(x,[4;3],y);
%

%% Calculo de dimensiones de la RED multicapa:
cantX      = length(x(1,:)) - 1;   % Cantidad de entradas x.
cantY      = length(yd(1,:));      % Cantidad de salidas  y.

% Cant. de neu. en cada capa (incluso salida).
cantNCapas = [cantNCapas, cantY]; 

numCapas = length(cantNCapas);   % Cant. de capas (incluso salida).

cantW(1)  = cantNCapas(1) + cantX*cantNCapas(1); % Cant pesos W en capa 1.
for k = 2:numCapas
    cantW(k)  = cantNCapas(k) + cantNCapas(k-1)*cantNCapas(k);
end
N = sum(cantW);                      % Total de neur. de la red.

end

