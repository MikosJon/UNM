function x = horner_with_float(p, a, mantissa_length, base)
    x = p(1);
    for k = 2:length(p)
        xa = float(x*a, mantissa_length, base);
        pk = float(p(k), mantissa_length, base);
        x = float(xa + pk, mantissa_length, base);
    end
end