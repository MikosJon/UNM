% LU razcep

disp('Primer 1: A1 = L1*U1');

A1 = [2 -1 1 4; 4 -3 7 14; 0 -3 18 19; 6 -2 7 14];
disp('Matrika A1:');
disp(A1);

[L1,U1] = lubp(A1);
disp('Matrika L1:');
disp(L1);
disp('Matrika U1:');
disp(U1);


disp('Primer 2: A2 = L2*U2');

A2 = [2 -2 -4 4; 4 -3 -6 14; -8 3 6 19; 6 -2 7 14];
disp('Matrika A2:');
disp(A2);

[L2,U2] = lubp(A2);
disp('Matrika L2:');
disp(L2);
disp('Matrika U2:');
disp(U2);

disp('LU razcep matrike A2 brez pivotiranja ne obstaja:');
fprintf('det(A2(1:3,1:3)) = %.2e\n', det(A2(1:3,1:3)));