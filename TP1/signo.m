%% -----------------------------------------------------------------------
%   Definimos la funcion signo como en el libro(pag. 13)
% -------------------------------------------------------------------------

function [sig] = signo(dato)
sig=[] ;
    for k =1:length(dato)
            if (dato(k) == 0) sig = [sig; 1];
            else sig = [sig; sign(dato(k))] ; 
            end
    end 
end

