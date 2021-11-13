function [L, U, P, Q] = lukp(A)
    n = size(A, 1);
    P = eye(n);
    Q = eye(n);
    for j = 1 : n
        % pivotiranje
        max = [A(j, j) j j];
        for a = j : n
            for b = j : n 
                if abs(A(a, b)) > abs(max(1))
                    max = [A(a, b) a b];
                end
            end
        end
        pivot_vrsta = max(2);
        pivot_stolpec = max(3);

        P([j pivot_vrsta], :) = [P(pivot_vrsta, :); P(j, :)];
        A([j pivot_vrsta], :) = [A(pivot_vrsta, :); A(j, :)];

        Q(:, [j pivot_stolpec]) = [Q(:, pivot_stolpec) Q(:, j)];
        A(:, [j pivot_stolpec]) = [A(:, pivot_stolpec) A(:, j)];
        
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
