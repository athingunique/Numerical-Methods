% Evan Baker
% EAB_LAB11
% 11 April 2014

clear all
close all
% This script will solve an ODE for a simple circuit 
% dI/dt = Vo/L - R/L * I
Vo = 500; % Volts
L = 15; % Henries
% Nonlinear resistor
R = @ (i) 500 + 250*(i^2); % ohms
f = @ (I,t) Vo/L - (R(I)/L)*I;

h = .001;
t(1:100) = 0;I(1:100) = 0;

% 1: Euler's Method
for i = 2:100;
    t(i) = t(i-1) + h;
    I(i) = I(i-1) + h*f(I(i-1));
end
hold on
figure(1);plot(t,I,'b');xlabel('t');ylabel('I');

% 2: 4th order Runge-Kutta
for i = 2:100
    k1 = f(I(i-1));
    k2 = f(I(i-1) + k1*h/2);
    k3 = f(I(i-1)+k2*h/2);
    k4 = f(I(i-1)+k3*h);
    I(i) = I(i-1)+(k1+2*k2+2*k3+k4)*h/6;
end
plot(t,I,'r');

f1 = @ (t,I) Vo/L - (R(I)/L)*I;
% 3: ode45 
[X, Y] = ode45(f1,t,0);
plot(X,Y,'-.g');xlabel('Time');ylabel('Current');