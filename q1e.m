function q1e()


% Depends on:
% q1_drawrectangles
% q1_normalized_correlation
% q1_detectfaces
% q1_detectfacesHSV_

c = checking('q1a');
c = c + checking('q1b');
c = c + checking('q1c');
%c = c + checking('q1e');

% change the values in threshold to produce the best face detection
% results depending on your implementation strategy, but don't change the 
% dimensionality (i.e., threshold should remain a 1x5 matrix)
threshold = [0 0 0 0 0];

if c == 0
    % case 1
    I = imread('soccer_team.jpg');
    T = imread('template.jpg');

    imshow(q1_detectfacesColorAndGray(I, T, threshold));

end
end
