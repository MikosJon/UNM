n = 5;

V = fliplr(vander(0 : 1/n : 1));

% spektralna obcutljivost
fprintf("Izracunana spektralna obcutljivost je %.16g\n", cond(V));
fprintf("Kvocient najvecje in najmanjse singularne vrednosti je %.16g\n", max(svd(V))/min(svd(V)));

conds = zeros(10);
for i = 1 : 10
    conds(i) = cond(fliplr(vander(0 : 1/i : 1)));
end
semilogy(1:10, conds, 'o');
title("Obcutljivost Vandermondovih matrik")

%%%%%%%%%%%%%%%%%%%%%%%%%
f = ones(n + 1, 1);
vals = polyval(f, 0 : 1/n : 1)';
a = V\vals;

disp("Pravilna resitev je");
disp(f);
disp("Izracunana resitev: Va = vals --> a =");
disp(a);
fprintf("Napaka pri izracunu je %.16g\n", norm(f - a, 2));