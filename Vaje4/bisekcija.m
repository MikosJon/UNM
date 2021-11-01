function [x, X, k] = bisekcija(f, a, b, eps, koraki)
    if sign(f(a)) == sign(f(b))
        error('Funkcija ima isti predznak v a in b');
    end

    X = a;
    for k = 2 : koraki
        c = a + (b - a) / 2;
        sc = sign(f(c));
        X(k) = c;
    
        if abs(X(k) - X(k - 1)) < eps
            break;
        end

        if sc ~= sign(f(a))
            b = c;
        else
            a = c;
        end
    end
    x = X(k);
    k = k - 1;
end