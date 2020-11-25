function [ numIndiv ] = ruletaPoblacion( probR )
% Devuelve el numero de indice del individuo que por su probabilidad de
% reproduccion es capaz de reproducirce.
%
% ej:  numIndiv = ruletaPoblacion(tablaPR);
%
%      tablaPR:  lista de probabilidad de supervivencia de cada indiv.
%      numIndiv: numero de la tabla del individuo ganador.
%% Normalizacion de Prob Reproduccion:
probR_normaliz = probR./sum(probR);  % normalizacion del vector probR.

%% Armado de la Ruleta:
ruleta(1) = probR_normaliz(1);
for k = 2:length(probR)  % M lanzamientos.
    ruleta(k) = probR_normaliz(k) + ruleta(k-1);
end

%% Lanzamiento:
tiro = rand;

%% Interpretando Resultado:

numZonas = length(ruleta);    % cantidad de divisiones en la ruleta.
indiv    = 1;                 % 1er zona de la ruleta.
while(tiro > ruleta(indiv) && indiv <= numZonas)
     indiv = indiv+1;    
end
numIndiv = indiv;  % Numero de individuo que se reproduce.

end

