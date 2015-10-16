function[result] = q3_bilateralfiltering_optimized(I, h_d, sigma_d, sigma_r)

% This function applies the bilateral filter to a given image
% The implementation should be as efficient as possible
%
% Input :
% I       is a QxRx3 matrix, the input color image
% h_d     is a scalar, the size of the bilateral filter (i.e., the filter is h_d x hd)
%         you can safely assume that h_d is an odd integer
%
% sigma_d is a scalar, a parameter of the filter (see eq. 7)
% sigma_r is a scalar, a parameter of the filter (see eq. 7)
%
% Output:
% result  is a QxRx3 matrix, the output color image obtained by applying bilateral filtering to I
%
w = (h_d-1)/2;
I = double(I);
[X,Y] = meshgrid(-w:w,-w:w);
C = exp(-(X.^2+Y.^2)/(2*sigma_d^2));
widthI = size(I,1);
heightI = size(I,2);
Pr = 2*sigma_r^2;

wP = zeros(widthI+2*w,heightI+2*w);
boardI = zeros(widthI+2*w,heightI+2*w,3);
boardY = boardI;
resultTemp = boardI;
boardY(w:(w+widthI-1),w:(w+heightI-1),:) = I;

for i = 1:h_d,
    for j = 1:h_d,
       boardN = boardI;
       boardN(i:(i+widthI-1),j:(j+heightI-1),:) = I;
       minus = (boardN - boardY).^2;
       minusAnd = sum(minus,3)/Pr;
       guaNow = zeros(widthI+2*w,heightI+2*w) * C(h_d - i + 1,h_d - j +1);
       wNow = exp(-guaNow - minusAnd);
       wNow3 = zeros(widthI+2*w,heightI+2*w,3);
       wNow3(:,:,1) = wNow;
       wNow3(:,:,2) = wNow;
       wNow3(:,:,3) = wNow;
       wP = wP + wNow;
       resultTemp = resultTemp + wNow3 .* boardN;
    end
end
wp3 = zeros(widthI+2*w,heightI+2*w,3);
wp3(:,:,1) = wP;
wp3(:,:,2) = wP;
wp3(:,:,3) = wP;
resultTemp = resultTemp ./ wp3;
result = resultTemp(w:(w+widthI-1),w:(w+heightI-1),:);
end