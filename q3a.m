function q3a()

% Compute the vanilla solution

ret_code = checking('q3a');

if(ret_code ~= 0)
    fprintf(1, 'Checking q3a did not pass. Not executing this script file q3a.m\n');
    return
end

I = imread('flowerscene.jpg');
I = I(1:100,1:100,:);
h_d = 11;
sigma_d = 5;
sigma_r = 64;

tic;
output = q3_bilateralfiltering_vanilla(I, h_d, sigma_d, sigma_r);
elapsed_time = toc;

imshow(uint8(output));

fprintf(1, 'Elapsed runtime for vanilla bilateral filtering is : %f seconds.\n', elapsed_time);


end

