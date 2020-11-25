% ---------------------------------------------------------------------------
%
%         TP2 : Perceptron 
%
%         Red Neuronal capaz de apreder AND y OR  de 2 y 4 bits
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
yd.OR2Bits =  [-1 1 1 1];  % OR
yd.OR4Bits =  [-1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];  % OR
yd.AND2Bits =  [-1 -1 -1 1]; 
yd.AND4Bits =  [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1];  % AND  

eta = 0.1;  % Coeficiente de aprendisaje 

% Declaro las estructuras 
W.OR2Bits = [] ; W.OR4Bits = [] ; W.AND2Bits = [] ; W.AND4Bits = [] ;
out.OR2Bits =[] ; out.OR4Bits = [] ; out.AND2Bits = [] ; out.AND4Bits = [] ; 


% Obtengo los pesos para OR de 2 y 4 Bits :
[W.OR2Bits out.OR2Bits]= getWeight(table.DosBits,yd.OR2Bits,eta) ;
[W.OR4Bits  out.OR4Bits] = getWeight(table.CuatroBits,yd.OR4Bits,eta) ;

% Obtengo los pesos para AND de 2 y 4 Bits :
[W.AND2Bits out.AND2Bits]= getWeight(table.DosBits,yd.AND2Bits,eta) ;
[W.AND4Bits  out.AND4Bits] = getWeight(table.CuatroBits,yd.AND4Bits,eta) ;

% ---- Patrones aprendidos  AND y OR de 2 Bits-----
figure(1) ; 
plotResult(table.DosBits,out.OR2Bits) ;   % Grafica de OR 2 Bits
title('\bfSalidas OR 2 Bits ') ;

figure(2) ; 
plotResult(table.DosBits,out.AND2Bits) ;  % Grafica de AND 2 Bits
title('\bfSalidas AND 2 Bits ') ;

pause() ; % mantener desde la terminal los plots 




