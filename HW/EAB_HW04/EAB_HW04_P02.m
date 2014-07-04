% Evan Baker
% EAB_HW04_P02
% 12 February 2014

function EAB_HW04_P02
F = input('Force (assume 1), F = ');
k = input('k (assume 1), k = ');
% th = input('angle theta = ');
iL = input('Lower bound of theta = '); % get angle lower bound
iU = input('Upper bound of theta = '); % get angle upper bound
iS = input('Step increment of theta = '); % get angle step
sol = linspace(iL,iU,iL-iU/iS); % prealloc sol vector
for i = 1e-7:1e-7:1e-6 % loop through every angle step
    th = i;
    sol(i/5,1) = i;
    [sol(i/5,2),sol(i/5,3)] = springSys(th,F,k); % solve the system at angle th
end
disp(sol) % disp matr sol [angle displacement condition]
graph = plotyy(sol(:,1),sol(:,2),sol(:,1),sol(:,3)) % plot the above matr soln
axes(graph(1));ylabel('Displacement');
axes(graph(2));ylabel('Condition Number');xlabel('Angle - degrees');title('Spring system displacements');

    function [yDisp, cn] = springSys(th,F,k) % solves the matrix system of eqs for the spring sys
    A1 = k.*[ cosd(th)^2, 0; 0, sind(th)^2]; % def matr a
    B1 = [ 0; -F]; % def matr b
    soln = A1\B1; % divide for soln matr
    yDisp = soln(2,1); % pull y disp out of soln matr
    cn = cond(A1); % get cond of a
    end

end