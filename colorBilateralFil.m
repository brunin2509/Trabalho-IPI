function[res] = colorBilateralFil(I, w, s_d, s_c)

%Primeiramente, é feito um decaimento, para compensar a complexidade da
%função em si.
s_original = size(I);
I4 = imresize(I, 0.25);
s = size(I4);
fil = zeros(w,w);

%Geração da máscara gaussiana.
for i = 1:w
    for j = 1:w
        fil(i, j) = exp(-((round(w/2)-i)^2 + (round(w/2)-j)^2)/(2*s_d^2));
    end
end

w2 = floor(w/2);
   
for i = 1:s(1)
    for j = 1:s(2)
        %Delimita os blocos dentro da imagem para cada pixel.
        iInf = max(i-w2, 1);
        iSup = min(i+w2, s(1));
        jInf = max(j-w2, 1);
        jSup = min(j+w2, s(2));
      
        %Para cada bloco de cada pixel, é feita a diferença de intensidade
        %de cada pixel do bloco com o pixel (i,j). Isso ocorre em cada cor
        %do RGB.
        dR = I4(iInf:iSup, jInf:jSup, 1) - I4(i, j, 1);
        dG = I4(iInf:iSup, jInf:jSup, 2) - I4(i, j, 2);
        dB = I4(iInf:iSup, jInf:jSup, 3) - I4(i, j, 3);
        
        %O H é uma gaussiana em função das diferenças dos níveis de cores.
        %O F é uma multiplicação entre as duas gaussianas.
        %norm é o peso de cada pixel, que é gerado pela soma de todos os
        %valores da matriz F.
        H = exp(-double(dR.^2 + dG.^2 + dB.^2)/(2*s_c^2));
        F = H.*fil((iInf:iSup)+w2-i+1, (jInf:jSup)-j+w2+1);
        norm = sum(F(:));
        
        %Aplicação do fórmula em si.
        res(i, j, 1) = sum(sum(F.*double(I4(iInf:iSup, jInf:jSup, 1))))/norm;
        res(i, j, 2) = sum(sum(F.*double(I4(iInf:iSup, jInf:jSup, 2))))/norm;
        res(i, j, 3) = sum(sum(F.*double(I4(iInf:iSup, jInf:jSup, 3))))/norm;
    end
end

res = imresize(uint8(res), [s_original(1) s_original(2)]);

end