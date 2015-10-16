function q1b()

% depends on q1_drawrectangls

 c1 = checking('q1a');
 c2 = checking('q1b');

if c1 + c2 == 0
    % case 1
    I = imread('soccer_team.jpg');
    T = imread('template.jpg');
    threshold = 0.33;

    [out C] = q1_detectfaces(I, T, threshold);
    imshow(out);
end
end
