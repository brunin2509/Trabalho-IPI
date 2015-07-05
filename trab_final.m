close all;
clear all;
clc;

%comentario

I = imread('jailson.jpg');
%I = imread('maxresdefault.jpg');

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

Ifil_bilateral = uint8(colorBilateralFil(I, 9, 3, 5));

figure; imshow(Ifil_bilateral); title('Aplicação do filtro bilateral');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ifil_bilateral = colorBilateralFil...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Imf(:,:,1) = medfilt2(Ifil_bilateral(:,:,1), [7 7]);

Imf(:,:,2) = medfilt2(Ifil_bilateral(:,:,2), [7 7]);

Imf(:,:,3) = medfilt2(Ifil_bilateral(:,:,3), [7 7]);

figure;imshow(Imf);title('Filtro de media na imagem colorida');

pause();
close all;
