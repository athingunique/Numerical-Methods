% Evan Baker
% EAB_HW06_P02
% 26 February 2014

% This function models an ideal gas molecule bouncing around in a 3D
% 10x10x10 cube and models the movement through 3 bounces. The initial
% velocity vector and position is randomized at runtime.

function EAB_HW06_P02
% This code is written to allow user defined parameters, but not finished.
% v = input('Max vector velocity component of the gas particle? v = '); 
% s = input('Side length of box? s = ');
% fps = input('Frames per (simulation) second? fps = ');
% time = input('Simulate how many seconds? time = ');

% Uncomment the 4 assignments above, comment out the 4 assignments below
% to allow the user to define the side length, max velocity, and framerate
% Some additionally changes are still necessary and haven't been worked
% out completely.

v = 1; % velocity vector
s = 10; % side length of the box
fps = 1; % frame rate resolution of simulation - higher = smoother particle motion
time = 20; % run for 20 seconds normally
safe = s - 1;

p = [randi(safe), randi(safe), randi(safe)]; % define pseudorandom initial position vector
v = [randi(v), randi(v), randi(v)]; % define velocity vector
[xs, ys, zs] = sphere; % build sphere mesh, default radius is 1

count = 0;
j = 1;
% for frames = 1:(fps*time) % generate (seconds)*(frames per second) frames
while count <= 10 % this while loops for a bunch of bounces
    clf
    drawBox
    [v, count] = collision(p,v,count);
    p = v/(fps) + p; % at every time, the new position is the previous position + velocity * time(1), so p + 1 * v
    surf(xs+p(1), ys+p(2), zs+p(3))
    M(j) = getframe(gcf);
    j = j + 1;
end
movie2avi(M, 'bounce.avi', 'compression', 'none');
    function [v, count] = collision(p,v,count)
        for i = 1:3
            if p(i) <= -safe
                v(i) = abs(v(i));
                count = count + 1;
            elseif p(i) >= safe % check the edges for collision
                v(i) = -abs(v(i)); % if a collision state is present, bounce
                count = count + 1; 
            end
        end
    end
    function drawBox
        [X,Y] = meshgrid(-s:20:s,-s:20:s);
        Z = 10*ones(length(X),length(Y));
        surf(X,Y,Z,'Facecolor','none');
        hold on;
        surf(Y,Z,X,'Facecolor','none');surf(Y,Z,X,'Facecolor','none');
        surf(Z,X,Y,'Facecolor','none');surf(-Y,-Z,-X,'Facecolor','none');
        surf(-Z,-X,-Y,'Facecolor','none');
    end
end