function A = naloga3(x, y)
    size_x = length(x);
    size_y = length(y);
    A = zeros([size_x size_y]);
    for i = 1 : size_x
        for j = 1 : size_y
            if y(j) == 0
                A(i, j) = x(i);
            else
                A(i, j) = x(i) / y(j);
            end
        end
    end
end