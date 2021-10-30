function [p, dp] = naloga7(x, a)
    length_dp = length(x) - 1;
    p = a * poly(x);
    dp = zeros([1 length_dp]);
    for i = 1 : length_dp
        dp(i) = p(i) * (length_dp - i + 1);
    end

    xs = linspace(min(x)-2, max(x)+2, 1000);

    tiledlayout(2, 1);

    nexttile;
    plot(xs, polyval(p, xs));

    nexttile;
    plot(xs, polyval(dp, xs));
end