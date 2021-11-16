function x = float(n, mantissa_length, base)
    
    switch nargin
        case 2
            base = 2;
        case 1
            base = 2;
            mantissa_length = 53;
    end
    
    t = floor(abs(log(n)/log(base)));
    p = base^(mantissa_length - 1 - t);

    x = round(n*p)/p;
end