%   
%   zero_split
%   
%   splits the given data into two groups, one where all the examples have a 0
%   in the given column and one that holds the rest.
%
%   arguments:
%       data_m - a matrix represening a data set where columns are
%       attributes
%       col - the column number to split on
%   
%   returns:
%       group_ones - a subset of data_m where each element has a non-zero
%           value in the given column
%       group_zeros - a subset of data_m where each element has a zero
%           value in the given column
%

function [ nonzero_m, zero_m ] = zero_split( data_m, col)    
    cols = size(data_m, 2);
    samples = size(data_m, 1);
    ones = find(data_m(:, col));
    ctr_1 = 1; ctr_0 = 1;
    
    
    %split the test data into two groups
    nonzero_m = zeros(length(ones), cols);
    zero_m = zeros(samples - length(ones), cols);

    for i = 1:length(data_m)
        if any(ones==i)
            nonzero_m(ctr_1, :) = data_m(i, :);
            ctr_1 = ctr_1 + 1;
        else
            zero_m(ctr_0, :) = data_m(i, :);
            ctr_0 = ctr_0 + 1;
        end
    end


end

