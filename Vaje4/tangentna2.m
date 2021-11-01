function [x, X, k] = tangentna2(f, df, ddf, x0, eps, koraki)
    g = @(x) x - f(x) / df(x) - (ddf(x) * (f(x))^2) / (2 * (df(x))^3);
    [x, X, k] = navadna_iteracija(g, x0, eps, koraki);
end