X = 0 : 5/8 : 20/8;

f2 = @(x) cos(x);
f3 = @(x) sin(x);
f4 = @(x) cos(2*x);
f5 = @(x) sin(2*x);

A = [[1 1 1 1 1]' f2(X)' f3(X)' f4(X)' f5(X)'];

disp(cond(A));

[~, U] = lubp(A);
disp(U(5,5));

[L, U, P, Q] = lukp(A);
disp(norm(L, Inf));