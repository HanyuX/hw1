function out_img = q1_detectfacesColorAndGray( I,template,threshold )
% Returns the image with rectangles drawn at detected faces
%
% INPUT:
% I : [m_I x n_I x n_C] - 3D matrix representing image
% template : [m_T x n_T x n_C] - 3D matrix representing template
% threshold : [1 x 5] vector of threshold values
%
% NOTE: You don't have to use all of threshold vector values, some of them
% may be left unused.
%
% OUTPUT:
% out_img : [m_I x n_I x n_C] - color image with rectangles drawn at detected faces
%
% The function should call q1_detectfaces and q1_detectfacesHSV. 
% Then it should use both of their normalized cross correlation outputs (jointly) 
% to perform face detection.
[Img Cgray] = q1_detectfaces(I,template,0.3);
[Img Ccolor] = q1_detectfacesHSV(I,template,0.3);
C = 0.5*Cgray + 0.5*Ccolor;
[Y X] = ind2sub(size(C),find(C > 0.33)');
width = size(template,2) * ones(1, size(X,2));
height = size(template,1) * ones(1, size(Y,2));
I = q1_drawrectangles(I, X, Y, width, height);
out_img = I;
end

