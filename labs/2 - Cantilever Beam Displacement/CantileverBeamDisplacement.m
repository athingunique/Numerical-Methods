% Evan Baker
% EAB_LAB02_P01.m
% Due 23 January 2014
% Adapted from:
%    % slade
%    % v0.1 1/4/14
%    %
%    % script will compute and plot displacement and slope of a
%    % cantilever beam. 7 different plot colors are chosen and
%    % and the beam is examined the load is walked the length
%    %

clear all
close all
P=100; % Applied load, lbf
E=3e7; % Modulus for Aluminum, psi
I=1/12*1*1^3; % Section I for 1in square Bar (in^4)
poei = P/E/I;
BeamL=15; % Length of the beam, in
N = 20; % number of steps
x = linspace(0,BeamL,N); % create an x vector along the beam
displ = zeros(N,1); % allocate space for displ
slope = zeros(N,1); % allocate space for displ
linecolor=['rgbcmyk']; % define a array for color of each curve
M = input('Number of steps(max=7)'); % set the number of steps (# of colors)
% LoadPos = linspace(0,BeamL,M); % walk down the beam length in M steps
% **Make this var on the fly in the loop instead of as a list out here
figure % create a figure
hold on % hold the figure so all plots are shown
for j=1:M
    LoadPos = j * (BeamL / M); % **Replaced inner loop LoadPos(j) with an outer loop computed position
    % for i=1:N % **Removed inner loop
    %    [displ(i),slope(i)]=CantBeam(poei,LoadPos(j),x(i));
    % end
    % plot(x,displ,linecolor(j));
    for i = 1:N % **Creating a matrix instead of plotting lists individually
        displ(i,j) = CantBeam(poei,LoadPos,x(i));
    end
end
plot(x,displ) %**Moved plotting outside of loops
xlabel('position along beam (in)');ylabel('displacement (in)');
title('displacement of cantilever beam')
