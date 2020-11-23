clc; clear all; close all;

%generamos las variables para trabajar:

N = 10;
T = 6:-0.01:0;
sigma = zeros(N+2,N+2);
sigma(2:11,2:11) = sign(randn(N));

for j = 1:length(T)
    for k = 1:10 %10 recorridos a la matriz
        E0 = energia(sigma);
        for fil = 2:N+1
            for col = 2:N+1
                sigma(fil,col) = (-1)*sigma(fil,col);
                E1 = energia(sigma);
                deltaE = E1-E0;               
                
                if deltaE > 0  %si no bajó la energia, tiramos la moneda
                  if rand >= exp(-deltaE/(T(j))) 
                      sigma(fil,col) = (-1)*sigma(fil,col); %volvemos atrás el cambio
                   end
                end
                
                E0 = energia(sigma); %actualizamos la energia final                
            end
        end
        M(j,k) = sum(sum(sigma)); %sumamos los spines
    end
end

%graficamos
plot(T,M(:,10),'LineWidth',1.5), grid on, ylabel('M'), xlabel('T')