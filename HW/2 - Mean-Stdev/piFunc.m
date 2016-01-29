% Evan Baker
% EAB_HW02_P03 (piFunc)
% 29 January 2014

% A slow converging algorithm to compute pi
% n: numbers of terms to sum
% pi_approx: approximate value of pi

function [pi_approx,absErr,relErr] = piFunc(n) 
pi_approx = 0;
pi_list = zeros(n,1);
relErr = zeros(n,1);
absErr = zeros(n,1);
for i = 1:n
    pi_approx = pi_approx + 4*(-1)^(i+1)/(2*i-1);
    pi_list(i) = pi_approx;
end
for i = 2:n
    absErr(i) = abs((pi_list(i) - pi)/pi);
    relErr(i) = abs((pi_list(i) - pi_list(i-1)) / pi_list(i-1));
end

