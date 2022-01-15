function [Q, R] = householderqr(A)
    [m, n] = size(A);
    Q = eye(m);
    for i = 1 : m
        w = A(i:m, i);
        w(1) = w(1) + sgn(w(1)) * norm(w);
        P = eye(m-i+1) - 2 * (w * w')/(w' * w);
        A(i:m, i:n) = P * A(i:m, i:n);
        % b(i:m) = P * b(i:m);
        Q(i:m, :) = P * Q(i:m, :);
    end
    R = A;
    Q = Q';
end