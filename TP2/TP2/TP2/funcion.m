% --------------------------------------------------------
%	
%	Funcion :  Funcion a utilizar.
%	Beta :  Define la pendiente en cero	 
%
%---------------------------------------------------------

function  [Result] = funcion(value,Beta)
        
	Result = tanh(Beta*value) ;
  
end

% ---------------------------------------------------------