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

Ifiltrado = colorBilateralFil(I, 9, 3, 3);

figure; ishow(Ifiltrado); title('Aplicação do filtro bilateral');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ifil_bilateral = colorBilateralFil...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Imf = medfilt2(Ifil_bilateral, [7 7]);



pause();
close all;
