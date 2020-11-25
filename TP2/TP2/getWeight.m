% ----------------------------------------------------------------------------
%
%
%          getWeight : se encarga de obtener el los coeficiente peso
%          weigth = coeficientes de pase aprtir de y deseado
%          yout = La salida que obtiene , es igual a yDeseado.
%
% ----------------------------------------------------------------------------

function [Weigth y_out]= getWeight(table,yd,CoefApred)
  
   Weigth = rand(1,length(table(1,:)))  ;  % Coeficiente de peso a obtener
  
  % CoefApred  ( Coeficiente de aprendisaje )
   y_out = zeros(1,length(table(:,1)))   ;   % Guardar la salida Obtenida 
   
   while(isequal(y_out,yd)~=1)
       for i=1:length(yd)
            y_out(i) =  signNeu(Weigth*table(i,:)');
            dW = CoefApred*(yd(i) - y_out(i))*table(i,:)';
            Weigth = Weigth + dW';
       end       
   end
  
end

% ----------------------------------------------------------------------------