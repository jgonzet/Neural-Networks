% ----------------------------------------------------------------------------
%
%
%          getWeight : se encarga de obtener el los coeficiente peso
%          weigth = coeficientes de pase aprtir de y deseado
%          yout = La salida que obtiene , es igual a yDeseado.
%
% ----------------------------------------------------------------------------

function [Weigth y_out]= getWeight2(tabla,yd,CoefApred)
beta = 1;

Weigth = rand(3,3);


for i=1:4
    V = tanh(Weigth*tabla(i,:));
    V(3) = 1;
    hs =Weigth(3,:)*V;
    y = tanh(beta*hs);
    g_punto = beta*(1 - y^2);

    delta_s = g_punto*(yd(i) - y);
end








end

% ----------------------------------------------------------------------------