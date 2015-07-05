function[im] = colorBilateralFil(I, w, s_d, s_c)

I4 = imresize(I, 0.25);
s = size(I4);
fil = zeros(w,w);

w = 9
s_d = 3;

for i = 1:w
    for j = 1:w
        fil(i, j) = exp(-((round(w/2)-i)^2 + (round(w/2)-j)^2)/(2*s_d^2));
    end
end

w2 = floor(w/2);

B = zeros(sIm);
   
for i = 1:s(1)
    for j = 1:s(2)
        iInf = max(i-w, 1);
        iSup = min(i+w, s(1));
        jInf = max(j-w, 1);
        jSup = min(j+w, s(2));
        for k = iInf:iSup,
            for m = jInf:jSup,
               
            end
        end
        
        
    end
end