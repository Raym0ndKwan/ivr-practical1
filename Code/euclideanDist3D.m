% Finds the normalised distance between coloured points (r1,g1,b1) and (r2,g2,b2).
% Euclidean distance is not suitable, as each colour has a different
% behavior. The red values are more concentrated/spread out than g & b etc.
% So a small/big difference between r1 and r2 is more significant than same
% difference between g1 and g2

function distance = euclideanDist3D(r1,g1,b1,r2,g2,b2)

a = 2.2;
b = 1.00;
c = 0.75;

dist=sqrt(((x1-x2)/a)^2 + ((y1-y2)/b)^2 + ((z1-z2)/c)^2);

end