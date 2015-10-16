function q1a()


c = checking('q1a');

if c == 0
    % case 1
    I = imread('soccer_team.jpg');
    x = [26 65 151 223 286 328 334 276 201 145 88];
    y = [37 24 25 15 17 14 93 99 91 95 115];
    width = [26 28 28 27 27 27 32 29 31 31 22];
    height = [36 36 33 34 32 32 33 30 37 45 25];

    imshow(q1_drawrectangles(I, x, y, width, height));

end
end
