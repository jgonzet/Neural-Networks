% ------------------------------------------------------------
%	
%	Funcion :  pFuncion, es la derivada de funcion 
%	Beta :  Define la pendiente en cero	 
%
%-------------------------------------------------------------

function  [Result] = pfuncion(value,Beta)
        
	Result =Beta*(1-(funcion(value,Beta))^2 ) ;
  
end

% ------------------------------------------------------------


