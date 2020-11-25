%% ----------------------------------------------------------------------
%
%
%
%
%------------------------------------------------------------------------


function [out ECM]= getXOR(tabla,ydeseado,Nneuronas,iter)


etha = 0.8 ;    % Coeficiente de Aprendisaje
Beta = 0.8;    % Parametro que define la pendiente de tanh

ECM = [] ;

out = zeros(length(ydeseado),1) ;
weight = rand(Nneuronas,length(tabla(1,:))) ;
weights = rand(1,Nneuronas+1) ;
% ---------- bucle para la tabla completa ---

delta = zeros(Nneuronas+1,1); 
deltaW = zeros(Nneuronas,length(tabla(1,:))) ;
deltaWs = zeros(1,Nneuronas+1) ;

out = zeros(length(tabla(:,1)),1) ;

    for i=1:iter

         for k =1:length(tabla(:,1))

            h =  weight(1:end,:)*tabla(k,:)' ;
            v = funcion( h,Beta) ;
            v = [v ;1] ;

            h(Nneuronas+1) = weights*v ; 

            out(k) =funcion(h(Nneuronas+1),Beta) ; 

             % delta(1) = delta_1 ; 
             % delta(2) = delta_2 ;
             % delta(3) = delta_s ;

            delta(Nneuronas+1) =  pfuncion(h(Nneuronas+1),Beta)*(ydeseado(k)-out(k)) ; 
            for j =1:Nneuronas
            delta(j) =  pfuncion(h(j),Beta)*weights(j)*delta(Nneuronas+1) ;
            end
            %delta(2) =  pfuncion(h(2),Beta)*weights(2)*delta(3) ; 
            for j = 1:Nneuronas
                deltaW(j,:) = etha*delta(j)*tabla(k,:) ;
               % deltaW(2,:) = etha*delta(2)*table.DosBits(k,:) ;
            end
            deltaWs = etha*delta(Nneuronas+1)*v' ;

            weight =  weight + deltaW ;  % Actualizar los pesos 
            weights = weights + deltaWs    ;
        end

        ECM = [ECM norm(ydeseado-out')] ;
    
    end


end

% --------------------------------------------------------------------------





