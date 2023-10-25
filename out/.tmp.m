f = @(x) sin(x + sqrt(x));

a = 0;
b = 12;

function retval = integr_simpson(f, a, b, n)
  % https://en.wikipedia.org/wiki/Simpson's_rule
  xs = linspace(a, b, n + 1);

  retval = 0;
  for i = 1:n
    pa = xs(i + 0);
    pb = xs(i + 1);
    retval += (pb - pa) / 6 * (f(pa) + 4 * f((pa + pb) / 2) + f(pb));
  end
end

a_quad = quad(f, a, b);
a_simp = integr_simpson(f, a, b, 100)


err_simp = abs(a_simp - a_quad) * 100 / a_quad
