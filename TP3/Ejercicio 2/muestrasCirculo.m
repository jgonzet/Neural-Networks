function [ x ] = muestrasCirculo( cantMuestras, radio )
i = 1;
while i <= cantMuestras 
    u = (2*rand(1,2) - 1)*radio;
    if (u(1)^2 + u(2)^2) <= radio^2
        x1(i) = u(1);
        x2(i) = u(2);
        i = i + 1;
    end    
end
x = [x1; x2]';
end