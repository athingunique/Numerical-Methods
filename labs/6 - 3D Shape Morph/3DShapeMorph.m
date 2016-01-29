% Evan Baker
% EAB_LAB06_P02
% 21 February 2014

% This script animates an ellipsoid morphing in to a sphere and oscillating
% with a cos function

r = 29.5/(2*pi);
sx = linspace(5.9,r,30);
sy = linspace(3.25,r,30);
sz = linspace(3.25,r,30);
theta = linspace(0,2*pi,30);


for i = 1:30
    axis([-10 10 -10 10 -10 10])
    [x,y,z] = ellipsoid(0,0,0,sx(i),sy(i),sz(i),50);
    surf(x,y,z+sin(theta(i)))
    axis([-6 6 -6 6 -6 6 ])
    mov(i) = getframe(gcf);
end

movie2avi(mov, 'wave.avi', 'compression', 'none');