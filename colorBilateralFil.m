function[res] = colorBilateralFil(I, w, s_d, s_c)

I4 = imresize(I, 0.25);
s = size(I4);
fil = zeros(w,w);

for i = 1:w
    for j = 1:w
        fil(i, j) = exp(-((round(w/2)-i)^2 + (round(w/2)-j)^2)/(2*s_d^2));
    end
end

w2 = floor(w/2);
   
for i = 1:s(1)
    for j = 1:s(2)
        iInf = max(i-w2, 1);
        iSup = min(i+w2, s(1));
        jInf = max(j-w2, 1);
        jSup = min(j+w2, s(2));
      
        dR = I4(iInf:iSup, jInf:jSup, 1) - I4(i, j, 1);
        dG = I4(iInf:iSup, jInf:jSup, 2) - I4(i, j, 2);
        dB = I4(iInf:iSup, jInf:jSup, 3) - I4(i, j, 3);
        
        H = exp(-double(dR.^2 + dG.^2 + dB.^2)/(2*s_c^2));
        F = H.*fil((iInf:iSup)+w2-i+1, (jInf:jSup)-j+w2+1);
        norm = (sum(F(:)));
        
        res(i, j, 1) = sum(sum(F.*double(I4(iInf:iSup, jInf:jSup, 1))))/norm;
        res(i, j, 2) = sum(sum(F.*double(I4(iInf:iSup, jInf:jSup, 2))))/norm;
        res(i, j, 3) = sum(sum(F.*double(I4(iInf:iSup, jInf:jSup, 3))))/norm;
    end
end

res = imresize(res, 4);