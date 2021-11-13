function [L, U, P] = ludp(A)
    n = size(A, 1);
    P = eye(n);
    for j = 1 : n
        % pivotiranje
        max = [A(j, j) j];
        for k = j+1 : n
            if abs(A(k, j)) > abs(max(1))
                max = [A(k, j) k];
            end
        end
        pivot_indeks = max(2);
        P([j pivot_indeks], :) = [P(pivot_indeks, :); P(j, :)];
        A([j pivot_indeks], :) = [A(pivot_indeks, :); A(j, :)];
        
        % update
        for i = j+1 : n
            A(i, j) = A(i, j) / A(j, j);
            for l = j+1 : n
                A(i, l) = A(i, l) - A(i, j) * A(j, l);
            end
        end
    end
    L = tril(A, -1) + eye(n);
    U = triu(A);
end