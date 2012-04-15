%
%   nomalize_m
%
%   convenience function that normalizes all the columns in a matrix.
%   normalizes class column if the flag is set to one
%
%   arguments
%       data_m - dataset including class label
%       norm_class_f - flag determining if class label should be normalized
%
%   returns
%       normalized_m - the normalized dataset
%

function [ normalized_m ] = standardize_m( data_m, norm_class_f )
    size_v = size(data_m);
    attrs_n = size_v(2) - 1;
    
    normalized_m = zeros(size_v(1), size_v(2));
    
    for attr=1:attrs_n
        normalized_m(:, attr) = standardize(data_m(:, attr));
    end
    
    %normalize class if specified
    if norm_class_f == 1
        normalized_m(:, size_v(2)) = standardize(data_m(:, size_v(2)));
    else
        normalized_m(:, size_v(2)) = data_m(:, size_v(2));
    end
end

