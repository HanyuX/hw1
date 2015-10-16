function out_img = q1_drawrectangles( I, x, y, width, height )
% Returns the image I with overlaid unfilled red rectangles of sizes and
% locations specified by x, y, width and height
%   
%
% INPUT:
% I : [M x N x n_C] - 3D matrix representing image
% x, y : [1 x K] vectors of coordinates of top-left corners of the
% rectangles
% width, height : [1 x K] vectors of sizes of the rectangles
%
%
%
%
%OUTPUT:
% out_img: [M x N x n_C] - 3D matrix of resulting image
%

for i = 1 : size(x,2),
    width(1,i) = min(size(I,2)-x(1,i)+1, width(1,i));
    height(1,i) = min(size(I,1)-y(1,i)+1,height(1,i));
    if width(1,i) == 1,
        row_x = x(1,i) * ones(1,height(1,i));
        row_y = y(1,i):1:height(1,i)+y(1,i)-1;
    elseif height(1,i) == 1,
        row_x = x(1,i):1:width(1,i)+x(1,i);
        row_y = y(1,i) * ones(1,width(1,i));
    else
        X1 = x(1,i) * ones(1,height(1,i));
        X2 = X1 + (width(1,i)-1);
        X3 = x(1,i)+1:1:width(1,i)-2+x(1,i);
        row_x = [X1 X3 X2 X3];
    
        Y1 = y(1,i):1:height(1,i)+y(1,i)-1;
        Y2 = y(1,i) * ones(1,width(1,i)-2);
        Y3 = Y2 + (height(1,i)-1);
        row_y = [Y1 Y2 Y1 Y3];
    end
    
    index = sub2ind(size(I),row_y,row_x);
    I(index) = 255;
    index = sub2ind(size(I),row_y,row_x,2*ones(1,size(row_x,2)));
    I(index) = 0;
    index = sub2ind(size(I),row_y,row_x,3*ones(1,size(row_x,2)));
    I(index) = 0;
end
    out_img = I;
end

