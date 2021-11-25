function x = float(n, mantissa_length, base)

    if n == 0
        x = 0;
    else
        t = floor(abs(log(abs(n))/log(base)));
        p = base^(mantissa_length - 1 - t);

        x1 = floor(n*p)/p;
        x2 = ceil(n*p)/p;

        if abs(x1 - n) < abs(x2 - n)
            x = x1;
        else
            x = x2;
        end
    end

end