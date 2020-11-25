%% ---------------------------------------------------------------------------
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

% -----------------------------------------------------------------------------

Nneuronas = 4;   % cantidad de neuranas en la 1er capa .
iter=200;

[out ECM]= getXOR(table.DosBits,yd.XOR2Bits ,Nneuronas , iter) ;


figure(1) ;
subplot(2,1,1) ; 
stem(yd.XOR2Bits ,'filled') ; grid on ; title(['Salida Deseada = [',num2str(yd.XOR2Bits ),']']) ;ylim([-2 2]) ;
subplot(2,1,2) ;
stem(out,'filled') ;grid on ; title(['Salida Obtenida = [',num2str(out'),']']) ;ylim([-2 2]) ;


figure(2)
plot(ECM,'linewidth',1.5) ; grid on ;


%yd.XOR2Bits
%out'

figure(2)
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