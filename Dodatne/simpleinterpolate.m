function [px, F] = simpleinterpolate(X, fX, x)
    k = length(X) - 1;
    F = [fX [diff(fX)./diff(X); 0] zeros(k+1, k-1)];
    for j = 3:k+1
        for i = 1:k-j+2
            F(i, j) = (F(i+1,j-1) - F(i, j-1)) / (X(i+j-1) - X(i));
        end
    end
    px = modifiedhorner(F(1, :), X, x);
end