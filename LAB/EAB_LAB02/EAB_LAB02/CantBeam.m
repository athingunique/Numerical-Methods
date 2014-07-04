function [displ,slope] = CantBeam(PoverEI,a,x)
% Calculates the displacement and slope of cantilevered beam w/ load @ x=a
% L is the length of the beam.
% a is the location of the load P.
% PoverEI=P/EI, where P is the applied load,
% E is the elastic modulus
% I is the area moment of inertia.
% PoverEI has units of length^-2.
% The same length units must be used for PoverEI, L, and x.
% NOTE: x must be a scalar with 0<=x<=L and a<=L.
if x<a
    displ=-(PoverEI/6)*x^2*(3*a-x);
    slope=-(PoverEI/6)*x*(6*a-3*x);
else
    displ=-(PoverEI/6)*a^2*(3*x-a);
    slope=-(PoverEI/2)*a^2;
end % end of the if-else structure.
