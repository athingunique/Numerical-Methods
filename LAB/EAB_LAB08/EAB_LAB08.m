% Evan Baker
% EAB_LAB08.m
% 21 March 2014

% This script explores eigenvectors and eigenvalues
clc
clear all
close all

sig = [40 20 -18;20 28 12; -18 12 14]; % define stress tensor sigma
[eVect, eVals] = eig(sig); % get eigenvector/values of sigma
disp('For the tensor:');disp(sig);
disp('The principle stresses are:');disp(eVect);
disp('The principle directions are:');disp(eVals);

m = 1;
L = 1;
g = 9.8;
matr1 = [(m + m)*L m*L; m*L m*L];
matr2 = [(m + m)*g 0; 0 m*g];
[vect, vals] = eig(matr1,matr2);
disp('For the spring system described by:');disp(matr1);disp(matr2);
disp('The eigen vectors are:');disp(vect);
disp('The eigen values are:');disp(vals);