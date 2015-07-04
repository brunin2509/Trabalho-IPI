clear all;
close all;
clc;

I = imread('jailson.jpg');
I = rgb2gray(I);
Imf = medfilt2(I, [7 7]);
figure; imshow(I); title('Imagem original');
figure; imshow(Imf); title('Imagem com filtro de mediana');