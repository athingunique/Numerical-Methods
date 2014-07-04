% Evan Baker
% p3b.m
% 30 April 2014

% This script will solve problem 3b using ode45 and plot several traces of 
% height v time for varying initial heights

function p3b(At,Ap,C,k1,k2,rho,g,ho,hf,hstep)

dh = @ (t,h) (k1 + k2*sin(5*C*t)*cos(C*t) - rho*Ap*sqrt(2*g*h))/(rho*At);
for h = ho:hstep:hf
    [t,height] = ode45(dh,[0,150],h);
    figure(4);hold on
    plot(t,height);xlabel('Time [sec]');ylabel('Height [m]');
end