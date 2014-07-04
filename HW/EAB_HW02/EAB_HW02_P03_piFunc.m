% Evan Baker
% EAB_HW02_P03_piFunc
% 29 January 2014

% A slow converging algorithm to compute pi
% n: numbers of terms to sum
% pi_approx: approximate value of pi

n = input('Number of elements to sum, n= ');
[pi_approx,absErr,relErr] = piFunc(n);
hold on
ni = 2:100;
plot(ni,relErr(2:100),ni,absErr(2:100))
xlabel('Number of terms')
ylabel('% Error')
legend('Relative Error','Absolute Error')
