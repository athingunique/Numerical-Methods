% Evan Baker
% EAB_HW05_P03
% 19 February 2014

% This script first fits a polynomial to the data, then compares the fit of
% the polynamial to the given equation for correlation for points midway
% between the tabled temperatures. The degree of polynomial fit required to
% give accurate results is returned.

clc
close all
clear all


data = [ 300 .024 ; 400 .035 ; 500 .046 ; 600 .058 ; 700 .067 ; 800 .083 ; 900 .097 ; 1000 .111 ; 1100 .125 ; 1200 .140 ; 1300 .155 ; 1400 .170 ; 1500 .186 ; 1600 .202 ; 1700 .219 ; 1800 .235 ; 1900 .252 ; 2000 .269 ];

T = data(:,1);
e = data(:,2);
count = length(T);

a = 1;
b = 0;
n = 0;
while abs(a - b) >= .001
    n = n + 1;
    p = polyfit(T, e, n);
    clc
    for i = 1:count
        a = polyval(p,T(i)+50);
        b = .02424*((T(i)+50)/303.16)^1.27591;
        fprintf('%.3f %.3f\n',a,b);
    end
    fprintf('Polynomial of degree %i is within .001 for data.\n',n)
end
