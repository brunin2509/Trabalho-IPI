close all;
clear all;
clc;

%comentario

I = imread('jailson.jpg');

figure; imshow(I); title('Imagem original');

Igray = rgb2gray(I);

Imf = medfilt2(Igray, [7 7]);

figure; imshow(Imf); title('Imagem com filtro de mediana');

Ibordas = edge(Imf, 'Canny');

figure;
imshow(Ibordas); title('Bordas');

b = strel('square', 2);
Idilatado = imdilate(Ibordas, b);

figure;
imshow(Idilatado); title('Bordas dilatadas');

Ifilt = bwareaopen(Idilatado, 300);
figure;
imshow(Ifilt); title('Bordas filtradas');

pause();
close all;
