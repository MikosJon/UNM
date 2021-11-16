function x = horner(p, a, mantissa_length, base)
    
    switch nargin
        case 2
            mantissa_length = 53;
            base = 2;
        case 3
            base = 2;
    end

    a = float(a, mantissa_length, base);
    x = float(p(1), mantissa_length, base);
    for k = 2:length(p)
        xa = float(x * a, mantissa_length, base);
        pk = float(p(k), mantissa_length, base);
        x = float(xa + pk, mantissa_length, base);
    end
end