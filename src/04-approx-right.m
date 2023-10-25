%%% glītas asis
a = [-5 6 -1 7];
plot([a(1) a(2)], [0 0], 'color', '#aaa');
hold on
plot([0 0], [a(3) a(4)], 'color', '#aaa');
axis(a);

xs = [-1 5];
ys = [6 1];

% oktāva nemāk fitot eksponenti, tapēc nācās nopūsties, paņemt matlabu un iefitot koeficientus,
f_right_a = 1.844
f_right_b = 0.987

f_right = @(x) f_right_a * exp(-x) + f_right_b;

t = linspace(-1, 5, 100);

plot(t, f_right(t), 'color', 'b');

plot([5 5 -1 -1], [1 0 0 6], 'color', 'b');

area_right = quad(f_right, -1, 5)

