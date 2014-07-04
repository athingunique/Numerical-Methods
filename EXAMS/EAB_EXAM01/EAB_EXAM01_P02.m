
function myE(a);
    
    relerror = 1;
    i = 0;
    Ea = 0;
    Fx = @ (x,i) (x^i) / factorial(i);
    while i < 500
        i = i + 1;
        if abs(relerror) <= 10^-5
            i = 500;
        end
        Ea = Ea + Fx(a,i);
    end
end