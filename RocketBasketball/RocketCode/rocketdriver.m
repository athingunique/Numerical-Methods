% Evan Baker
% 30 April 2014

% This script will do rocket science.
% http://xkcd.com/1133

function rocketdriver
global g
global air velocity drag thrust burn hoop bball % Make the objects global so we can edit them from anywhere
global burnstart burnend

% INITIALIZING ALL THE VARIABLES
g = 9.81; % Gravity [m/s^2]
airdensity = 1.298; % Density of the air that we're flying through [kg/m^3]
bxpos = 0; % Ball starts at x=0 [m]
bypos = 0; % Ball starts at y=0 [m]
hxpos = 450; % Goal x position [m]
hypos = 3; % Goal y position [m]
v0 = 0; % It starts out stationary [m/s]
vangle0 = 85; % The angle that it starts out pointing at [degrees]
dragcoefficient = 0.47; % Drag coefficient for a sphere
initialthrust = 0; % No thrust before burns
burnstart = 0; % Set of burn start times
burnend = 1; % Coordinating set of burn end times
exitvelocity = 550; % Fuel exit velocity [m/s]
massflow = .1; % The mass flow rate of the burning fuel [kg/s]
hoopdiameter = 0.4572; % Entry diameter [m]
ballmass = 0.567; % Dry mass of basketball [kg]
balldiameter = .749/pi; % Diameter of basketball [m]



% Build these values into usable objects
[air,velocity,drag,thrust,burn,hoop,bball] = buildObjects(airdensity,bxpos,bypos,hxpos,hypos,v0,vangle0,dragcoefficient,initialthrust,burnstart,burnend,exitvelocity,massflow,hoopdiameter,ballmass,balldiameter);

% Build the gui control panel where the real magic happens
controlpanel

end




