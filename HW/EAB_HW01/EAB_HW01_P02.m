% Evan Baker
% EAB_hw01_P02.mcl
% Due 23 January 2014

% define the equations for use later:
% fx = (x^3)*cos(x);
% fa = (a^3)*cos(a);

i = 1; % set iteration counter
sumY = 0; % set summation var to 0
for x = 2.6:.05:3.4 % for a range just above and below the target
    if x ~= 3.0 % and not including the target (0/0 errors)
        dY(i) = ((x^3)*cos(x) - 3*cos(3)) / (x - 3); % slope math
        sumY = sumY + dY(i); % count the sum
        xi(i) = x; % store the result in a vector
        i = i + 1; % increment the counter
    else
    end
end

avgslope = sumY /  16 % get the average slope
plot(xi, dY) % plot the slope values vs x for the given range