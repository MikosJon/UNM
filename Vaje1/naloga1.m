function out = naloga1(n)
    d = diag(1:n);
    tr = triu(2*ones(n), 1);
    subdiag = diag(diag(-1*ones(n-1)), -1);
    out = d + tr + subdiag;
end