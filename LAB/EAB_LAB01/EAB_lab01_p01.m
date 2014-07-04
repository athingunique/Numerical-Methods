% Evan Baker
% EAB_lab01_P01.m
% Due 17 January 2014
% Computing the angle between two user entered vectors
% Vectors can be any matched dimension and angle is returned in degrees

disp('This program takes two vector inputs and calculates the angle between them.')
a = input('Vector 1: '); % get first vector
b = input('Vector 2: '); % get second vector
lenA = length(a); % get dimension of vectors
lenB = length(b); % again

dotAB = dot(a,b); % get dot product of 2 vectors

sumA = 0; % declaring for loop
sumB = 0; % declaring for loop

% this loop will iterate over the length of the vector 
% allowing arbitrary (matching) vector length
for x = 1:lenA % doing sum of squares to get length of vectors
    sumA = a(x)^2 + sumA;
end
absA = sqrt(sumA);

for y = 1:lenB % again
    sumB = b(y)^2 + sumB;
end
absB = sqrt(sumB);

angleRads = acos(dotAB/(absA*absB));
angleDegrees = (angleRads*180)/pi;
fprintf('The angle between the vectors is %f\n', angleDegrees)