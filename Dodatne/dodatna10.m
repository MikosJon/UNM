load 'west0479';

% 1. del
[Q1, R1] = householderqr(west0479);
sum(R1(:, end))

% 2. del
[Q2, R2] = extendedqr(west0479);
sum(R2(:, end))

% 3. del
[Q3, R3] = qr(west0479);
norm(Q3, 'Inf')