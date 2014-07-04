% Evan Baker
% EAB_LAB09
% 28 March 2014

% This function will determine the first and second derivatives of a set of
% data - discrete points with equal spacing.

function [yd, ydd] = FrstScndDeriv(x,y)
h = y(2) - y(1);
len = length(x);
yd = zeros(1,len);
ydd = zeros(1,len);

for i = 1:len-2; % get most of the first + second derivative by forward differencing
    yd(i) = (-3*y(i) + 4*y(i+1) -y(i+2)) / (2*h);
end
for i = 1:len-3;
    ydd(i) = (2*y(i) - 5*y(i+1) + 4*y(i+2) -y(i+3)) / (h^2);
end

for i = len-2:len; % get the last couple plots by backwards differencing
    yd(i) = (y(i-2) - 4*y(i-1) + 3*y(i)) / (2*h);
end
for i = len-3:len;
    ydd(i) = (-y(i-3) + 4*y(i-2) - 5*y(i-1) + 2*y(i)) / (h^2);
end

figure(1) % plotting f(x),f'(x),f''(x) in a stacked plot
subplot(3,1,1);
plot(x,y);ylabel('y');grid
subplot(3,1,2);
plot(x(1:len),yd(1:len));ylabel('yd');grid
subplot(3,1,3);
plot(x(1:len),ydd(1:len));ylabel('ydd');grid

end

