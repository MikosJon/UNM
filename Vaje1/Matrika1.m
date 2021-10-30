function [A, product] = Matrika1(n, m)
    if nargin == 1
        m = n;
    end

    A = zeros([n m]);
    for i = 1 : n
        for j = 1 : m
            A(i, j) = (i * j) / (i + j);
        end
    end
    product = prod(A(1, :));
end