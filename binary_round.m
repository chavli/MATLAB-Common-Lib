function [ rounded_v ] = binary_round( values_v,  median )

%default values
if (nargin < 2), median = .5; end

%flip to row if necessary
if ~isrow(values_v)
    values_v = values_v';
end

rounded_v = zeros(1, size(values_v,2));

for i=1:length(values_v)
    if values_v(i) >= median
        rounded_v = 1;
    end
end

