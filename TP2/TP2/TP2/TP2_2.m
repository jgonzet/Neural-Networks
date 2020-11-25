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
table.CuatroBits =   [-1 -1 -1 -1 1;
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
yd.XOR2Bits =  [-1 1 1 -1];  % XOR-2Bits
yd.XOR4Bits =  [-1 1 1 -1 1 -1 -1 1 1 -1 -1 1 -1 1 1 -1];  % XOR-4Bits

% yd.AND2Bits =  [-1 -1 -1 1]; 
% yd.AND4Bits =  [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1];  % AND  

% -----------------------------------------------------------------------------

etha = 1 ;    % Coeficiente de Aprendisaje
Beta = 1 ;    % Parametro que define la pendiente de tanh

weight = rand(3,3) ;

% ---------- bucle para la tabla completa ---

delta = zeros(3,1); 
deltaW = zeros(3,3) ;

out = zeros(4,1) ;

k = 1 ;

Limit = 0.01 ;

for i=1:200
  
 % while(  norm(yd.XOR2Bits'-out) > Limit )
  
    for k =4:-1:1

    h =  weight(1:2,:)*table.DosBits(k,:)' ;
    v = funcion( h,Beta) ;
    v = [v ;1] ;

    h(3) = weight(3,:)*v ; 
     
    out(k) =funcion(h(3),Beta) ; 
     
     % delta(1) = delta_1 ; 
     % delta(2) = delta_2 ;
     % delta(3) = delta_s ;
     
    delta(3) =  pfuncion(h(3),Beta)*(yd.XOR2Bits(k)-out(k)) ; 
    delta(1) =  pfuncion(h(1),Beta)*weight(3,1)*delta(3) ; 
    delta(2) =  pfuncion(h(2),Beta)*weight(3,2)*delta(3) ; 
    
    deltaW(1,:) = etha*delta(1)*table.DosBits(k,:) ;
    deltaW(2,:) = etha*delta(2)*table.DosBits(k,:) ;
    deltaW(3,:) = etha*delta(3)*v ;

    weight =  weight + deltaW ; 

    end

    % out ;
end

% -----------------------------------------------------------------------------

yd.XOR2Bits
out'

%delta.uno =  []  ;
%delta.dos =  []  ;
%delta.s  =   []  ;

%delt.uno = pfuncion(1,Beta) ;

% pause() ; % Para salir , pulsar Enter


