% Evan Baker
% p3a.m
% 30 April 2014

% This script will solve problem 3a using ode45 and plot height v time

function p3a(At,Ap,C,k1,k2,rho,g,ho,to,tf)

dh = @ (t,h) (k1 + k2*sin(5*C*t)*cos(C*t) - rho*Ap*sqrt(2*g*h))/(rho*At);
[t,h] = ode45(dh,[to,tf],ho);

figure(3)
plot(t,h);xlabel('Time [sec]');ylabel('Height [m]');
