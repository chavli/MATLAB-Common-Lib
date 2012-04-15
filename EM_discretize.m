
function [ bins_v, mean ] = discretize( data_v, values, hidden_thresh )
%DISCRETIZE 
%   hidden defines the upper threshold value for hidden values (usually -1,
%   or 0)
%   returns 
%       bins_v, the bin value of each datapoint
%       mean, used to convert a bin value to the mean continuous value   

    %0 based binning

    hidden = find(data_v <= hidden_thresh);
    data_v(hidden) = hidden_thresh; %bump all hidden values to hidden
    
    cleaned = data_v;
    cleaned(hidden) = [];
    [count1, mean] = hist(cleaned, values);
    mean = mean(2) - mean(1);
    
    %calculate the bin means
    [count1, means] = hist(data_v, values);

    %shift the means to be upper edges for bins
    edges = means + ( (means(2) - means(1)) / 2) + .01;

    %use the edges to label each sample with its associated bin
    [count2, bins_v] = histc(data_v, edges);
    
    bins_v(hidden) = hidden_thresh;
end

