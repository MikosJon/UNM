f = @(x) sin(x) .* cos(x);
a = 0;
b = 1;
h = 0.5;

% 1. del
compositetrapezoidal(f, a, b, h)

% 2. del
abs(integral(f, a, b) - compositetrapezoidal(f, a, b, 0.125))

% 3. del
X = [1 h h/2 h/4]';
fX = [
    compositetrapezoidal(f, 0, 1, 1)
    compositetrapezoidal(f, 0, 1, h)
    compositetrapezoidal(f, 0, 1, h/2)
    compositetrapezoidal(f, 0, 1, h/4)
];

[px, ~] = simpleinterpolate(X.^2, fX, 0)