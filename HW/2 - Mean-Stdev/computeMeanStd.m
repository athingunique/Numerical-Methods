% Evan Baker
% EAB_HW02_P02 (computeMeanStd.m)
% 29 January 2014

% This function takes a data set input and returns a mean and std
function [meanValue, stdValue] = computeMeanStd(data)

sumMean = 0; % initialize sum vars
sumStd = 0;

for i = 1:length(data) % loop through data
    sumMean = data(i) + sumMean; % get the sum of data
end
meanValue = sumMean / length(data); % get the average of data

for i = 1:length(data) % loop through data again
    sumStd = (data(i) - meanValue)^2 + sumStd; % get the sum used in Std for data
end
stdValue = sqrt(sumStd / (length(data) - 1)); % get the stdDev of data
end
