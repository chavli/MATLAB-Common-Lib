%
% pca_reduce.m
%
% Use principal component analysis to reduce the dimensionality of the given
% NxD dataset. Where is number of samples and D is the dimensionality (features)
% to a M dimensional dataset where M < D
%
% parameters:
%   data_m - matrix - dataset (not including class) to reduce
%   M - scalar - target dimensionality, M < D
%
% returns:
%   d - matrix  - a NxM reduced dataset
%   v - scalar  - percent variance captured in reduction
%

function [ d, v ] = pca_reduce( data_m, M )
  data_m = center(data_m); %subtract the mean of each column from each element of the column
  cov_m = cov(data_m);
  [u, eig_vals, pc] = svd(cov_m);
  
  
  d = data_m*pc(:, 1:M);
  if nargout > 1
    eig_vals = diag(eig_vals);  
    v = (cumsum(eig_vals) / sum(eig_vals))(M);
  end

end
