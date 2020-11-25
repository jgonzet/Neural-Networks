%% XOR con Perceptron Multicapa Mediante Algoritmo GENETICO
clear all, close all

%% Inicializaciones (EDITABLES):
M = 40;       % Cant. de individuos.

b = 0.001;     % Ajuste fino de la funcion de activacion de las neuronas.

numEntr = 2;   % Cantidad de entradas X. 

cantNeuCapas = [2 4 3];  % Cantidad de neuronas en cada CAPA OCULTA
                         %                   (Sin considerar la salida).
                         
cotaECM = 0.1; % cota ECM tolerable para finalizar algoritmo.

save 'paramet.mat'
saveXOR(cantNeuCapas,numEntr); % genera parametros del percep. Multicapa.
load 'XOR.mat';

%% Otras Inicializaciones:
gain    = 1000;           % (dispersion del random W)
                          % para generar w = gain*randn(M,N).

gainmut = 0.8;            % dispersion del random W para las mutaciones.

tiempo  = 0.2;             % tiempo para las pausas.
tiempo2 = 0.01;            % tiempo mas rapido.

fprintf(['Perceptron Multicapa - cantidad de capas: ' ...
          num2str(length(cantNeuCapas)) '\n'] )
for k=1:length(cantNeuCapas)
    fprintf(['- cantidad de neuronas en capa' num2str(k) ': ' ...
        num2str(cantNeuCapas(k)) '\n'])
end

%% Dimensionamiento:
N         = dimMulticapa(x,cantNeuCapas,yd);
%cantX     = 4;                           % cantidad de entradas x.
%cantCapa1 = 4;                           % cant. de neuronas en 1er capa
%cantCapa2 = 1;                           % salida (o capa 2).
%cantW1    = cantCapa1 + cantX*cantCapa1; % cant pesos en capa 1.
%cantW2    = cantCapa1 + cantCapa2;       % cant pesos en capa 2.
%N         = cantW1 + cantW2;             % Total de neur. de la red.

%% Poblacion Inicial:
w  = gain*randn(M,N); % inicializacion W ("Normal 0,1" para M individuos).

%% Plot inicial:
scrsz = get(0,'ScreenSize');
figure('Name',['Algoritmo Genetico - Perceptron Multicapa XOR '         ...
               '(INDIVIDUOS: ' num2str(M) '; BETA: ' num2str(b)         ...
             '; NEURONAS POR CAPA: ' num2str(cantNeuCapas) ')']...
               ,'NumberTitle','off',                                    ...
       'Position',[scrsz(3)/10 scrsz(4)/4 scrsz(3)/1.5 scrsz(4)/2])
subplot(2,2,1)
plot(w','*-','Linewidth',3), grid on
bordeY = gain*5; % borde para 'ylim'.
ylim([-bordeY bordeY])
title('Poblacion Inicial (P0)')

%% Desarrollo:
err = 1000*cotaECM;    % inicializacion.
i   = 1;               % contador de nro de poblacion.
while(err > cotaECM)
    %% FITNESS:
    [num,fit] = reproduccion(w);         % Sobreviven los mas aptos.
    [maximo,gen] = max(fit);             % mejor gen.
    w = nuevaPoblacion(w,num,fit);       % Nueva poblacion (ordenada
                                         % por de mayor a menor
                                         % fitness)
    subplot(2,2,[1 2])
    plot(w','*-','Linewidth',3), grid on, %axis square
    ylim([-bordeY bordeY])
    title(['(fitness) Poblacion P' num2str(i) ' - gen ' num2str(gen)])
    pause(tiempo)

    %% CROSSOVER:
    % cruce entre mas fuertes y reemplaza los mas debiles.
    [w(end-1,:) w(end,:)] = crossover(w);
    subplot(2,2,[1 2])
    plot(w','*-','Linewidth',3), grid on, %axis square
    ylim([-bordeY bordeY])
    title(['(crossover) Poblacion P' num2str(i) ' - gen ' num2str(gen)])
    pause(tiempo)    
   
    %% MUTACION:
    pesoMutado = randDiscreto(N);  % numero de peso W que se muta.
    mutacion = gainmut*gain*randn;
    w(end-3,:) = w(1,:);  % NOTA: en los 2 ultimos estan los crossover.
    w(end-3,pesoMutado) = mutacion + w(end-3,pesoMutado);
    subplot(2,2,[1 2])
    plot(w','*-','Linewidth',3), grid on, %axis square
    ylim([-bordeY bordeY])
    title(['(mutacion) Poblacion P' num2str(i) ' - gen ' num2str(gen)])
    pause(tiempo)    
    
    %% COMPARACION SALIDA Y e Y deseada:
    for k=1:length(x(:,1))  % respuesta XOR del mas apto.
        y(k,:) = pMultiCapa( x(k,:), [cantNCapas 1], w(1,:), b );
    end
    %% ECM:
    err(i) = 0;
    for k=1:length(yd(:,1))
        err(i) = err(i) + sum((yd(k,:) - y(k,:)).^2);
    end
    %% Mejor Fitness:
    evolBestFitness(i) = getFitnessXOR(w(1,:));

    %% PLOT Salidas:
    veces = 1;
    if mod(i,veces) == 0    % plotear cada cierta cantidad de veces.
        subplot(2,2,3)
        plot(1:length(y),y,'*r',1:length(yd),yd,'ob', 'Linewidth',3)
        title(['Salidas Y, Y_d -- ERROR(ECM): ' num2str(err(i)) ])
        ylim([-2 3]), grid on,% axis square
        legend('obtenido','desado','Location','best')
        subplot(2,2,4)
        [AX,H1,H2] = plotyy(1:i,err,1:i,evolBestFitness,'plot');
        set(get(AX(1),'Ylabel'),'String','ECM')
        set(get(AX(2),'Ylabel'),'String','MEJOR FITNESS')
        set(H1,'LineWidth',2), set(H2,'LineWidth',2)
        xlabel('nro. poblacion')
        title('ECM y Mejor Fitness')
        grid on
    end
    i = i + 1;
    
    if i == 10  % plots mas rapidos a partir de poblacion 10
        tiempo = tiempo2;
    end
%     %% INCORPORACION DE NUEVAS ESPECIES:
%     if mod(i,20) == 20-1
%         w(end-9:end-4,:) = gain*randn(9-4+1,N);
%     end    
end
%% Ultimo Plot Salidas:
subplot(2,2,3)
plot(1:length(y),y,'*r',1:length(yd),yd,'ob', 'Linewidth',3)
title(['Salidas Y, Y_d -- ERROR(ECM): ' num2str(err(end)) ])
ylim([-2 3]), grid on,% axis square
legend('obtenido','desado','Location','best')
subplot(2,2,4)
[AX,H1,H2] = plotyy(1:length(err),err,1:length(err),evolBestFitness,...
                                                               'plot');
set(get(AX(1),'Ylabel'),'String','ECM')
set(get(AX(2),'Ylabel'),'String','MEJOR FITNESS')
set(H1,'LineWidth',2), set(H2,'LineWidth',2)
xlabel('nro. poblacion')
title('ECM y Mejor Fitness')
grid on


