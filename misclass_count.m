%
%   misclass_count
%
%   count the differences in classification labels
%   
%   arguments
%       actual_v - vector of true class labels
%       predict_v - vector of predicted class labels
%
%   returns
%       count_n - number of misclassified labels
%       error_rate_n - percentage of misclassified labels
%

function [ count_n, error_rate_n ] = misclass_count( actual_v, predict_v)
    count_n = 0;
    samples_n = size(predict_v, 1);
    for sample=1:samples_n
        if actual_v(sample) ~= predict_v(sample)
            count_n = count_n + 1;
        end
    end
    
    error_rate_n = count_n / samples_n;

end

