function dist=euclidianDist3D(x1,y1,z1,x2,y2,z2)

% Normalised
a=2.2;
b=1.00;
c=0.75;

dist=sqrt(((x1-x2)/a)^2+((y1-y2)/b)^2+((z1-z2)/c)^2);

end