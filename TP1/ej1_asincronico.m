clc; clear all; close all;

%%Abrimos archivos,iniciamos parametros:


img1 = imread('patron7.bmp');
img2 = imread('patron2.bmp');
img3 = imread('patron1.bmp');

s = size(img1);
N = s(1)*s(2);
p = 3;

p1 = double(reshape(img1(:,:,1),N,1))/255*2 - 1;
p2 = double(reshape(img2(:,:,1),N,1))/255*2 - 1;
p3 = double(reshape(img3(:,:,1),N,1))/255*2 - 1;
 
%Entrenamos y calculamos los Wij, segun regla Hebbiana:
P = [p1 p2 p3];
W = P*P' - p*eye(N);


%% Armamos una entrada con ruido y otra con estados espureos:
prob = .4; %porcentaje de ruido
ruido = []; %va a ser multipicativo
for i=1:N
    if rand < prob
        ruido = [ruido;-1];
    else
        ruido = [ruido; 1];
    end
end
in_noised = ruido.*p1;
in_espureo = P* [1;-1;0];

in = in_noised; %entrada a detectar

%filtrado(asincrónico)de la imagen:
out = in;
positions = randperm(N);

for i = 1:N
    k = positions(i);
    out(k)= signo(W(k,:)*out);%se va actualizando sobre sí misma
end

%redimensionamos para poder graficar:
img1 = reshape(p1,s(1),s(2));
img2 = reshape(p2,s(1),s(2));
img3 = reshape(p3,s(1),s(2));
in = reshape(in,s(1),s(2));
out = reshape(out,s(1),s(2));

figure
subplot(2,3,1), imshow(img1);
subplot(2,3,2), imshow(img2), title('Patrones');
subplot(2,3,3), imshow(img3);
subplot(2,3,4), imshow(in), title('Entrada');
subplot(2,3,6), imshow(out), title('Salida');


