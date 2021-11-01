x = [-17 52 -42 8 0];
y = [-19.5 64 -60 16 0];

dx = polyder(x);
dy = polyder(y);

ddx = polyder(dx);
ddy = polyder(dy);

t = linspace(0, 1, 1000);

xs = polyval(x, t);
ys = polyval(y, t);

dxs = polyval(dx, t);
dys = polyval(dy, t);

ddxs = polyval(ddx, t);
ddys = polyval(ddy, t);

% a) del
x_sredisce = 0;
y_sredisce = 0;
r = 0.5;
R = 1;

filter = (xs.^2 + ys.^2 >= r^2) & (xs.^2 + ys.^2 <= R^2);

subplot(3, 1, 1);
plot(xs, ys);
axis equal;
title('Krivulja $(x(t), y(t)), t \in [0, 1]$', 'Interpreter','latex');

subplot(3, 1, 2);
hold on;
plot(xs(filter == 1), ys(filter == 1), '.');

phi = linspace(0, 2*pi);
plot(r*cos(phi), r*sin(phi));
plot(R*cos(phi), R*sin(phi));
hold off;
axis equal;
title('Krivulja znotraj $A((0, 0);\, 0.5, 1)$', 'Interpreter','latex');

% b) del
meja_ukrivljenosti = 1;
ukrivljenost = abs(dxs .* ddys - ddxs .* dys) ./ (dxs.^2 + dys.^2).^(1.5);

subplot(3, 1, 3);
plot(xs(ukrivljenost > 1), ys(ukrivljenost > 1), '.');
axis equal;
title('Odseki krivulje z ukrivljenostjo ve\v c kot 1', 'Interpreter','latex');


