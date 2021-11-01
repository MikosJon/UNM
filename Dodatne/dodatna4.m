f = @(x) exp(x) .* sin(11 * exp(x));
xs = linspace(0, 1);
nicle = [fzero(f, 0.1), fzero(f, 0.3), fzero(f, 0.5), fzero(f, 0.7), fzero(f, 0.8), fzero(f, 0.9)];

subplot(1, 2, 1);
hold on;
plot(xs, f(xs), 'b');
scatter(nicle, zeros(1, length(nicle)), 'black', 'filled');
hold off;
title('Graf funkcije f');

[~, ~, r1] = Ridder(f, 0.1, 0.2, 1e-10, 100);
[~, ~, r2] = Ridder(f, 0.3, 0.4, 1e-10, 100);
[~, ~, r3] = Ridder(f, 0.5, 0.6, 1e-10, 100);
[~, ~, r4] = Ridder(f, 0.6, 0.7, 1e-10, 100);
[~, ~, r5] = Ridder(f, 0.8, 0.9, 1e-10, 100);
[~, ~, r6] = Ridder(f, 0.9, 1, 1e-10, 100);

[~, ~, b1] = bisekcija(f, 0.1, 0.2, 1e-10, 100);
[~, ~, b2] = bisekcija(f, 0.3, 0.4, 1e-10, 100);
[~, ~, b3] = bisekcija(f, 0.5, 0.6, 1e-10, 100);
[~, ~, b4] = bisekcija(f, 0.6, 0.7, 1e-10, 100);
[~, ~, b5] = bisekcija(f, 0.8, 0.9, 1e-10, 100);
[~, ~, b6] = bisekcija(f, 0.9, 1, 1e-10, 100);

points = [r1 r2 r3 r4 r5 r6; b1 b2 b3 b4 b5 b6];

subplot(1, 2, 2);
scatter(nicle, [r1 r2 r3 r4 r5 r6; b1 b2 b3 b4 b5 b6], 'filled');
legend('Koraki Ridderjeve metode', 'Koraki bisekcije');
title('Število korakov');
axis([0 1 0 max(max(points))+5]);