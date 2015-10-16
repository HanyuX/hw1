function q3b()

% Compute the optimized solution
ret_code = checking('q3b');

if(ret_code ~= 0)
    fprintf(1, 'Checking q3b did not pass. Not executing this script file q3b.m\n');
    return
end

I = imread('flowerscene.jpg');
h_d = 11;
sigma_d = 5;
sigma_r = 64;

tic;
output = q3_bilateralfiltering_optimized(I, h_d, sigma_d, sigma_r);
elapsed_time = toc;

imshow(uint8(output));

fprintf(1, 'Elapsed runtime for optimized bilateral filtering is : %f seconds.\n', elapsed_time);
