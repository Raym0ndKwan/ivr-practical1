% Finds the normalised distance between coloured points (r1,g1,b1) and
% (r2,g2,b2)
% Values were found by trial and error

function distance = colorSimilarity(r1,g1,b1,r2,g2,b2)

a = 2.2;
b = 0.75;
c = 0.75;

distance = sqrt(((r1-r2)/a)^2 + ((g1-g2)/b)^2 + ((b1-b2)/c)^2);

end