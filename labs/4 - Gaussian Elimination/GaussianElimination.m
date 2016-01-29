% Evan Baker
% EAB_LAB04_P01
% 7 February 2014
% Gaussian elimination (matrix reduction) using Gauss-Jordan

function ab = gaussJ(ab) % subfunc to solve aug matr
    sizeab = size(ab); % get rows
    rowsab = sizeab(1);
    for i = 1:rowsab % iterating across the matr
        for j = 1:rowsab
            if i ~= j
                ab(j,:) = -ab(j,i)/ab(i,i) * ab(i,:) + ab(j,:);
            end
        end
    end
    for i = 1:rowsab
        ab(i,:) = ab(i,:)/ab(i,i);
    end
end

function GaussianElimination % main func
    a = input('Input matr a = '); % get coeff matr
    b = input('Input matr b = '); % get soln matr
    abIn = [a b]; % build augmented matr
    abOut = gaussJ(abIn); % call subfunc
    disp(abOut)
end