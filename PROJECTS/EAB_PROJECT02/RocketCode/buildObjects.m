function [fluid,velocity,drag,thrust,burn,target,rocket] = buildObjects(fluidDensity,xRocketPosition0,yRocketPosition0,xTargetPosition,yTargetPosition,v0,angle0,dragCoefficient,thrust0,burnStart,burnEnd,exitVelocity,massFlow,targetDiameter,rocketMass,rocketDiameter)
% Build all the objects for the rocketdriver script

% Build a fluid medium object
fluid.density = fluidDensity; % Density of the medium that we're flying through [kg/m^3]

% Build a velocity object
velocity.speed = v0; % Initial velocity is zero
velocity.angle = angle0; % Initial velocity angle

% Build a drag object
drag.force = ((v0^2)*dragCoefficient*fluidDensity*(pi*((rocketDiameter)^2)/4))/2; % No drag force at v=0 [m/s]
drag.angle = angle0; % Initial drag angle (180 + velocity angle) [radians]
drag.coefficient = dragCoefficient; % Cd for a sphere

% Build a thrust object
thrust.angle = angle0; % No rotation so thrust angle stays at initial angle [theta]
thrust.force = thrust0; % Thrust at t=0 before any burns [N]

% Build the burn object
burn.starts = burnStart; % Load the burn start times into the object
burn.ends = burnEnd; % Load the burn end times into the object
burn.totaltime = sum(burn.ends-burn.starts); % Total burn time is the sum of the differences in start and end times [s]
burn.exitvelocity = exitVelocity; % Fuel exit velocity [m/s]
burn.massflow = massFlow; % Fuel mass flow rate q [kg/s]
burn.fuelload = burn.massflow*burn.totaltime; % Load the initial fuelmass [kg]

% Build the target object
target.position = [xTargetPosition,yTargetPosition]; % Target position [m]
target.diameter = targetDiameter; % Target entry diameter [m]

% Build the rocket object with all of its properties
rocket.position = [xRocketPosition0,yRocketPosition0];
rocket.velocity = velocity;
rocket.thrust = thrust;
rocket.drag = drag;
rocket.drymass = rocketMass;
rocket.mass = rocket.drymass + burn.massflow*burn.totaltime; % Initial mass is rocket mass + fuel load [kg]
rocket.diameter = rocketDiameter; % Rocket diameter [m]
rocket.bluffarea = pi*((rocket.diameter)^2)/4; % Rocket bluff area for drag calculation
end