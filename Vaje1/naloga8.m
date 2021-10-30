function naloga8
    f1 = @(x) sin(x) .* exp(sqrt(x));
    f3 = @(x, y) (x.^2 + y.^2) ./ (1 + x + y);

    tiledlayout(3, 1);

    nexttile;
    xs = linspace(1, 3);
    plot(xs, f1(xs));

    nexttile;
    ts = linspace(0, 2*pi);
    plot(cos(ts), sin(ts));

    nexttile;
    [xs, ys] = meshgrid(0:1e-1:1);
    surf(xs, ys, f3(xs, ys));



end