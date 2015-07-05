close all;
clear all;
clc;

I = imread('Imagens/camaro.jpg');
%I = imread('maxresdefault.jpg');

%%%%%%%%%
% Parte A
%%%%%%%%%

% Para processar as bordas, é mais fácil trabalhar em níveis de cinza, pois
% a iluminação, neste caso, é o fator de maior preocupação.
Igray = rgb2gray(I);

% É aplicado um filtro de mediana para amenizar ruído salt and pepper 
% presente na imagem. Por ser pequeno (7x7), não prejudica as bordas.
Imf = medfilt2(Igray, [7 7]);

% Para obter as bordas, é usado o Canny. Uma de suas vantagens em relação
% ao Laplaciano, por exemplo, é que ele não gera bordas duplas.
Ibordas = edge(Imf, 'Canny', 0.15);

% É aplicada a dilatação para engrossar um pouco as bordas. O disk é foi 
% escolhido por ser o S.E. que deixa as bordas mais naturais.
b = strel('disk', 2);
Idilatado = imdilate(Ibordas, b);

% Por fim da parte A, bwareaopen apaga certas bordas com a área menor que
% 200, com o fim de não deixar a imagem tão saturada de bordas.
Ifilt = bwareaopen(Idilatado, 200);

%%%%%%%%%
% Parte B
%%%%%%%%%

Ifil_bilateral = uint8(colorBilateralFil(I, 9, 3, 5));

Imf2(:,:,1) = medfilt2(Ifil_bilateral(:,:,1), [7 7]);
Imf2(:,:,2) = medfilt2(Ifil_bilateral(:,:,2), [7 7]);
Imf2(:,:,3) = medfilt2(Ifil_bilateral(:,:,3), [7 7]);

Iquant = uint8((floor(double(Imf2)/16))*16);

Iresultante(:,:,1) = Iquant(:,:,1) .* uint8(~Ifilt);
Iresultante(:,:,2) = Iquant(:,:,2) .* uint8(~Ifilt);
Iresultante(:,:,3) = Iquant(:,:,3) .* uint8(~Ifilt);

%%%%%%%%%%%%%%%%%%%%%%%
% Resultados da parte A
%%%%%%%%%%%%%%%%%%%%%%%

figure; imshow(I); title('Imagem original');
pause();
figure; imshow(Imf); title('Imagem com filtro de mediana');
pause();
figure; imshow(Ibordas); title('Bordas');
pause();
figure; imshow(Idilatado); title('Bordas dilatadas');
pause();
figure; imshow(Ifilt); title('Bordas filtradas');
pause();

%%%%%%%%%%%%%%%%%%%%%%%
% Resultados da parte B
%%%%%%%%%%%%%%%%%%%%%%%

figure; imshow(Ifil_bilateral); title('Aplicacao do filtro bilateral');
pause();
figure;imshow(Imf2);title('Filtro de mediana na imagem colorida');
pause();
figure;imshow(Iquant);title('Imagem quantizada com 16 niveis');
pause();
figure;imshow(Iresultante);title('Imagem resultante');
pause();

close all;
