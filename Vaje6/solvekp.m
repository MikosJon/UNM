function x = solvekp(A, b)
    n = length(b);
    [L, U, P, Q] = lukp(A);

    % prema substitucija
    y = P*b;
    for i = 1 : n
        for k = 1 : i-1
            y(i) = y(i) - L(i,k)*y(k);
        end
    end
    
    % obratna substitucija
    x = y;
    for i = n : -1 : 1
        for k = i+1 : n
            x(i) = x(i) - U(i,k)*x(k);
        end
        x(i) = x(i) / U(i,i);
    end
    x = Q*x;
end