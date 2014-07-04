% Evan Baker
% EAB_HW03_P01
% 6 February 2014

% This script takes a nonlinear function, bounds, 
% and acceptable error value, and outputs the root 
% (or a close estimate)
function EAB_HW03_P01
clear allF
a = input('Lower bound = ');
b = input('Upper bound = ');
errMax = input('Precision = '); % get user defined a,b,errMax
Fx = @ (x) x^3 - 5*x^2 - 50*x -50; % function definition
xs = regulaRoot(Fx,a,b,errMax); % call regulaRoot to find the roots

    function xs = regulaRoot(fun,a,b,errMax)
    if fun(a) * fun(b) > 0
        display('Root outside bounds')
    else
        i = 1;
        while i < 100
            i = i + 1;
            xi = a - ((fun(a) * (b - a)) / (fun(b) - fun(a)));
            if abs(fun(xi)) <= errMax
                i = 100;
                xs = xi;
            else
                if fun(xi) * fun(b) < 0
                    a = xi;
                else
                    b = xi;
                end
            end
        end
        if xs ~= xi
            disp('Too many iterations, no value for the root found')
            xs = 'error';
        end
    end
    end % function RegulaRoot

disp(xs)
end % function main

