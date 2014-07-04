% Evan Baker
% 30 April 2014

% This is the script that finally launches the rocket.
% "If this end starts pointing towards space you are having a bad time and you will not go to space today."

function [x,y] = launchrocket(simDuration,burn,bball)
clc
global air g z simtime hoop
if strcmp(simtime,'7')
    simDuration = 7;
end

bball.drag.constant = bball.drag.coefficient*air.density*bball.bluffarea*.5; % Get a drag constant to simplify drag force calculations
sim.mass = bball.mass;

[t, z] = ode45(@odesys, [0 simDuration], [0 0 0 0]);
figure(2);hold on;clf
x = z(:,1);
y = z(:,3);
v = sqrt(z(:,2).^2 + z(:,4).^2);
subplot(2,1,1);plot(x,y,450+hoop.diameter/2,3,'o',450-hoop.diameter/2,3,'o');xlabel('Distance [m]');ylabel('Height [m]');axis([0 500 0 250]);
subplot(2,1,2);plot(t,v);xlabel('Time [sec]');ylabel('Velocity [m/s]');
fprintf('Final x = %.4f\nFinal y = %.4f\nTime elapsed = %i\nFuel burned = %.3f\n',x(length(x)),y(length(y)),t(length(t)),burn.fuelload);


for j = length(x):-1:1;
    if x(j) >= 450 - hoop.diameter/2
        hoopend = j;
    end
end
for j = 1:length(x)
    if x(j) <= 450 + hoop.diameter/2 - bball.diameter/2;
        hoopstart = j;
    end
end

if y(hoopstart) >= 3 + bball.diameter/2;
    if y(hoopend) <= 3 || y(length(y)) <= 3;
        fprintf('Success\n')
    end
end

function dz = odesys(Tsim, z)
    dz = zeros(4,1);
    burning = false;
    for i = 1:length(burn.starts)
        if Tsim >= burn.starts(i) && Tsim < burn.ends(i)
            burning = true;
        end
    end
    if burning == true
        sim.burnrate = burn.massflow;
        sim.mass = bball.mass - sim.burnrate*Tsim;
    else
        sim.burnrate = 0;
        if Tsim ~= 0;
            sim.mass = bball.drymass;
        end
    end
    if bball.mass < 0
        disp('Your basketball has negative mass.')
    end
    bball.velocity.speed = sqrt(z(2)^2 + z(4)^2);
    if Tsim == 0
        cosTheta = cosd(bball.velocity.angle);
        sinTheta = sind(bball.velocity.angle);
    else
     
        cosTheta = z(2)/bball.velocity.speed;
        sinTheta = z(4)/bball.velocity.speed;
    end 
    dz(1) = z(2);
    dz(2) = cosTheta*(-bball.drag.constant*bball.velocity.speed^2 + burn.exitvelocity*sim.burnrate)/sim.mass;
    dz(3) = z(4);
    dz(4) = sinTheta*(-bball.drag.constant*bball.velocity.speed^2 + burn.exitvelocity*sim.burnrate)/sim.mass - g;
    end
end
