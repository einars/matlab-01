from = -1;
to = 4;

xs = linspace(from, to, 500)
ys = sqrt(3) .* sin(1.7 .* xs) .* log(4.6 - xs)
plot(xs, ys, 'b');

% oktāvei ir netriviāli salikt koordinātu asis, ak
% yline(...)
% The ’yline’ function is not yet implemented in Octave.

hold on;
plot([from to], [0 0], 'k');
plot([0 0], [-3 3], 'k');
