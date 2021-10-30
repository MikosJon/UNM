function [vsota, vektor_delnih] = naloga6(x)
    vsota = 0;
    vektor_delnih = zeros([1 length(x)]);
    for i = 1 : length(x)
        vsota = vsota + x(i);
        vektor_delnih(i) = vsota;
    end
end