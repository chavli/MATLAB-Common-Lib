%
%   exp_dist
%
%   caluculate the probably of an event given an exponential distribution.
%   can be used after expfit
%
%   arguments
%       xi_n - an event
%       mu_n - the mean of the event distribution
%   
%   returns
%       prob_n - the probability tied to the given event
%

function [ prob_n ] = exp_dist( xi_n, mu_n )
    prob_n = ( 1 / mu_n ) * exp( -xi_n / mu_n);
end

