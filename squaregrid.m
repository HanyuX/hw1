function [x, y] = squaregrid(m, n)

ln = linspace(-1, 1, n);
st = linspace(-1, 1, m);

xh = kron(ones(1, m), ln);
yh = kron(st, ones(1, n));

xv = yh;
yv = xh;

x = [xh xv];
y = [yh yv];

x = reshape(x, n, 2*m);
y = reshape(y, n, 2*m);