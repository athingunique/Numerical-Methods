% Evan Baker
% EAB_HW05_P02
% 19 February 2014

% This script will determine the coefficient K and exponent m of 
% the stress strain equation s = K*E^m

clc
clear all
close all

% Data is [ F(kN), L(mm) ;]
data = [ 24.6 12.58 ; 29.3 12.82 ; 31.5 12.91 ; 33.3 12.95 ; 34.8 13.05 ; 35.7 13.21 ; 36.6 13.35 ; 37.5 13.49 ; 38.8 14.08 ; 39.6 14.21 ; 40.4 14.48 ];

% Initial xsectional area (m^2)
Ao = 1.25*10^-4;
% Initial gage length (m)
Lo = 0.0125;

% Adjusting the data to conventional units
F = 1000 .* data(:, 1); % kN => N
L = .001 .* data(:, 2); % mm => m


s = (F .* L) ./ (Ao .* Lo);
E = log(L ./ Lo);

% Linearizing the stress strain eq
% y = bx^m                  | s = K*E^m
% ln(y) = mln(x) + ln(b)    | ln(s) = mln(E) + ln(K)


n = 3; % Degree of polynomial fit
p = polyfit(log(E),log(s),n);
m = p(1) % Pulling the coefficients in to something useful
b = exp(p(2))

x = linspace(min(s),max(s));
y = b.*(x.^m);

plot(s, E, 'o', x, y, '-')