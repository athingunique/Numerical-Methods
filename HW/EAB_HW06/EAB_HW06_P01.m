% Evan Baker
% EAB_HW06_P01
% 26 February 2014

% This scrip will create a surface plot and contour of the surface
% plot with a colorbar.

figure(1) % set that we're working in window 1
[ x, y ] = meshgrid(-2:0.1:2,-2:0.1:2); % build our mesh size
r = sqrt(x.^2 + y.^2); 
z = exp(-r)*cos(4*x)*cos(4*y); % build our height map
shading flat % set shading flat
surf(x, y, z) % draw the surface


figure(2) % move to window 2 while keeping window 1
[ x, y ] = meshgrid(0:0.05:2,0:0.05:2); % new meshgrid from 0 to 2, same size
r = sqrt(x.^2 + y.^2); 
z = exp(-r)*cos(4*x)*cos(4*y); % build our new height map
colormap(spring) % set to ugly colors
contourf(x, y, z) % draw the contour plot
colorbar % draw the colorbar for scale
