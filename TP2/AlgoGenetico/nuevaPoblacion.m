function [ wp1 ] = nuevaPoblacion( wp0, tablaNum, tablaFit )
% Genera la lista de W de la poblacion nueva.
%
% p. ej:     wp1 = nuevaPoblacion(wp0,tablaNum,tablaFit);
%
%      wp0:       poblacion anterior (P0).
%      tablaNum:  tabla de indice de individuos de P0 que se reproducen.
%      tablaFit:  tabla de fitness correspondiente con tablaNum.
%
%      wp1:       Nueva poblacion P1, ordenada de mayor a menor fitness.

for i = 1:length(wp0(:,1))
    [maximo,ptr] = max(tablaFit); 
    wp1(i,:) = wp0( tablaNum(ptr) ,:);
    tablaNum(ptr) = []; % con esto se descarta lo que ya se uso en wp1
    tablaFit(ptr) = []; % con esto se descarta lo que ya se uso en wp1
end

end

