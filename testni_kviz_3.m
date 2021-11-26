f = @(x) exp(x) * sin(11 * exp(x));

[~, X, ~] = Ridder(f, 0, 0.3, 1e-10, 100);
disp(X(3));

[~, X, ~] = Ridder(f, 0.9, 1, 1e-14, 100);
disp(length(X) - 3);
% disp(length(X) - 2);

[n1, X1, k1] = Ridder(f, 0.5, 0.6, 1e-10, 100);
[~, ~, k2] = bisekcija(f, 0.5, 0.6, 1e-10, 100);

disp(k2 - k1);
