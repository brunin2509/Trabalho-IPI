function[im] = colorBilateralFil(I, w, s_d, s_c)

I4 = imresize(I, 0.25);
sIm = size(I4);

[X,Y] = meshgrid(-w:w, -w:w);
G = exp(-(X.^2 + Y.^2)/(2*s_d^2));

B = zeros(sIm);

for d = 1:s(3)    
    for i = 1:s(1)
        for j = 1:s(2)
                        
        end
    end
end

im = imresize(B, 4);

end