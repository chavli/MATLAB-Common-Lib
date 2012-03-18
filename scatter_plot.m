%   
%   histogram_analysis
%   
%   creates a scatterplot comparing two attribute vectors, where each element of
%   the vectors is a sample of the associated attribute.
%
%   arguments:
%       title - title of the histogram
%       attr_v - the x-axis attribute vector to graph
%       attr_w - the y-axis attribute vector to graph
%   
%   returns:
%       nothing
%

function [] = scatter_plot(title_s, attr_v, attr_w)
    f = figure('Name', title_s);
    scatter(attr_v, attr_w);
end

