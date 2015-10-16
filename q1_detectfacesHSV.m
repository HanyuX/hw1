function [out_img C] = q1_detectfacesHSV( I,template,threshold )
% Returns the image with rectangles drawn at detected faces and
% the normalized cross correlation output (computed on hue channels)
% 
%
% INPUT:
% I : [m_I x n_I x n_C] - 3D matrix representing image
% template : [m_T x n_T x n_C] - 3D matrix representing template
% threshold : scalar
%
% OUTPUT:
% out_img : [m_I x n_I x n_C] - color image with rectangles drawn at detected faces
% C: [m_I x n_I] - normalized cross correlation output
%
% Invoke rgb2hsv to convert image and template to HSV format
% Invoke q1_normalized_correlation to calculate normalized cross
% correlation using the hue channels of the image and the template
% Invoke q1_drawrectangles to draw rectangles
Ihsv = rgb2hsv(I);
Ihsv = Ihsv(:,:,1);
templatehsv = rgb2hsv(template);
templatehsv = templatehsv(:,:,1);
C = q1_normalized_correlation(Ihsv,templatehsv);
[Y X] = ind2sub(size(C),find(C > threshold)');
width = size(template,2) * ones(1, size(X,2));
height = size(template,1) * ones(1, size(Y,2));
I = q1_drawrectangles(I, X, Y, width, height);
out_img = I;
end

