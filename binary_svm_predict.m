%
%   binary_svm_predict
%
%   classifies a data set given the results of an SVM model.
%   y = wx + b
%   
%   where the equation represents the decision boundary
%   w is the set of calculated weights
%   x is the sample to be classified
%   b is the bias
%
%   assumption - sample_m contains only attribute columns
%
%   arguments
%       sample_m - dataset containing only attribute columns
%       weights_v - vector of calculated weights associated with each
%           column
%       bias - weight_0, the bias term
%
%   returns
%       predict_v - vector of class predictions
%       posterior_v - the set of posterior values associated with
%           predictions
%

function [ predict_v, posterior_v ] = binary_svm_predict( sample_m, ...
    weights_v, bias )
    samples_n = size(sample_m, 1);
    
    %make sure weights is a col vector
    if ~iscolumn(weights_v)
        weights_v = weights_v';
    end
    
    predict_v = zeros(samples_n, 1);
    posterior_v = zeros(samples_n, 1);
    
    for sample=1:samples_n
        sample_v = sample_m(sample, :);
        class = (sample_v * weights_v) + bias;
        
        posterior_v(sample) = class;
        if class > 0
            predict_v(sample) = 1;
        end
    end

end

