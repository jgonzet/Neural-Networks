function [y,W] = perceptronSimple(x,yd,eta)
% PERCEPTRONSIMPLE Algoritmo de perceptron simple:
% 1) y_i = sign(w1*x1 + w2*x2 + w3*x3)
% 2) arrayDelta_W = eta*arrayX*(yd_i - y_i)
% 3) arrayW_n+1 = arrayW_n + arrayDelta_W
%
%   [y,W] = perceptronSimple(x, yd, eta)
%   Entradas <<
%   x:      Tabla de entradas.
%   yd:     Salidas deseadas.
%   eta:    Constante de aprendizaje.
%   Salidas >>
%   y:      Salida aprendida.
%   W:      Vector de pesos de aprendizaje.
[tamout,tamin]  = size(x);
y  = zeros(1,length(yd));  
W  = rand (1,tamin);
dW = zeros(1,tamin);

cont = 0;
while(isequal(y,yd) ~= 1)   % Hasta que y == yd
    perm = randperm(tamout);
    cont = cont + 1;
    for j = 1:tamout;
        i = perm(j);    % indice aleatorio
        entradas_i = x(i,:)';
        salida_i = signNeu(W*entradas_i);
        y(i) = salida_i;
        err = (yd(i) - y(i));
        dW = eta*err*x(i,:);
        W = W + dW;
    end
    y_tabla(cont,:) = y;
end
%figure, plot(y_tabla','o--'), legend('show')
%title('Convergencia de la salida Y')
y_tabla
end