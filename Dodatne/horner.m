function x = horner(p, a)
    a = float(a);
    x = float(p(1));
    for k = 2:length(p)
        x = float(float(x * a) + float(p(k)));
    end
end