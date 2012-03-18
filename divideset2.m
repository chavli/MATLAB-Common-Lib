%   
%   divideset2
%   
%   divides the given matrix of examples into two disjoint groups, where
%   each example has a probability of p to be put into the training set until
%   the example limit has been reached.
%
%   arguments:
%       data_m - a matrix representing a data set
%       testp - probability an example will be put into the test set
%   
%   returns:
%       testing_m - a subset of data_m used for testing an agent
%       training_m - a subset of data_m used for training an agent
%

function [ testing_m, training_m ] = divideset2( data_m, testp_n )
    max_training = ceil( testp_n * length(data_m));
    max_testing = floor( (1 - testp_n) * length(data_m));

    cols = size(data_m, 2);
    testing_m = zeros(max_testing, cols);
    training_m = zeros(max_training, cols);
    ctr_0 = 1; ctr_1= 1;
    
    for i = 1:length(data_m)
        if( (mod(randn(1), 1) < testp_n && max_training > 0) || max_testing == 0)
            training_m(ctr_0, :) = data_m(i, :);
            ctr_0 = ctr_0 + 1;
            max_training = max_training - 1;
        else
            testing_m(ctr_1, :) = data_m(i, :);
            ctr_1 = ctr_1 + 1;
            max_testing = max_testing - 1;
        end
    end
    
end

