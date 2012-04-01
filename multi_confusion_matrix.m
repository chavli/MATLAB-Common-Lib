%
%   multi_confusion_matrix
%
%   assumption: given vectors contain exactly num_classes discrete values
%   {1...N}
%
%   creates a confusion matrix given the actual class data and predicted
%   class data
%
%       1 ... N
%   1
%   .
%   .
%   .
%   N   
%
%  
%   arguments:
%       actual_v - vector of true class labels
%       predict_v - vector of predicted class label
%
%   returns
%       confuse_m - the confusion matrix
%

function [ confuse_m ] = multi_confusion_matrix( actual_v, predict_v, num_classes )
    confuse_m = zeros(num_classes);
    size_v = size(predict_v);
    
    %go through each predicted value
    for sample=1:size_v(1)
        %true positive
        if actual_v(sample) == predict_v(sample)
            confuse_m(actual_v(sample), actual_v(sample)) = confuse_m(actual_v(sample), actual_v(sample)) + 1;
            
        %false positive
        elseif actual_v(sample) ~= predict_v(sample)
            confuse_m(actual_v(sample), predict_v(sample)) = confuse_m(actual_v(sample), predict_v(sample)) + 1;
        end
    end
end


