function [ trigg ] = triggerNeu(op, beta, x )
%Funcion de activacion de la neurona.
%
%     p. ej.:    s = triggerNeu(op, beta, h )
%
%     op:   opcion 0 o 1. Si vale 0 devuelve entre 0 y 1,
%           si vale 1, entre -1 y 1.
%     beta: Constante de ajuste de funcion.
%     x:    Entrada disparadora.
%
%     s:    Nivel de activacion de la neurona.

if     op == 0
    trigg = 1./(1+exp(-beta*x));
elseif op == 1
    trigg = tanh(beta*x);
else
    fprintf(2,'Error en argumento triggNeu. op debe valer 0 o 1.\n')
end

end
