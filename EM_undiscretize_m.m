function [ undescretized_m ] = EM_undiscretize_m( discretized_m, original_m, cols, unbin_v )
%UNDESCRETIZE_M takes a dataset discretized by discretized_m and reverses
%the operation
%   arguments:
%       discretized_m - the discretized matrix returned by EM_descretize_m and
%                           processed by EM
%       original_m - the original matrix
%       cols - the continuous columns
%       unbin_v - the unbinning ratios returned by EM_descretize_m
%
    for i=1:size(discretized_m, 2)
        if any(cols == i)
            for j=1:size(discretized_m, 1)
                if original_m(j, i) == -1 
                    %multiple EM value by the unbin value to map it to a mean
                    %continuous value
                    discretized_m(j, i) = discretized_m(j, i) * unbin_v(find(cols == i));
                else
                    %copy back the original value
                    discretized_m(j, i) = original_m(j, i);
                end
            end
        end
    end
    undescretized_m = discretized_m;
end

