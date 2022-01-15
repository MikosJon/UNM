function x = modifiedhorner(koef, base, a)
    x = koef(end) * ones(size(a));
    for i = length(koef)-1:-1:1
        x = koef(i) + (a - base(i)) .* x;
    end
end