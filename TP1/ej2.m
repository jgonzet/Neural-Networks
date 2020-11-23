clc; clear all; close all;

N = 1000;
rango = 2; 

tabla_error = [0.001, 0.0036, 0.01, 0.05, 0.1];
tabla_patrones = [0.105, 0.138, 0.185, 0.37, 0.61]*N;

size_tabla = length(tabla_error);
error_k = [];
error_total = [];

for i = 1:size_tabla
    
    p = ceil(tabla_patrones(i));
    
    %generamos patrones aleatorios y calculamos su respectiva W:
    for k = p-rango:p+rango
        P = sign(randn(N,k)); %k patrones(columnas) de N elementos.
        W = P*P' - k*eye(N);        
        
        %probamos la estabilidad de los p patrones:
        acumulado = 0;
        for j = 1:k
            entrada = P(:,j); %tomamos el patron(columna) j
            salida = signo(W*entrada);
            hamming_error = sum(salida ~= entrada); %suma las diferencias
            acumulado = acumulado + hamming_error/(N*k); %error para k patrones
        end        
        error_k = [error_k, acumulado];
    end
    error_total = [error_total; error_k];
    
    %GRAFICOS (robados a Andrés)
    subplot(size_tabla,1,i)
    plot(p-rango:p+rango,error_k,'-o','linewidth',1.5) ; grid on  ; hold on ;
    plot(p,tabla_error(i),'xr','linewidth',2.50) ; 
    ylabel('Perror');
    legend('Prob Error Bit practica','Prob Error Bit Tabla') ;
    legend('show') ;
    set(gca,'fontsize',12) ; 
    
    error_k = []; %vaciamos
end

 subplot(5,1,1) ; title('Probabilidad de Error de Bit en Funcion de m-patrones') ;
