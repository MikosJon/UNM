function r = rayleigh(A, x)
    r = (x' * A * x) / (x' * x);
end