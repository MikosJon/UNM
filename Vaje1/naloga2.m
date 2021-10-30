function [A, square_A, elem_squared_A] = naloga2(n)
    A = randi([-1000 1000], n);
    square_A = A ^ 2;
    elem_squared_A = A .^ 2;
end