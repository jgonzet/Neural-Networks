function [E0] = energia(sigma)

N = length(sigma) - 2;
E0 = 0;
for fil_i = 2:N+1
    for col_i = 2:N+1
        E0 = E0 - sigma(fil_i,col_i)*( sigma(fil_i,col_i-1) + ...
                                       sigma(fil_i,col_i+1) + ...
                                       sigma(fil_i-1,col_i) + ...
                                       sigma(fil_i+1,col_i) );
    end
end
end
