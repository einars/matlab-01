A = [ 1 0 -1 1;
      2 3 -1 0;
      5 0 0 -3;
      1 1 1 1 ];
B = [ 3; 4; -6; 2 ];

res = A \ B;
assert(A * res, B, tolerance = 0.00001);

x = res (1)
y = res (2)
z = res (3)
t = res (4)
