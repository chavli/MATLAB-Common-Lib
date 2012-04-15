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
    a = std(attr_v);
    
    len = length(attr_v);
    
    %initialize norm vector
    norm_v = zeros(1, len);
    
    for i = 1:len
        norm_v(i) = (attr_v(i) - u) / a;
    end
    
    %flip to col
    norm_v = norm_v';
end

