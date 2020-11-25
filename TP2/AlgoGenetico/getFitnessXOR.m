function [ fitness ] = getFitnessXOR(w)
% Devuelve el fitness del gen w. El fitness se mide como el
% Error Cuadratico Medio de las salidas del percep. multicapa 'XOR.mat'.
% dados los pesos W.
load XOR.mat
load paramet.mat

% Es necesario para incluir a la salida como ultima capa de la red.
cantNCapas = [cantNCapas, length(yd(1,:)) ];

%% Salidas Y de perceptron multicapa W para posibles entradas X:
% carga en Y todas las salidas de la red de pesos W para las entradas X.
for n = 1:length(x(:,1)) 
    y(n,:) = pMultiCapa(x(n,:),cantNCapas,w,b);
end

%% Error Cuadratico Medio (ECM):
ecmMAX = 4;    % constante. Maximo valor de ECM (segun peor caso).

ecm = 0;    % inicializacion para el calculo.
for i=1:length(yd(:,1))
    ecm = ecm + sum((yd(i,:) - y(i,:)).^2);
end
ecm = ecm/length(yd);  % error cuadratico medio.
   
%% Determinacion de Fitness para cada individuo:
fitness = ecmMAX - ecm;

end

