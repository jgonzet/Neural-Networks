function [numR,fitR] = reproduccion(w)
% Descripcion: Para una poblacion de individuos con genes w(i,:), se los
% somete a la red multicapa XOR y se reproducen a la salida los resultados
% de las poblaciones mas aptas (por fitness).
%
%   p. ej.:  [numNuevos,fitNuevos] = reproduccion(wp0);
%
%   wp0:       Cada fila tiene los genes de cada individuo de la poblacion
%              inicial.
%
%   numNuevos: Lista con indices de los que se reproducen.
%   fitNuevos: Lista de fitness asociada a numNuevos.
%
M = length(w(:,1)); % cantidad de individuos en la poblacion.

%% Calculo Fitness para cada individuo de la poblacion:
for k=1:M       
    fitness(k) = getFitnessXOR(w(k,:));
end

%% Calculo de Probabilidad de Reproduccion de los Individuos:
totalfit = sum(fitness);
tablaPR  = fitness./totalfit;   % tabla de probabilidad de reprod. de
                                % cada individuo.
%% (Ruleta) - Reproduccion de Individuos.
for k = 1:M
    numR(k)=ruletaPoblacion(tablaPR); % lista Nros. de indiv. reproducidos
    fitR(k)=fitness(numR(k));
end 

end

