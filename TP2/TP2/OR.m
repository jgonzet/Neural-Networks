clear all, close all

x = [-1 -1 1; -1 1 1; 1 -1 1; 1 1 1];
x = x';

W = rand(1,3);
yd = [-1 1 1 1];

y_out = zeros(1,4) ; 
 
eta = 1;

%for k=1:10 
while(isequal(y_out,yd)~=1)
    for i=1:4
        y = signNeu(W*x(:,i));
        y_out(i) = y ;
        dW = eta*(yd(i) - y)*x(:,i);
        W = W + dW';
    end       
end

y_out
