function naloga1
    x = 2^-1 + 2^-13 + 2^-24;
    y = 2^-1 + 2^-13;
    
    d = x^2 - y^2;

    sx = single(x);
    sy = single(y);

    metoda_1 = sx*sx - sy*sy;
    metoda_2 = (sx - sy) * (sx + sy);

    napaka_1 = abs(d - double(metoda_1)) / abs(d);
    napaka_2 = abs(d - double(metoda_2)) / abs(d);

    fprintf('Točen rezultat: %g\n', d);
    fprintf('Rezultat pri x*x - y*y: %g\n', double(metoda_1));
    fprintf('Rezultat pri (x-y)(x+y): %g\n', double(metoda_2));
    fprintf('Relativna napaka pri x*x - y*y:  %g\n', napaka_1);
    fprintf('Relativna napaka pri (x-y)(x+y): %g\n', napaka_2);
end