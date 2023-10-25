
xs = [-4 -1.5 -3   -2];
ys = [ 0  2    4.5  6];

% polifitojam ar x un y samainītiem vietām
params = polyfit(ys, -xs, 3)

f_left = @(x) polyval(params, x);

t = linspace(0, 6, 100);

plot(-f_left(t), t, 'color', 'b');

hold on;

plot([-2 -1 -1 -4], [6 6 0 0], 'color', 'b');


% 1 x 6 = taisnstūris līdz y asij
area_left = quad(f_left, 0, 6) - 1*6

%%% glītas asis
axis([-5 6 -1 7]);
a = axis();
plot([a(1) a(2)], [0 0], 'color', '#aaa');
plot([0 0], [a(3) a(4)], 'color', '#aaa');

