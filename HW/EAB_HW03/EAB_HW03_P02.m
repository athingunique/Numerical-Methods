% Evan Baker
% EAB_HW03_P02
% 5 February 2014

% This solves for the root of a number using Newton's Method

function EAB_HW03_P02
clear all
p = input('Find the square root of x, x = ');
if p > 0
    xs = squareRoot(p);
else
    disp('Cant take root of a negative')
end
    function xs = squareRoot(p)
        fx = @ (x,p) x^2 - p;
        dfx = @ (x) 2*x;
        xo = p;
        xs = 0;
        for i = 1:20
            if abs(fx(xo,p)) < 10^(-6)
                xs = xo;
                i = 20;
            else
                xo = xo - (fx(xo,p) / dfx(xo));
                i = i + 1;
            end
        end
        if xs ~= xo
            disp('Root not reached')
        else
            disp(xs)
        end
    end % sqRoot function

end % main function