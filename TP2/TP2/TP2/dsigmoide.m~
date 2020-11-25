function [ s ] = dsigmoide( h, b )
%DSIGMOIDE Derivada de la Funcion de activacion de la neurona
%   [s] = dsigmoide(h,beta);
%   entradas <<
%       array   h:      argumento de la funcion
%       double  beta:   parametro beta de la sigmoide
%   salidas >>
%       double  s:      s = (tanh(beta*h))' = beta*( 1-[sigmoide(h)^2] )
s = b*(1 - (sigmoide(h,b)).^2);
end