% Evan Baker
% EAB_HW02_P01
% 29 January 2014

% This is just a shell to run
% the function matrixMult
clc
format compact


A = input('Matrix A = ');
B = input('Matrix B = ');
disp('[A]*[B] = [C] =')
C = matrixMult(A,B);
disp(C)