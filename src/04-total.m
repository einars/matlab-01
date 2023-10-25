%%% glītas asis
a = [-5 6 -1 7];
plot([a(1) a(2)], [0 0], 'color', '#aaa');
hold on;
plot([0 0], [a(3) a(4)], 'color', '#aaa');
axis(a);

% no iepriekšējiem aprēķiniem
area_left = 8.1167
area_right = 10.922

area_total = area_left + area_right

params_left = [-0.1213   1.1995  -3.1639   4.0000];
f_left = @(x) polyval(params_left, x);
f_right_a = 1.844;
f_right_b = 0.987;
f_right = @(x) f_right_a * exp(-x) + f_right_b;


% kreisā līnija
t = linspace(0, 6, 100);
plot(-f_left(t), t, 'color', 'b');

% horizontālais knariņš
plot([-2 -1], [6 6], 'color', 'b');

% eksponente
t = linspace(-1, 5, 100);
plot(t, f_right(t), 'color', 'b');

% atlikušais stūris
plot([5 5 -4], [1 0 0], 'color', 'b');

