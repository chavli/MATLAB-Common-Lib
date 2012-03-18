%
%   norm_dist
%
%   calculates the probability of an event based on a normal distribution
%   
%   arguments
%       xi_n - the event
%       mu_n - the mean of the distribution
%       sigma_n - the std dev of the distribution
%
%   returns
%       prob_n - probability of event xi
%

function [ prob_n ] = norm_dist( xi_n, mu_n, sigma_n )
    prob_n = (1 / ( sigma_n * sqrt(2 * pi) )) * ...
        exp( (-(xi_n  - mu_n)^2) / (2 * sigma_n^2) ); 
end

