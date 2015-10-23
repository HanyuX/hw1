% Function : q2c.m
%%%

ret_code = checking('q2a');

if(ret_code ~= 0)
    fprintf(1, 'Checking q2a did not pass. Not executing this script file q2c.m');
    return
end

ret_code = checking('q2c');

if(ret_code ~= 0)
    fprintf(1, 'Checking q2c did not pass. Not executing this script file q2c.m');
    return
end

[x,y] = squaregrid(7, 30);

gt_k1 = 0.15;
gt_k2 = -0.04;
[xd, yd] = q2_applyradialdistortion(x, y, gt_k1, gt_k2);

allerrors = [];
allsigmas = [0 0.1 0.5 1];
rand('seed', 0);
for sigma = allsigmas,
    xdnoisy = xd + sigma*randn(size(xd));
    ydnoisy = yd + sigma*randn(size(yd));
    
    [k1, k2] = q2_computedistortionparams(x, y, xdnoisy, ydnoisy);
    
    currerror = norm([k1 k2] - [gt_k1 gt_k2]);    
    allerrors = [allerrors currerror];
end

plot(allsigmas, allerrors, '-o');
xlabel('sigma');
ylabel('parameter estimation error');
print -dpdf 'q2c'