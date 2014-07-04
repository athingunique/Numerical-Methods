% Evan Baker
% EAB_HW07
% 5 March 2014

% This function will process a directory full of .dat files, find a best
% fit line for each set of data, plot all the curves, print the average
% slope, and save all the slopes in to a text file.

function EAB_HW07

close all
clear all
myDir = uigetdir; % get user defined dir
cd(myDir) % move there
files = dir('*.dat'); % process all .dat files in the directory
figure(1);xlabel('d (in)');ylabel('F (oz)');hold on % make our empty figure for later
slope = 1:length(files); % preallocate the slope array to save memory

for i = 1:length(files) % looping through all the files in the dir
    xy = load(files(i).name); % pull the column data out of the file
    x = xy(:,1); % extract the x values from the column data
    y = xy(:,2); % extract the y values from the column data
    slope(i) = x\y; % get the slope of the best fit line through the x,y data
    plot(x,x.*slope(i)) % plot the best fit line for data set i
end

text(1,5.5,sprintf('Average Slope = %.3f',mean(slope))); % put the average best fit slope on the plot
save('slopes.txt','slope','-ascii')
    
end