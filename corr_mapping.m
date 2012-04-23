%
%   corr_mapping.m
%
%   given two signals (source and target), this function calculates the 
%   cross correlation between them and extracts the lag value with the 
%   highest correlation value. using the lag, it returns a linear equation 
%   (mx + b) that maps datapoints from the source signal to the target 
%   signal.
%
%   arguments
%       target_v - the target signal
%       source_v - the source signal
%
%   returns
%       params_v - contains the m and b (respectively) values describing 
%                the mapping between source and target at max correlation.

function [ params_v ] = corr_mapping( source_v, target_v )
    [source_y, source_means] = hist(source_v, 20);
    [target_y, target_means] = hist(target_v, 20);
    
    %second signal gets shifted
    [corr, lag] = xcorr(source_y, target_y, 'coeff');
    max_corr = find(corr == max(corr));
    shift = lag(max_corr);
    
    %shift the means
    %disp(shift);
    if shift <= 0
        source_means = source_means(1: length(source_means) + shift);
        target_means = target_means(1-shift:(length(target_means)));
    else    
        source_means = source_means(1: length(source_means) - shift);
        target_means = target_means(1+shift:(length(target_means)));        
    end
    params_v = polyfit(source_means, target_means, 1);
    
    %{
    figure
    plot(source_means, target_means, '.r');
    title(sprintf('%f %f', max(corr), shift));
    xlabel('source_v');    
    ylabel('target_v');
    %}
    

end

