%
%   gaussian_kernel
% 
%   the equation for a gaussian (smooth) kernel.
%
%   arguments:
%       test_v - the sample vector being classified
%       train_v - the training sample vector used for comparison
%       h_n - smoothness parameter
%
%   returns:
%       pk_n - the estimated value for test_v
%

function [ pk_n ] = gaussian_kernel( train_v, test_v, h_n )
    %make sure both vectors are row vectors
    if ~isrow(test_v), test_v = test_v'; end
    if ~isrow(train_v), train_v = train_v'; end

    %dimensionality
    d_n = size(train_v, 2);
    
    lol = (1 / (2 * pi * h_n)^(d_n / 2) );
    %disp( -norm(test_v - train_v, 2)^2 / (2*h_n^2) );
    rofl = exp( -norm(test_v - train_v, 2)^2 / (2*h_n^2) );
    
    %disp(lol)
    %disp(rofl)
    
    %gaussian kernel
    pk_n = lol * rofl;
    %pk_n = rofl;
    %pk_n = (1 / (2 * pi * h_n)^(d_n / 2) ) * ...
    %    exp(- (norm(test_v - train_v)^2) / (2 * h_n)^2 );
end

