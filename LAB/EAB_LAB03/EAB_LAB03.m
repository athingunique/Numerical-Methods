% Evan Baker
% EAB_LAB03
% 31 January 2014



function EAB_LAB03
    Fx = @ (x) x^3 - 5*x^2 -50*x -50;
    a = input('Start lower value a = ');
    b = input('Start upper value b = ');
    if Fx(a) * Fx(b) > 0
        disp('Root not within bounds')
    else
        root = bisectionRoot(Fx,a,b);
        disp(root)
    end

% The actual bisection function
    function x3 = bisectionRoot(Fx,a,b)
    x1 = a; x2 = b; imax = 20; tol = 0.00001;		
    fprintf('%10s %10s %10s %10s %10s %12s\n',...
        'Iteration','x1','x2','x3','abs(x1-x2)','F(x3)')
    for i=1:imax
        x3 = (x1+x2)/2;
        fprintf('%10g %10g %10g %10g %10g %12.4e\n',...
            i,x1,x2,x3,abs(x1-x2)/2,Fx(x3))
        if Fx(x3)*Fx(x1)<0
            x2 = x3;
        else
            x1 = x3;
        end
        if abs(x1-x2)<2*tol || Fx(x3)==0
            break
        end
    end
    
    end
end