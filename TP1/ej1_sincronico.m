clc; clear all; close all;

%%Abrimos archivos,iniciamos parametros:

p = 3;
img1 = imread('patron7.bmp');
img2 = imread('patron2.bmp');
img3 = imread('patron1.bmp');

s = size(img1);
largo = s(1)*s(2);

A = double( reshape( img1(:,:,1),largo,1 ) )/255*2 - 1;
B = double( reshape( img2(:,:,1),largo,1 ) )/255*2 - 1;
C = double( reshape( img3(:,:,1),largo,1 ) )/255*2 - 1;
 
%Entrenamos y calculamos los Wij, segun regla Hebbiana:
ABC = [A B C];
W = ABC*ABC' - p*eye(largo);


%% Armamos una entrada con ruido y otra con estados espureos:

prob = .4; %si es mayor a 50%, llegamos al patrón inverso
ruido = []; %multipicativo

for i=1:largo
    if rand < prob
        ruido = [ruido;-1];
    else
        ruido = [ruido; 1];
    end
end
in_noised = ruido.*A;

%combinamos los distintos patrones
in_espureo = ABC* [0.49;0.51;0];

in = in_espureo; %entrada a detectar

%filtrado(sincrónico)de la imagen:
steps = 0;
distance = 1;
aux = in;

while distance
    salida = signo(W*aux);
    distance = largo-sum(eq(salida,aux)); %distancia de Hamming
    steps = steps+1;
    aux = salida;
end

%redimensionamos para graficar:
img1 = reshape(A,s(1),s(2));
img2 = reshape(B,s(1),s(2));
img3 = reshape(C,s(1),s(2));

in = reshape(in,s(1),s(2));
aux = reshape(aux,s(1),s(2));
out = reshape(salida,s(1),s(2));

figure
subplot(2,3,1), imshow(img1);
subplot(2,3,2), imshow(img2), title('Patrones');
subplot(2,3,3), imshow(img3);
subplot(2,3,4), imshow(in), title('Entrada');
subplot(2,3,5), imshow(aux), title('Estado anterior');
subplot(2,3,6), imshow(out), title('Salida');


