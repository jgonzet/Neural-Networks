function [w] = signNeu(v)
% SIGNNEU: funcion signo.
%   Devuelve 1 salvo valores menores o igual
%   a cero entregando -1.
%
%   sintaxis: w = signNeu(v);
%   v:  matriz numerica.
%   w:  matriz numerica +-1.
    w = sign(v);
    [filw,colw] = size(w);
    for j=1:colw
        for i=1:filw
            if v(i,j) == 0
                w(i,j) = -1;
            end
        end   
    end
end