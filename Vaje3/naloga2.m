g1 = @(x) x^2 - 2;
g2 = @(x) sqrt(x + 2);
g3 = @(x) 1 + 2 / x;
g4 = @(x) (x^2 + 2) / (2*x - 1);

d = 1000;
pribls = linspace(-2, 4, d);
eps = 1e-16;


M = zeros(1, d);
K = zeros(1, d);
for i = 1 : d
    x0 = pribls(i);
    [x, ~, k] = navadna_iteracija(g2, x0, eps, 20);
    K(i) = k;
    if abs(x + 1) < eps
        M(i) = 1;
    elseif abs(x - 2) < eps
        M(i) = 2;
    else
        M(i) = 3;
    end
end

plot(pribls(M == 1), K(M == 1), 'ro', pribls(M == 2), K(M == 2), 'go', pribls(M == 3), K(M == 3), 'bo');
legend('Konvergenca k -1', 'Konvergenca k 2', 'Konvergenca ?');