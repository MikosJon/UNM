p = [1 -5 0 20 -16];
xtilde = float(7/6, 10, 2);

disp(xtilde);
disp(horner_with_float(p, xtilde, 12, 2));
disp(abs(polyval(p, xtilde) - horner_with_float(p, xtilde, 8, 2)));