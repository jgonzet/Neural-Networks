function [ lambda ] = vecindad(numNeurona, ganadora, sigma) 
    lambda = exp(-(numNeurona - ganadora)^2/(2*(sigma)^2)  );
end

