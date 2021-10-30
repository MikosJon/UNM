function [x, X, k] = navadna_iteracija(f, pribl, eps, koraki)
    
    X = pribl;
    for i = 2 : koraki + 1
        X(i) = f(X(i-1));
        if abs(X(i) - X(i-1)) < eps
            break;
        end
    end
    x = X(i);
    k = i - 1;
end