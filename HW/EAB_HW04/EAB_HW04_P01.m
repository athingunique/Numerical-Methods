% Evan Baker
% EAB_HW04_P01
% 12 February 2014

% This script will solve a pre-pivoted matrix of nth dimension
% First we call a modified version of the lab Gauss-Jorden script written in Lab04 - gaussJ.m - to do the actual solving
% We then call the lab script again but modify the input arguments to recieve [a]^-1 from the elimination
function EAB_HW04_P01(a, b)
%a = input('Input prepivoted matr a = '); % get coeff matr
%b = input('Input adjusted soln matr b = '); % get soln matr
sizeA = size(a); % get size of a for next step
solnAB = gaussJ(a,b) % call elimination script
matlabSolnAB = a \ b



b = eye(sizeA(1)); % make an identity matrix b for inverting a
invA = gaussJ(a,b) % call elimination script with a,b to invert a
matlabInvA = a \ b%;


	function [solnAB] = gaussJ(a,b) % subfunc to solve matrix system
	    ab = [a b]; % build augmented matr
	    sizeAB = size(ab); % get rows
	    rowsab = sizeAB(1);
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
        colSol = sizeAB(2) - sizeA(2);
        for i = (sizeA(2)+1):sizeAB(2)
            solnAB(:,i-sizeA(2)) = ab(:,i); 
        end
    end

end

