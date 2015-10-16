function[result] = q3_bilateralfiltering_vanilla(I, h_d, sigma_d, sigma_r)

% This function applies the bilateral filter to a given image
% The filtering can be implemented in a naive manner using nested for loops
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
result = I;
for i = 1:size(I,1),
     for j = 1:size(I,2),
         colorA = zeros(1,3);
         weightA = 0;
         for m = -(h_d-1)/2:1:(h_d-1)/2,
              for n = -(h_d-1)/2:(h_d-1)/2,
                    if(i+m < 1 || i+m > size(I,1) || j+n < 1 || j+n > size(I,2)),
                    else
                        color = I(i+m,j+n,:);
                        color = double(color(:)');
                        a = I(i,j,:);
                        a = double(a(:)');
                        do_t = (color(1)-a(1))^2 + (color(2)-a(2))^2 + (color(3)-a(3))^2;
                        w = exp(-(m^2 + n^2)/(2*sigma_d*sigma_d) - do_t/(2*sigma_r*sigma_r));
                        colorA = colorA + w*color;
                        weightA = weightA + w;
                    end  
               end
         end
         colorA = colorA/weightA;
         result(i,j,:) = reshape(colorA,[1,1,3]);
     end
 end
end