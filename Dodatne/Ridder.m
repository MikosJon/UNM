function [nicla, X, k] = Ridder(f, a, b, eps, koraki)
    if sign(f(a)) == sign(f(b))
        error("Fukncija je istega predznaka v a in b.");
    end
    X = a;
    for k = 2 : koraki
        c = a + (b - a) / 2;
        x = c + (c - a) * (sign(f(a) - f(b)) * f(c)) / sqrt(f(c)^2 - f(a) * f(b));

        X(k) = x;

        if abs(X(k) - X(k-1)) < eps
            break
        end

        sx = sign(f(x));
        sc = sign(f(c));
        sa = sign(f(a));
        if sx ~= sc
            a = x;
            b = c;
        elseif sx ~= sa
            b = x;
        else
            a = x;
        end
    end

    nicla = X(k);
    k = k - 1;
end