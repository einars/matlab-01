A = [ 2 -1 1;
      1 -2 3;
      3 -3 4];
B = [ 9; 10; 5 ];

res = A \ B
% matrix singular brīdinājums. 
% Vai nu nav risinājuma,
% vai bezgalīgi daudz risinājumu

if abs(min( A * res - B )) < 0.00001
  % atbildē — kaut kas līdzīgs risinājumam
  disp("Bezgalīgi daudz risinājumu?");
else
  disp("Nav risinājumu?");
endif
