
function myE(a)
    
    relError = 1;
    i = 0;
    Ea = 0;
    Fx = @ (x,i) (x^i) / factorial(i);
    while i < 500
        if abs(relError) <= 10^-5
            count = i;
            i = 500;
        end
        EaLast = Ea;
        Ea = Ea + Fx(a,i);
        relError = abs(Ea - EaLast / EaLast);
        i = i + 1;
        count = i;
    end
    disp('relError');
    disp(relError);
    trueError = Ea - exp(a) / exp(a);
    disp('trueError');
    disp(trueError);
    disp('count');
    disp(count);
    disp('e^x');
    disp(Ea);
end