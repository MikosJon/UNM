function x = poweriteration(A, x, koraki)
    for k = 1 : koraki
        x = A*x;
        x = x / norm(x);
    end
end