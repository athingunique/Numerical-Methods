% Evan Baker
% EAB_HW05_P01
% 19 February 2014

% This script will fit curves to a collection of temperature and water
% content data and interpolate water content at an unmeasured temperature.

clc
clear all
close all

disp('Part A)');
humidity = [ 0 5 ; 10 8 ; 20 15 ; 30 28 ; 40 51 ; 50 94 ];
x = humidity(:,1); % this is T
y = humidity(:,2); % this is m.w


% Linearize m.w = be^(mT) 
% y = be^(mx)  =>  ln(y) = mx + ln(b)
% so we get ln(m.w) = mT + ln(b) and need constants m, b


p = polyfit(x, log(y), 1);
m = p(1);
b = exp(p(2));
fprintf('Function is Mw = %.3f e^ (%.3f T) \n', m, b)

w35 = b*exp(m*35); % estimating water at 35 degrees
% ln(m.w) = mT + ln(b) => m.35 = be^(mT)
fprintf('Water at 35 degrees: Mw.35 = %.3f \n \n', w35);
plot(x, y, 'o', x, b.*exp(m.*x));xlabel('m Water');ylabel('Humidity');



input('Enter to continue to Part B)...\n');
figure (2)
disp('Part B)');

% Get a second order polynomial that fits the data
p2 = polyfit(x, y, 2);
fprintf('Function is Mw = %.3f x^2 + %.3f x + %.3f \n', p2(1), p2(2), p2(3))
% Put the function together and evaluate at 35 degrees
w35v2 = polyval(p2, 35);
fprintf('Water at 35 degrees: Mw.35 = %.3f \n \n', w35v2);
% Plot the data and curve together again
fx = linspace(min(x),max(x));
fy = polyval(p2, fx);
plot(x, y, 'o', fx, fy);xlabel('m Water');ylabel('Humidity');

input('Enter to close windows');
close all