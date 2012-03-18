%
%   rm_outliers
%   
%   removes rows from target_m that are beyond step*stddev from the
%   mean
%

function [ cleaned_m, mu, sigma ] = rm_outliers( target_m, step_n )
    to_rm = [];
    for col=1:size(target_m, 2)
        mu = mean(target_m(:, col));
        sigma = std(target_m(:, col));
      
        %disp(sigma);
        
        range = sigma*step_n;
    
        for i=1:size(target_m, 1)
            if abs( target_m(i, col) - mu ) >= range
                %target_m(i, col) = mu;
                to_rm(length(to_rm) + 1) = i;
            end
        end
    end
    %disp(to_rm);
    cleaned_m = target_m;
    cleaned_m(to_rm, :) = [];
end

