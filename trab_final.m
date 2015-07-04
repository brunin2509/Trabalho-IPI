close all;
clear all;
clc;

I = imread('jailson.jpg');

figure; imshow(I); title('Imagem original');

Igray = rgb2gray(I);

Imf = medfilt2(Igray, [7 7]);

figure; imshow(Imf); title('Imagem com filtro de mediana');
