% Evan Baker
% EAB_HW11
% 16 April 2014

% This script will solve the nonlinear Duffing equation
% The required constants are defined here.
function [x,y] = EAB_HW11()
clc
V = 165; % Source Voltage
N = 600; % Primary windings
w = 120*pi; % Frequency
wo = sqrt(83); % Resonant? Frequency
a = 0.14;
% phi(0) = 0
% phi'(0) = 0

%We will solve and then plot phi vs time

% phi''                        w
% ----- + wo^2*phi + a*phi^3 = - *V*cos(w*t)
% dt''                         N

% Linearizes to:
% phi = x
% x' = y
% y' + wo^2 * x + a* x^3 = w/N*V*cos(w*t)

[x,y] = ode45(@odesys,[0,.1],[0,0]);
plot(x,y(:,2));legend('\phi');xlabel('Time (s)');ylabel('Flux \phi');

function dy = odesys(x,y)
    dy = zeros(2,1);
    dy(1) = y(1);
    dy(2) = -(wo^2)*y(2)-a*(y(2)^3)+(w/N)*V*cos(w*x);
end
end
