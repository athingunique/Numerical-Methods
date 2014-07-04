% Evan Baker
% EAB_HW08
% 26 March 2014

% This script will perform website ranking metrics with a simplified link
% model.
% Each line represents a website, and each column the links in from the
% other websites.
% [ 0 1 1 1 ; 1 0 1 0 ; 1 1 0 0 ; 0 1 1 0 ], for example.
% Line one shows that Site #1 has links in from Sites #2,3, and 4.
% Then we rank by the real, same sign eigenvector.

A = [ 0 1 1 1 ; 1 0 1 0 ; 1 1 0 0 ; 0 1 1 0 ];
[eVects, eVals] = eig(A);
disp(eVects)
disp(eVals)


% Trying to write a parser to find the same sign, real vector.
% It doesn't deal with imaginary elements well but it works in this
% problem.
sizeVect = size(eVects);

for col = 1:sizeVect(2)
    element = eVects(1,col);
    coluniform = true;
    for row = 1:sizeVect(1)
        if element*eVects(row,col) < 0
            coluniform = false;
        end
    end
    if coluniform == true
        realvect = eVects(:,col);
    end
end
        