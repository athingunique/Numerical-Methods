clc
clear all
close all

disp('a');
a = (sin(pi/6))^2 + (cos(pi/6))^(-2);
disp(a);

disp('b');
b = (exp(2))/(sqrt(log(exp(2))) + log10(10^2))^2;
disp(b);

disp('c');
k = 0.5;
H = 7.5;
L = 250;
n = 0.013;
r = 0.5;
g = 32.2;
c = sqrt(H/(((1+k)/(2*g)) + (((n^2)*L)/(2.21*(r^(4/3))))));
disp(c);

disp('d');
x = 1:5;
d = (sqrt(x) - 1) ./ (sqrt(x) + 1).^2;
disp(d);

disp('e');
x = linspace(-pi,pi,10);
Fx = @ (x) (tan(x)).^3;
disp(Fx(x));

% Matlab doesn't error here because we aren't evaluating at the
% discontinuity. All of our points have discrete values.
