function [x, X, k] = sekantna(f, x0, x1, eps, koraki)
    X = [x0 x1];
    for k = 3 : koraki
        X(k) = X(k - 1) - (f(X(k-1)) * (X(k-1) - X(k - 2))) / (f(X(k-1)) - f(X(k-2)));
        if abs(X(k) - X(k-1)) < eps
            break;
        end
    end
    x = X(k);
    k = k - 2;
end