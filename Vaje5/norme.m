n = 1000;
m = diag(-2 : -2 : -2*n) + diag(n-1 : -1 : 1, 1) + diag(n-1 : -1 : 1, -1);

% 2-norma
tic;
fprintf("2-norma: %.16g\n", norm(m));
toc;
fprintf("Koren max lastne vrednosti: %.16g\n", sqrt(max(eig(m'*m))));
fprintf("Najvecja singularna vrednost: %.16g\n", max(svd(m)));

% redke matrike
n = 10000;
m = spdiags([(-2 : -2 : -2*n)' (n-1 : -1 : 0)' (n : -1 : 1)'], [0 -1 1], n, n);
tic;
fprintf("2-norma redke matrike je %.16g\n", normest(m));
toc;

tic;
ena_norma = norm(m, 1);
inf_norma = norm(m, "inf");
frob_norma = norm(m, "fro");
vec_inf_norma = norm(m(:), "inf");

koren_n = sqrt(n);
ena_deljeno_koren_n = 1 / koren_n;

spodnja_meja = max([
    ena_deljeno_koren_n * frob_norma
    ena_deljeno_koren_n * inf_norma
    ena_deljeno_koren_n * ena_norma
    vec_inf_norma
]);

zgornja_meja = min([
    frob_norma
    koren_n * inf_norma
    koren_n * ena_norma
    n * vec_inf_norma
    sqrt(ena_norma * inf_norma)
]);
% primerjava natančnosti
fprintf("2-norma lezi med %.16g in %.16g.\n", spodnja_meja, zgornja_meja);
toc;