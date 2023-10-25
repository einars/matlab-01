from = -1;
to = 4;

xs = linspace(from, to, 500)
ys = sqrt(3) .* sin(1.7 .* xs) .* log(4.6 - xs)

plot([from to], [0 0], 'color', '#aaa');
hold on;
plot([0 0], [-3 3], 'color', '#aaa');

plot(xs, ys, 'b');
