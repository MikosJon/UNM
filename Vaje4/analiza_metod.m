xs = 1 : 0.1 : 10;
f = @(x) x + 4 - exp(x^2);
df = @(x) 1 - 2*x*exp(x^2);
ddf = @(x) -2*exp(x^2) - 4*x^2 * exp(x^2);

tocna_nicla = fzero(f, 1);
eps = 1e-10;

% tangentna
g1 = @(x) x - f(x) / df(x);
k1 = zeros(1, length(xs));
for idx = 1 : length(xs)
    X = xs(idx);
    for i = 2 : 1000 + 1
        X(i) = g1(X(i-1));
        if abs(X(i) - tocna_nicla) < eps
            break;
        end
    end
    k1(idx) = i - 1;
end

subplot(4, 2, 2);
plot(xs, k1, '.', xs, k1, '--', xs, 2*k1);
legend('Klici f', "Klici f'", 'Skupaj');
title('Število funkcijskih klicev tangentne metode');
axis([1 10 0 500]);

% sekantna
k2 = zeros(1, length(xs));
for idx = 1 : length(xs)
    X = [xs(idx), xs(idx) + 0.1];
    for k = 3 : 1000
        X(k) = X(k - 1) - (f(X(k-1)) * (X(k-1) - X(k - 2))) / (f(X(k-1)) - f(X(k-2)));
        if abs(X(k) - X(k-1)) < eps
            break;
        end
    end
    k2(idx) = k - 2;
end

subplot(4, 2, 4);
plot(xs, 3*k2);
legend('Klici f');
title('Število funkcijskih klicev sekantne metode');
axis([1 10 0 500]);

% tangentna2
g3 = @(x) x - f(x) / df(x) - (ddf(x) * (f(x))^2) / (2 * (df(x))^3);
k3 = zeros(1, length(xs));
n3 = zeros(1, length(xs));
for idx = 1 : length(xs)
    X = xs(idx);
    for i = 2 : 1000 + 1
        X(i) = g3(X(i-1));
        if abs(X(i) - tocna_nicla) < eps
            break;
        end
    end
    k3(idx) = i - 1;
end

subplot(4, 2, 6);
plot(xs, 2*k3,'.', xs, 2*k3,'--', xs, k3, xs, 5*k3);
legend('Klici f', "Klici f'", "Klici f''", 'Skupaj');
title('Število funkcijskih klicev tangentne2 metode');
axis([1 10 0 500]);

% Halley
g4 = @(x) x - (2 * f(x) * df(x)) / (2 * df(x)^2 - f(x) * ddf(x));
k4 = zeros(1, length(xs));
for idx = 1 : length(xs)
    X = xs(idx);
    for i = 2 : 1000 + 1
        X(i) = g4(X(i-1));
        if abs(X(i) - tocna_nicla) < eps
            break;
        end
    end
    k4(idx) = i - 1;
end

subplot(4, 2, 8);
plot(xs, 2*k4, '.', xs, 2*k4, '--', xs, k4, xs, 5*k4);
legend('Klici f', "Klici f'", "Klici f''", 'Skupaj');
title('Število funkcijskih klicev Halleyjeve metode');
axis([1 10 0 500]);

% stevilo korakov
subplot(1, 2, 1);
plot(xs, k1, xs, k2, xs, k3, xs, k4);
title('Število korakov metod');
legend('Tangentna', 'Sekantna', 'Tangentna2', 'Halleyjeva');
