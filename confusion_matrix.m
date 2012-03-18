%
%   confusion_matrix
%
%   assumption: vector arguments are binary vectors
%
%   creates a confusion matrix given the actual class data and predicted
%   class data
%
%       1   0
%   1   TP  FP  
%   0   FN  TN
%
%   additionally, a second matrix is returned containing statistics about
%   the confusion matrix
%
%   sens            spec
%   PPV             NPV
%
%   sens = sensitivity = TP / (TP + FN)
%   spec = specificity = TN / (TN + FP)
%   PPV = positive predictive value = TP / (TP + FP)
%   NPV = negative predictive value = TN / (TN + FN)
%
%   arguments:
%       actual_v - vector of true class labels
%       predict_v - vector of predicted class label
%
%   returns
%       confuse_m - the confusion matrix
%       stats_m - a statistics matrix describing confuse_m
%

function [ confuse_m, stats_m ] = confusion_matrix( actual_v, predict_v )
    confuse_m = zeros(2);
    size_v = size(predict_v);
    
    %go through each predicted value
    for sample=1:size_v(1)
        %true positive
        if actual_v(sample) == 1 && predict_v(sample) == 1
            confuse_m(1, 1) = confuse_m(1, 1) + 1;
            
        %false positive
        elseif actual_v(sample) == 0 && predict_v(sample) == 1
            confuse_m(1, 2) = confuse_m(1, 2) + 1;

        %false negative
        elseif actual_v(sample) == 1 && predict_v(sample) == 0
            confuse_m(2, 1) = confuse_m(2, 1) + 1;

        %true negative
        elseif actual_v(sample) == 0 && predict_v(sample) == 0
            confuse_m(2, 2) = confuse_m(2, 2) + 1;
        end
    end
    
    %calculate sens, spec, ppv, npv respectively
    stats_m(1, 1) = confuse_m(1, 1) / ( confuse_m(1, 1) + confuse_m(2, 1));
    stats_m(1, 2) = confuse_m(2, 2) / ( confuse_m(2, 2) + confuse_m(1, 2));
    stats_m(2, 1) = confuse_m(1, 1) / ( confuse_m(1, 1) + confuse_m(1, 2));
    stats_m(2, 2) = confuse_m(2, 2) / ( confuse_m(2, 2) + confuse_m(2, 1));
end


