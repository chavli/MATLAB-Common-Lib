function [ discretized_m, xcorr_v, unbin_v ] = discretize_m( data_m, cols, col_vals, hidden_thresh )
%DISCRETIZE_M
%   returns
%       discretized_m - the discretized dataset
%       xcorr_v - a vector of correlation values representing how similar
%                 the discretized data is to the continuous data
%       unbin_v - a vector of values used to convert discretized data to 
%                 their respective continuous mean value
    
    discretized_m = zeros(size(data_m, 1), size(data_m, 2));
    
    xcorr_v = zeros(1, size(cols, 2));
    unbin_v = zeros(1, size(cols, 2));
    
    %go through each column
    for i=1:size(data_m, 2)
        if any(cols == i)
            xi_rng = col_vals(find(cols == i));
            [discretized_m(:, i), mean] = EM_discretize(data_m(:, i), xi_rng, hidden_thresh);
            
            %caclulate how similar the continuous and discretized signals 
            %are
            [corr, lag] = xcorr(data_m(:, i), discretized_m(:, i), 'coeff');
            
            lag = lag(find(corr == max(corr)));
            %disp(sprintf('discretized column %d: %f %d', i, max(corr), lag));
            xcorr_v(find(cols == i)) = max(corr);
            unbin_v(find(cols == i)) = mean;
        else
            discretized_m(:, i) = data_m(:, i); 
        end
    end
    
    
    
end

