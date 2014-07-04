% Evan Baker
% gaussJ.m Modified from
%%%     EAB_LAB04_P01       %%%
%%%     7 February 2014     %%%
% 12 February 2014

function ab = gaussJ(a,b) % subfunc to solve matrix system
    ab = [a b]; % build augmented matr
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
