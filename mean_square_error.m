%
%   mean_square_error
%
%   calculates the mean square error given the actual class labels and
%   predicted labels
%
%   arguments
%       y_actual_v - vector of true class labels
%       y_predict_v - vector of predicted class labels
%
%   returns
%       mse - the mean square error
%

function [ mse ] = mean_square_error( y_actual_v, y_predict_v )
    mse = 0;
    for i = 1: length(y_actual_v)
        mse = mse + (y_actual_v(i) - y_predict_v(i))^2;
    end
    mse = mse / length(y_actual_v);
end

