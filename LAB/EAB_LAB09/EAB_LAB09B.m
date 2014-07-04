% Evan Baker
% EAB_LAB09B
% 28 March 2014

% This function will approximate pi using trapz and then simpson's 1/3
% method with 6 interval steps

n = 6;

% trapz method
% pi = 1/2 int -1 to 1 of 4/(1+x^2) dx
x = linspace(-1,1,n+1); % build the x array
y = 4./(1+(x.^2)); % calculate the y array
trapzPi = .5*trapz(x,y) % get the approximate

% simpson's method
h = (1-(-1))/n;
simpsonsPi = (h/6)*(y(1)+y(n+1)+4*sum(y(2:2:n))+2*sum(y(3:2:n-1))) % get half the integral by Simpson's method