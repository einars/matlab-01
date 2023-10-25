d = 10; m = 3;
A = [ d-10 -4 5;
      3 m-5 7;
      1 6 -2 ];
B = [ 7; 5; 3 ];

res = A \ B;
assert(A * res, B, tolerance = 0.00001);

x1 = res (1)
x2 = res (2)
x3 = res (3)
