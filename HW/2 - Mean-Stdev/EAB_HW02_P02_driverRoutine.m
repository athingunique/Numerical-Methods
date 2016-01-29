% Evan Baker
% EAB_HW02_P02_driverRoutine
% 28 January 2014

% this is the driver routine for the compute mean and std routine for HW02

format long 
format compact % set long format and no addtl newline
data = randn(1,10000); % generate 10k normal random datapoints
[m, s] = computeMeanStd(data); % do my mean std func
disp([m, s]) % disp my results
disp([mean(data), std(data)]) % do and display matlab's mean & std results 