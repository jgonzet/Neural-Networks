% XOR
clear all, close all

dimInput   = 2 + 1; % Tamanio de la ENTRADA
dimHidde1  = 2;     % Tamanio de la 1er CAPA OCULTA
dimOutput  = 1;     % Tamanio de la SALIDA
cantInputs = 1;     % Cantidad de ENTRADAS (Filas de la tabla)

beta = 1;           % Parametro BETA de la Funcion de Activacion

x  = [   -1  -1      1;
         -1   1      1;
          1  -1      1;
          1   1      1];
x = x';
yd = [1 -1 -1  1];  % Salidas deseadas


W1 = rand(dimHidde1, dimInput      );   % Pesos para 1er Capa Oculta.
Ws = rand(dimOutput, dimHidde1 + 1 );   % Pesos para Capa Salida.

for i= 1:cantInputs
    
    % primer capa oculta:
    h1 = W1*x(:,i);
    v = [sigmoide(h1, beta);
         1];      % treshold

    % segunda capa oculta:
    % ...
    
    % ultima capa (salida):     
    hs = Ws*v(:,i);
    y = sigmoide(hs,beta);
    
    % error de propagacion de la salida.   
    delta_s = dsigmoide(hs,beta)*(yd(i) - y);
    % error de propagacion de la capa oculta 1.
    delta_1 = dsigmoide(h1',beta).*(Ws(1:end-1)*delta_s);
    
    % Actualizacion:
                                               
end



