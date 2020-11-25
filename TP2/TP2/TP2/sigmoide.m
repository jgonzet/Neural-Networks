function [ s ] = sigmoide( h, b )
%SIGMOIDE Funcion de activacion de la neurona
%   [s] = sigmoide(h,beta);
%   entradas <<
%       array   h:      argumento de la funcion
%       double  beta:   parametro beta de la sigmoide
%   salidas >>
%       double  s:      s = tanh(beta*h)
s = tanh(b*h);
end

