%
%   sigmoid
%
%   the sigmoid function
%
%   g(x) = 1 / ( 1 + e^(-x) )
%
%

function [ y ] = sigmoid( x )
    y = 1 / (1 + exp(-x));
end

