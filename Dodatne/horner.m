function x = horner(p, a)
    x = p(1);
    for k = 2:length(p)
        x = x*a + p(k);
    end
end