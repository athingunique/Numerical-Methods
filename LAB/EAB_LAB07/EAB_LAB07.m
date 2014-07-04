% Evan Baker
% EAB_LAB07
% 29 February 2014

clear all
close all

[filename, pathname] = uigetfile({'*.xlsx','Excel Sheets (*.xlsx)'},'Select File'); % Prompt user to load an Excel file
m = xlsread([pathname, filename], 'sheet1'); % Pull sheet 1 out of the xlsx
dims = size(m); % Get the dimensions of the spreadsheet
slice = m(:,dims(2)/2); % Slice to the (left) center column of the sheet

figure(1)
surf(m) % Draw the 3D surface in Window 1

figure(2)
contourf(m) % Draw a contour plot in Window 2

figure(3)
x = 1:dims(1);
plot(x,slice);xlabel('Row');ylabel('Height');  % Plot the (left) center column values as height (y) vs row number (x)

save('slice.dat','m','-ascii'); % Write the sliced column to a text file