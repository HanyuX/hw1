function q1c()

% Depends on:
% q1_drawrectangles
% q1_normalized_correlation

c1 = checking('q1a');
c2 = checking('q1b');
c3 = checking('q1c');

if c1+c2+c3 == 0
    % case 1
    I = imread('soccer_team.jpg');
    T = imread('template.jpg');
    threshold = 0.5;

    [out_HSV C_HSV] = q1_detectfacesHSV(I, T, threshold);
    imshow(out_HSV);
end
end
