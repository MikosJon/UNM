xs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]';
ys = [8, 9, 6, 7, 4, 3, 2, 3, 2, 1]';

f = @(P) P(1)*exp(P(2) * xs) - ys;
jf = @(P) [exp(P(2) * xs), P(1)*xs.*exp(P(2)*xs)];

% 1. del
[x, ~, ~] = gaussnewton(f, jf, [10 0]', 1e-12, 100);
sum(x)

% 2.del
[x, X, k] = gaussnewton(f, jf, [10 0]', 1e-3, 100);
sol = @(x) X(1,end)*exp(X(2,end)*x);
sol(10)

% 3.del
g = @(P) sqrt(sum((ys - P(1)*exp(P(2)*xs)).^2));
g(fminsearch(g, [10,1]))
