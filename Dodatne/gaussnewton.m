function [x, X, k] = gaussnewton(f, jf, x0, eps, koraki)
    X = x0;
    for k = 1 : koraki
        dx = jf(X(:, k))\(-f(X(:, k)));
        X(:, k+1) = X(:, k) + dx;
        if norm(dx) < eps
            break;
        end
    end
    x = X(:, k+1);
end