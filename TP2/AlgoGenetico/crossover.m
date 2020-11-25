function [ w1, w2 ] = crossover( w )
N = length(w(1,:));
M = length(w(:,1));

corte = randDiscreto(N);        % corte aleatorio de W.
while(corte == 1 || corte == N) % con esto se asegura que corta.
    corte = randDiscreto(N);
end
gen2 = 2;
while(w(1,:) == w(gen2,:))
    gen2 = gen2 + 1;
    % con esto se evita que sean el mismo
    if gen2 == M;
        break
    end
end
%% Cruce:
w1(1,:) = [ w( 1  , 1:corte )  w(gen2, corte+1:end ) ];
w2(1,:) = [ w(gen2, 1:corte )  w( 1  , corte+1:end ) ];

end

