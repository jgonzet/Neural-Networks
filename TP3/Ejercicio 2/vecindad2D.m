function [ lambda ] = vecindad2D(coord_Neu, ganadora, sigma)
    d = coord_Neu - ganadora;
    lambda = exp(-(d(1)^2 + d(2)^2)/(2*(sigma)^2));   % distancia euclidiana.
end