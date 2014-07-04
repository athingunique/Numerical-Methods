% Evan Baker
% p3c.m
% 30 April 2014

% This script will solve problem 3c using ode45 and plot several traces of 
% height v time for varying k1

function p3c(At,Ap,C,k2,rho,g)

for k = 300:50:600
    dh = @ (t,h) (k + k2*sin(5*C*t)*cos(C*t) - rho*Ap*sqrt(2*g*h))/(rho*At);
    [t,h] = ode45(dh,[0,150],3);
    figure(5);hold on
    plot(t,h);xlabel('Time [sec]');ylabel('Height [m]');
end