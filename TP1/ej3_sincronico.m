clc; clear all; close all;

%%Valores a usar
N = 1000;
p = 100;
percent = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];

%Generamos patrones aleatorios y calculamos la matriz W
P = sign(randn(N,p)); %p patrones(columnas) de N elementos.
W = P*P' - p*eye(N); 
e = [];

%borramos conexiones:
for i = 1:length(percent)
    X = rand(N) > percent(i);
    W_fea = W.*X;
    acumulado = 0;

    for j = 1:p
        entrada = P(:,j); %tomamos el patron(columna) j
        salida = signo(W_fea*entrada);
        hamming_error = sum(salida ~= entrada);
        acumulado = acumulado + hamming_error; %error para p patrones
    end
    e = [e, acumulado/(N*p)];
end

figure
plot(0:10:100 ,e,'-*','linewidth',1.5) ; grid on ; 
legend('Prob. de Error Bit') ;
legend('show') ;
xlabel('Porcentaje de Neuronas Eliminadas ') ;
ylabel('P Error') ;
ylim([0 0.8]) ;
set(gca,'fontsize',14) ; 
title('Prob de Error en Funcion de eliminar la red neuronal') ;


