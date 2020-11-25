function [ out ] = randDiscreto( rango )
% random discreto.
x = rand;
intervalos = linspace(0,1,rango+1);
for k = 1:rango
    if(x > intervalos(k) && x < intervalos(k+1))
        break
    end
end
out = k;
end

