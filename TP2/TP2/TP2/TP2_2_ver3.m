%% ---------------------------------------------------------------------------
%         TP2 : Perceptron 
%         Red Neuronal capaz de apreder XOR  de 2 y 4 bits
% ---------------------------------------------------------------------------- 
%   f(x,y,z) = (sen(x) + cos(y) + z)*1/3
%   x = [0: :2pi]
%   y = [0: :2pi]
%   z = [-1: : 1]
clear all, close all ; clc ;
% ----------------------------------------------------------------------------
DIM = 10;
iter = 600;

x = linspace(0,2*pi,DIM)';
y = linspace(0,2*pi,DIM)';
z = linspace(-1,1,DIM)';
ones = ones(DIM,1);
table.inputf = [x y z ones];
yd.outputf = (sin(x) + cos(y) + z)*1/3;

Nneuronas = 10;   % cantidad de neuranas en la 1er capa .
[out ECM]= getXOR(table.inputf,yd.outputf,Nneuronas,iter);

figure(1) ;
subplot(2,1,1) ; 
stem(yd.outputf,'filled') ; grid on ; title(['Salida Deseada = [',num2str(yd.outputf'),']']);ylim([-2 2]) ;
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

return
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