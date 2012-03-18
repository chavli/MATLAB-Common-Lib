%   
%   divideset1
%   
%   divides the given matrix of examples into two disjoint groups, where
%   each example has a probability of p to be put into the training set.
%
%   arguments:
%       data_m - a matrix representing a data set
%       p - probability an example will be put into the training set
%   
%   returns:
%       testing_m - a subset of data_m used for testing an agent
%       training_m - a subset of data_m used for training an agent
%

function [ testing_m, training_m ] = divideset1( data_m, p )
    training_m = [];
    testing_m = [];
    for i = 1:length(data_m)
        if( mod(randn(1), 1) < p )
            training_m = cat(1, training_m, data_m(i, :));
        else
            testing_m = cat(1, testing_m, data_m(i, :));
        end
    end
end

