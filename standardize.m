%   
%   nomalize
%   
%   normalizes each element of a column vector based on the following
%   equation:
%           x_norm = (x - mean) / std_dev
%
%   arguments:
%       attr_v - a column vector
%   
%   returns:
%       norm_v - a normalized col vector representing attr_v
%

function [ norm_v ] = standardize( attr_v )
    u = mean(attr_v);
    a = max(attr_v);
    
    len = length(attr_v);
    
    %initialize norm vector
    norm_v = zeros(1, len);
    
    if a > 0
      norm_v = (attr_v - u) ./ a;
    
    %flip to col
    norm_v = norm_v';
end

