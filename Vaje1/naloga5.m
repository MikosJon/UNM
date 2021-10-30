function y = naloga5()
    x = input('Vnesi število: ');
    if x < 6
        y = 2;
    elseif x <= 20
        y = x - 4;
    else
        y = -x;
    end
end