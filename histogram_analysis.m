%   
%   histogram_analysis
%   
%   creates a histogram of 20 bins to represent the given attribute vector,
%   where each element is a sample.
%
%   arguments:
%       title - title of the histogram
%       attr_v - the attribute vector to graph
%       bins_n - number of bins
%       autosave_f - flag marking whether or not to autosave figure
%       
%
%   returns:
%       count_v - a vector of the number of things in each bin
%       center_v - the center of each bin

function [count_v, center_v] = histogram_analysis(title_s, attr_v, bins_n, autosave_f)
    f = figure('Name', title_s);
    hist(attr_v, bins_n);
    [count_v, center_v] = hist(attr_v, bins_n);
    title(title_s);
        
    if autosave_f == 1
        filename = sprintf('%s.png', title_s);
        saveas(f, filename);
    end
end

