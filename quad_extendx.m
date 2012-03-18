%
%   quad_extendx
%
%   extends a vector to include all products of it's members
%   [1 2 3] -> [1 2 3 1 2 3 4 6 9]
%
%   arguments
%       data_v - vector to extend
%
%   returns
%       extended_v - the extended vector
%


function [ extended_v ] = quad_extendx( data_v )
    size_v = size(data_v);
    extended_v = zeros(size_v(1) + (size_v(1) * ( size_v(1) + 1)) / 2 , ...
        size_v(2));
    
    ext_i = 1; %keep track of current index in extended_m
    
    %copy over the intial values
    for i = 1:size_v(1)
        extended_v(ext_i) = data_v(ext_i);
        ext_i = ext_i + 1;
    end
    
    %extend the vector
    for i = 1:size_v(1)
        for j = i:size_v(1)
            extended_v(ext_i) = data_v(i) * data_v(j);
            ext_i = ext_i + 1;
        end
    end
end

