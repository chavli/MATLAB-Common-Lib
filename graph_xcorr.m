%graphs two signals given a lag value
function [ fig ] = graph_xcorr( signal1, signal2, lag, opt_title)
        
    if nargin == 3
        opt_title = 'default title';
    end
    fig = figure;
    plot(signal1/sum(signal1), 'r');
    hold on
    if(lag ~= 0)
        shift = (abs(lag) + 1) * abs(lag)/lag;
    else
        shift = 1;
    end
    plot((0:length(signal2)-1) + shift, signal2/sum(signal2) ,'b');
    plot((0:length(signal2)-1), signal2/sum(signal2) ,'--b');
    title(opt_title);
end

