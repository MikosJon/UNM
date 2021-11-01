function [x, X, k] = Halley(f, df, ddf, x0, eps, koraki)
    g = @(x) x - (2 * f(x) * df(x)) / (2 * df(x)^2 - f(x) * ddf(x));
    [x, X, k] = navadna_iteracija(g, x0, eps, koraki);
end