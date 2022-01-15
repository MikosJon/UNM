function int = compositetrapezoidal(f, a, b, h)
    X = linspace(a,b, 1 + (b-a)/h);
    int = 0.5 * h *(sum(f(X)) + sum(f(X(2:end-1))));
end