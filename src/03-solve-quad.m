f = @(x) sin(x + sqrt(x));

a = 0;
b = 12;

function retval = tainst_integr (f, a, b, n)
  pts = linspace(a, b, n);
  width = pts(2) - pts(1);
  midpoints = pts + width / 2;
  retval = sum(f(midpoints) * width);
end

% laba atbilde
a_quad = quad(f, a, b)

% tainsntūru metode
a_6 = tainst_integr(f, a, b, 6)
a_50 = tainst_integr(f, a, b, 50)
a_100 = tainst_integr(f, a, b, 100)

err_100 = abs(a_100 - a_quad) * 100 / a_quad
