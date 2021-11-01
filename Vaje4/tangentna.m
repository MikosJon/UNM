function [x, X, k] = tangentna(f, df, x0, eps, koraki)
    g = @(x) x - f(x) / df(x);
    [x, X, k] = navadna_iteracija(g, x0, eps, koraki);
end