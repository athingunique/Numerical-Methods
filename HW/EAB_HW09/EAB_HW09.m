% Evan Baker
% EAB_HW09
% 4 March 2014
clc
close all
clear all

% This script will evaluate the length of the main suspension cables of the
% golden gate bridge by several integration methods.

% The cables hang according to the equation:
% f(x) = C * ( ( (e^(x/C) + e^(-x/C)) / 2 )-1) for x = -2100:2100 ft 
% where C = 4491

% The length of the cable can determined using the equation 
% L = integral(a to b) sqrt(1 + (f'(x))^2) dx
% where a to b = range(x)

% It turns out f(x) = (C/2)(2cosh(x/C)-2), a hyperbolic cosine function
% And that f'(x) = sinh(x/C), a hyperbolic sine function
% This makes the math a bit easier since matlab supports sinh


% So L = integral(sqrt(1+ (sinh(x/C))^2)dx) | -2100:2100
L = @ (x) sqrt(1 + sinh(x/4491).^2);

% PART A
% Midpoint method with 8 and 16 intervals
fprintf('PART A Midpoint Method:\n');
a = -2100;
b = 2100;
h = b-a;
for i = 1:2;
    n = 8*i;
    x = linspace(a,b,n*2+1);
    xmid = x(2:2:end);
    I = (h/n)*sum(L(xmid));
    fprintf('Midpoint Method with %i intervals\n',8*i);
    fprintf('Cable length L = %.3f ft\n',I);
end

% PART B
% Gaussian Quadrature with 3 points
fprintf('\nPART B\n');
F = @ (t) (L(((b-a)*t+a+b)/2))*((b-a)/2) ;
C = [.5555556, .8888889, .5555556];
t = [-.77459667, 0, .77459667];
I = sum(C.*F(t));
fprintf('3 pt Gaussian Quadrature\n');
fprintf('Cable length L = %.3f ft \n',I);

% PART C
% MATLAB Integration Method
fprintf('\nPART C\n');
I = integral(L,a,b);
fprintf('MATLAB Integral Method\n');
fprintf('Cable length L = %.3f ft \n',I);

% PART D
% MATLAB Trapz Mathod
fprintf('\nPART D\n');
n = 100;
x = linspace(a,b,n+1); % build the x array
y = L(x); % calculate the y array
I = trapz(x,y); % get the approximate
fprintf('MATLAB Trapz Method\n');
fprintf('Cable length L = %.3f ft \n',I);
