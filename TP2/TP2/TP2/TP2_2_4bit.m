% ---------------------------------------------------------------------------
%
%         TP2 : Perceptron 
%
%         Red Neuronal capaz de apreder XOR  de 2 y 4 bits
%
% ---------------------------------------------------------------------------- 

clear all, close all ; clc ; 

% ----------------------------------------------------------------------------

table.DosBits = [ -1 -1 1;1 -1 1; -1 1 1; 1 1 1];
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



tabla = table.DosBits ;
ydOut =   yd.XOR2Bits  ;

% yd.AND2Bits =  [-1 -1 -1 1]; 
% yd.AND4Bits =  [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1];  % AND  

% -----------------------------------------------------------------------------

etha = 1 ;    % Coeficiente de Aprendisaje
Beta = 1 ;    % Parametro que define la pendiente de tanh

 weight = rand(3,3)  ; 

% ---  valores aleatorios guardados ----

% weight= [ 0.012529   0.351107   0.433098 ;
%           0.845973   0.013279   0.774736 ;
%           0.579461   0.446288   0.671599 ] ;

% ----------------------------------------


% ---------- bucle para la tabla completa ---

delta = zeros(length(tabla(1,:)),1); 
deltaW = zeros(length(tabla(1,:)),length(tabla(1,:))) ;

out = zeros(4,1) ;

k = 1 ;

Limit = 0.01 ;

v= [] ;
ECM = [] ;


% -----------------------------------------------------------------------------

etha = 1 ;    % Coeficiente de Aprendisaje

Beta = 0.8 ;    % Parametro que define la pendiente de tanh
weight = rand(3,3) ;

% ---------- bucle para la tabla completa ---

delta = zeros(3,1); 
deltaW = zeros(3,3) ;

out = zeros(4,1) ;

%k = 1 ;

% Limit = 0.01 ;

for i=1:200
  
 % while(  norm(yd.XOR2Bits'-out) > Limit )
  
    for k =1:4

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
    deltaW(3,:) = etha*delta(3)*v' ;

    weight =  weight + deltaW ;  % Actualizar los pesos 

   end

    ECM = [ECM norm(yd.XOR2Bits-out')] ;
    % out ;
end

% -----------------------------------------------------------------------------

yd.XOR2Bits
out'

figure(1)
subplot(1,2,1) ;
plot(ECM,'linewidth',2) ; grid on ;
title('Error Cuadratico Medio') ;

subplot(1,2,2) ;
for i=1:4
      if(out(i)<0) plot(table.DosBits(i,1),table.DosBits(i,2),'ob') ; hold on ;
      else plot(table.DosBits(i,1),table.DosBits(i,2),'*r') ; hold on ;
      end
end
grid on ;
xlim([-2 2]) ; ylim([-2 2]) ; 
legend('-1','+1');
legend('show') ;
title('Perceptron : XOR 2-Bits') ;

% pause() ;
