% Evan Baker
% EAB_LAB05_P02
% 14 February 2014

% This script will fit a quadratic to a given data set

function EAB_LAB_P02
v = [12.5 25 37.5 50 62.5 75];
V = linspace(min(v),max(v),6);
d = [20 59 118 197 299 420];
p = polyfit(v,d,2);
D = polyval(p,v);
plot(v,d,'o',V,D)
text(40,50,sprintf('y = %.3f x^2 + %.3f x + %.3f ',p(1,1),p(1,2),p(3)))
end