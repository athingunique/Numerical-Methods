% Evan Baker
% EAB_HW02_P01 [matrixMult.m]
% 29 January 2014

% This function gets passed two matrices, multiplies them together, and
% returns them.

function M3 = matrixMult(M1,M2)

% M1 = input('Matrix 1 = '); % get user to input matrices to mult
% M2 = input('Matrix 2 = ');

[rowM1,colM1] = size(M1); % size the matrices for useful dims
[rowM2,colM2] = size(M2);

if colM1 ~= rowM2 % error check for dim mismatch
    disp('M1, M2 dimensions mismatched, cannot multiply.') % throw error
else % if dims match
    M3 = zeros(rowM1,colM2); % generate the soln matr to be populated in the loop
    % This loop builds a seperate soln matr for each set of indexed terms
    % that are added together in the final soln, then adds them together to
    % generate the soln matr. Essentially a 3D loop that flattens to a 2D
    % matrix for the soln.
    for x = 1:colM1 % loop over summed terms
        for m = 1:rowM1 % loop over rows in M1
            for n = 1:colM2 % loop over cols in M2
                M3(m,n) = M1(m,x)*M2(x,n) + M3(m,n); % do the math bit
            end
        end
    end
end

end