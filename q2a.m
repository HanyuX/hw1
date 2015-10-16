% Function : q2a.m
%
% Description : 
%               Runs the user provided q2_applyradialdistortion function
%               with a couple of parameters. Performs sanity checks on the
%               expected output also.

ret_code = checking('q2a');

if(ret_code ~= 0)
    fprintf(1, 'Checking q2a did not pass. Not executing this script file q2a.m');
    return
end

[x, y] = squaregrid(7, 30);

[xd, yd] = q2_applyradialdistortion(x, y, 0.15, -0.04);


clf;

% Plot the values.
axis equal
axis off
set(gca, 'Units', 'normalized')
set(gca, 'Position', [0.01 0.01 0.98 0.98])
set(gcf, 'Units', 'inches')
set(gcf, 'Position', [1 1 4 4])
set(gcf, 'PaperUnits', 'inches')
set(gcf, 'PaperPosition', [0 0 4 4], 'PaperSize', [4 4])
figure(gcf)

plot(xd, yd, 'b');

print -dpdf q2a.pdf
disp('Grid printed to file q2a.pdf')