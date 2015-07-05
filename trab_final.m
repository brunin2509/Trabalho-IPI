close all;
clear all;
clc;

I = imread('jailson.jpg');
%I = imread('maxresdefault.jpg');

figure; imshow(I); title('Imagem original');

%%%%%%%%%
% Parte A
%%%%%%%%%

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

%%%%%%%%%
% Parte B
%%%%%%%%%

Ifil_bilateral = uint8(colorBilateralFil(I, 9, 3, 5));

figure; imshow(Ifil_bilateral); title('Aplicacao do filtro bilateral');

Imf(:,:,1) = medfilt2(Ifil_bilateral(:,:,1), [7 7]);
Imf(:,:,2) = medfilt2(Ifil_bilateral(:,:,2), [7 7]);
Imf(:,:,3) = medfilt2(Ifil_bilateral(:,:,3), [7 7]);

figure;imshow(Imf);title('Filtro de mediana na imagem colorida');

Iquant = uint8((floor(double(Imf)/16))*16);

figure;imshow(Iquant);title('Imagem quantizada com 16 niveis');

Iresultante(:,:,1) = Iquant(:,:,1) .* uint8(~Ifilt);
Iresultante(:,:,2) = Iquant(:,:,2) .* uint8(~Ifilt);
Iresultante(:,:,3) = Iquant(:,:,3) .* uint8(~Ifilt);
figure;imshow(Iresultante);title('Imagem resultante');

pause();
close all;
