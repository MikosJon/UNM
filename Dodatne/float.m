function x = float(n, mantissa_length, base)

    if nargin < 3
        base = 2;
    end
    if nargin < 2
        mantissa_length = 5;
    end

    number_of_shifts = 0;
    original = n;

    if n < 0
        n = -n;
    end

    while floor(n) ~= n
        number_of_shifts = number_of_shifts + 1;
        n = n*base;
    end
    
    i = 1;
    digits = [];
    while n ~= 0
        digits(i) = mod(n, base);
        n = floor(n / base);
        i = i+1;
    end
    
    if length(digits) <= mantissa_length
        x = 0;
        for k = digits
            x = x + k * base^(-number_of_shifts);
            number_of_shifts = number_of_shifts - 1;
        end
    else
        number_of_shifts = number_of_shifts - (length(digits) - 5);
        diff = base^(-number_of_shifts);

        x1 = 0;
        for k = digits(length(digits)-4:length(digits))
            x1 = x1 + k * base^(-number_of_shifts);
            number_of_shifts = number_of_shifts - 1;
        end
        x2 = x1 + diff;
        
        if original < 0
            x1 = -x1;
            x2 = -x2;
        end

        if abs(x2 - original) > abs(original - x1)
            x = x1;
        elseif abs(x2 - original) < abs(original - x1)
            x = x2;
        else
            if mod(digits(length(digits)-4), 2) == 0
                x = x1;
            else
                x = x2;
            end
        end
    end
end