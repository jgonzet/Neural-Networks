clear all, close all

x2 = [-1 -1 1; -1 1 1; 1 -1 1; 1 1 1];
x4 = [-1 -1 -1 -1 1;
      -1 -1 -1  1 1;
      -1 -1  1 -1 1;
      -1 -1  1  1 1;
      -1  1 -1 -1 1;
      -1  1 -1  1 1;
      -1  1  1 -1 1;
      -1  1  1  1 1;
       1 -1 -1 -1 1;
       1 -1 -1  1 1;
       1 -1  1 -1 1;
       1 -1  1  1 1;
       1  1 -1 -1 1;
       1  1 -1  1 1;
       1  1  1 -1 1;
       1  1  1  1 1];
x = x4; 
x = x';
tamin = 5;
tamout = 16;

W = rand(1,tamin);
yd2and = [-1 -1 -1 1];  % AND
yd2or = [-1 -1 -1 1];  % OR
yd4and = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1];  % AND
yd4or = [-1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];  % OR
yd = yd4or;

y_out = zeros(1,tamout) ; 
 
eta = 1;
h
%for k=1:10 
while(isequal(y_out,yd)~=1)
    for i=1:length(yd)
        y = signNeu(W*x(:,i));
        y_out(i) = y ;
        dW = eta*(yd(i) - y)*x(:,i);
        W = W + dW';
    end       
end

y_out
