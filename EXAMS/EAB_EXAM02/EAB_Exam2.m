%%
% Problem 1
clear all
% Part a)
clc
[x,y] = meshgrid(linspace(-2*pi,2*pi,40),linspace(-2*pi,2*pi,40));
z = cos(x).*sin(y);
figure(1)
surf(x,y,z)
% Part b)
figure(2)
contourf(x,y,z)
colorbar
% Part c)
save('z.dat','z','-ascii')

%% Problem 2
clear all
% Part a) 
v = @ (t) 3500*sin(140*pi.*t).*exp(-63*pi.*t);

N = 30;
t = linspace(0,0.001,N+1);
h = (0.001-0)/N;
E = (v(t).^2)/50;

I = trapz(t,E);
fprintf('Trapz: Joules delivered: %.3f\n',I);

% Part b)
time = .01; % time to deliver 250 +-5 J to patient at R = 50 
t = linspace(0,time,N+1);
h = (time-0)/N;
E = (v(t).^2)/50;

I = trapz(t,E);
fprintf('Trapz: Joules delivered: %.3f\n',I);

% Part c)
E = @ (t) (v(t).^2)/50;
I = integral(E,0,0.001);
fprintf('Integal: Joules delivered: %.3f\n',I);
I = integral(E,0,0.01);
fprintf('Integal: Joules delivered: %.3f\n',I);

% Part d)
% The two methods above differ because Trapz uses the trapezoidal
% approximation with N sections, while Integral uses a form of quadrature.

%% Problem 3
% dmi/dt = k1 + k2*cos(C*t) | mass in per time, k1,k2,C constant
% dmo/dt = rho*Ap*sqrt(2*g*h) | rho = density of water, A = area of pipe,
% g = gravity, h = height
% dm/dt = dmi/dt - dmo/dt | time rate of change of mass of water in tank
At = 3.13;
Ap = 0.06;
C = pi/12;
k1 = 300;
k2 = 1000;
rho = 1000;
g = 9.81;
% Part a)
p3a(At,Ap,C,k1,k2,rho,g,3,0,150);

% Part b)
p3b(At,Ap,C,k1,k2,rho,g,2,10,1);

% Part c)
p3c(At,Ap,C,k2,rho,g);