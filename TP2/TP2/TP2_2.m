% ---------------------------------------------------------------------------
%
%         TP2 : Perceptron 
%
%         Red Neuronal capaz de apreder XOR  de 2 y 4 bits
%
% ---------------------------------------------------------------------------- 

clear all, close all ; clc ; 


% ----------------------------------------------------------------------------

table.DosBits = [-1 -1 1; -1 1 1; 1 -1 1; 1 1 1];
table.CuatroBits = [-1 -1 -1 -1 1;
      -1 -1 -1  1 1;
      -1 -1  1 -1 1;
      -1 -1  1  1 1;
      -1  1 -1 -1 1;
      -1  1 -1  1 1;
      -1  1  1 -1 1;
      -1  1  1  1 1;
       1 -1 -1 -1 1;
       1 -1 -1  1 1;
       1 -1  1 -1 1;
       1 -1  1  1 1;
       1  1 -1 -1 1;
       1  1 -1  1 1;
       1  1  1 -1 1;
       1  1  1  1 1];
yd.XOR2Bits =  [-1 1 1 -1]; 
yd.XOR4Bits =  [1 1 -1 1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1];  % XOR  

eta = 1;  % Coeficiente de aprendisaje 

% Declaro las estructuras 
W.XOR2Bits = [] ; W.XOR4Bits = [] ;
out.XOR2Bits =[] ; out.XOR4Bits = [] ;

% Obtengo los pesos para XOR de 2 y 4 Bits :
[W.XOR2Bits out.XOR2Bits]= getWeight2(table.DosBits,yd.XOR2Bits,eta) ;

return



[W.OR4Bits  out.OR4Bits] = getWeight2(table.CuatroBits,yd.OR4Bits,eta) ;

out.OR2Bits
out.OR4Bits
out.AND2Bits
out.AND4Bits






