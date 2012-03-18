%
%   binary_logistic_predict.m
%   
%   uses the sigmoid function with the given sample attributes and
%   calculated weights to classify each sample.
%
%   assumption: last column of data_m is the classification (ignored)
%   assumption: first column of weights_v is weight_0 (bias term)
%
%   arguments
%       data_m - dataset to classify, includes class column
%       weights_v - vector of weight values
%
%   returns
%       class_v - vector of class predictions
%       posterior_v - the set of posterior values associated with
%           predictions
%

function [ class_v, posterior_v ] = binary_logistic_predict( data_m, weights_v )
    samples_n = size(data_m, 1);
    attrs_n = size(data_m, 2) - 1;
    
    weight_0 = weights_v(1);
    
    %make sure weights_v is a column vector
    if ~iscolumn(weights_v)
        weights_v = weights_v';
    end
    
    %classify all the samples
    class_v = zeros(samples_n, 1);
    posterior_v = zeros(samples_n, 1);
    
    
    for sample=1:samples_n
        sample_v = data_m(sample,1:attrs_n);
        %discriminant functions
        posterior_v(sample) = sigmoid((sample_v * weights_v(2:attrs_n+1)) + weight_0);
        
        if posterior_v(sample) >= .5
            class_v(sample) = 1;
        end
    end 
end

