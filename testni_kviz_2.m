x = [-17 52 -42 8 0];
y = [-19.5 64 -60 16 0];

dx = polyder(x);
ddx = polyder(dx);

dy = polyder(y);
ddy = polyder(dy);

razdalja_kvadrat = conv(x,x) + conv(y,y);

popravek_r = zeros(1, length(razdalja_kvadrat));
popravek_r(length(razdalja_kvadrat)) = -0.25;

popravek_R = zeros(1, length(razdalja_kvadrat));
popravek_R(length(razdalja_kvadrat)) = -1;

mali = roots(razdalja_kvadrat + popravek_r);
veliki = roots(razdalja_kvadrat + popravek_R);

disp(mali(mali > 0 & mali < 1 & abs(imag(mali)) < 1e-10));
disp(veliki(veliki > 0 & veliki < 1 & abs(imag(veliki)) < 1e-10));

top1 = conv(dx, ddy);
top2 = conv(ddx, dy);
bottom1 = conv(dx, dx);
bottom2 = conv(dy, dy);

ukrivljenost_ena = @(t) -1 + abs(polyval(top1, t) - polyval(top2, t)) / (polyval(bottom1, t) + polyval(bottom2, t))^(1.5);

n1 = fzero(ukrivljenost_ena, 0);
n2 = fzero(ukrivljenost_ena, 0.3);
n3 = fzero(ukrivljenost_ena, 0.5);
n4 = fzero(ukrivljenost_ena, 0.9);

disp(n4 - n3 + n2 - n1);