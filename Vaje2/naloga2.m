function naloga2
    a = [1 1/2 zeros(1, 49)];
    b = [1 1/3 zeros(1, 49)];

    for i = 3 : 51
        a(i) = 5 / 2 * a(i-1) - a(i-2);
        b(i) = 10 / 3 * b(i-1) - b(i-2);
    end
    
    tiledlayout(3,1);
    
    nexttile;
    semilogy(0:50, a, 'o');
    title('Zaporedje a');

    nexttile;
    semilogy(0:50, b, 'o');
    title('Zaporedje b');

    nexttile;
    b = [zeros(1,49) 1 0];
    for i = 49 : -1 : 1
        b(i) = 10 / 3 * b(i+1) - b(i+2);
    end
    skala = b(1);
    b = b / skala;
    semilogy(0:50, b, 'o');
    title('Zaporedje b v nazaj');
    
    disp('Maksimalna absolutna napaka pri racunanju clenov b v obratnem vrstnem redu:');
    disp(max(abs(b - (1/3).^(0:50))));

end