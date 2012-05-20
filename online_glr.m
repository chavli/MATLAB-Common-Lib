%
%   online_glr.m
%   
%   Online Gradient Descent (for GLR)
%   uses the gradient descent of logistic regression to calculate the
%   weights of a linear decision boundary
%
%   
%
%

function [ weights_v ] = online_glr( data_m, class_v, trials_n, step_f, test_m)
    %add bias value
    data_m = horzcat(ones(size(data_m, 1), 1), data_m);
    test_m = horzcat(ones(size(test_m, 1), 1), test_m);
    
    attrs_n = size(data_m, 2);
    samples_n = size(data_m, 1);

    %initialize weights
    weights_v = ones(1,attrs_n);
    
    %check step flag
    if step_f == 1
        pgraph = init_progress_graph; 
    end
    
    %go through all trials
    for trial=0:trials_n - 1
        alpha = 1 / sqrt(trial + 1);
        sample = mod(trial, samples_n) + 1; %pick a sample

        %online weight update
        sample_v = data_m(sample, :);
        guess = sigmoid((weights_v(1:attrs_n) * sample_v(1:attrs_n)'));
        weights_v = weights_v + alpha * (class_v(sample) - guess) * (sample_v(1:attrs_n));
       
        %update graph if step is enabled
        if step_f == 1 && mod(trial, 50) == 0
            y_predict =  binary_logistic_predict(data_m, weights_v);
            y_actual = data_m(:, size_v(2));
            traine = mean_square_error(y_actual, y_predict);

            y_predict =  binary_logistic_predict(test_m, weights_v);
            y_actual = test_m(:, size_v(2));
            teste = mean_square_error(y_actual, y_predict);
            
            pgraph = add_to_progress_graph(pgraph, trial / 50, traine, teste);
        end
    end
    
    %add the last step
    if step_f == 1
        y_predict =  binary_logistic_predict(data_m, weights_v);
        y_actual = data_m(:, size_v(2));
        traine = mean_square_error(y_actual, y_predict);

        y_predict =  binary_logistic_predict(test_m, weights_v);
        y_actual = test_m(:, size_v(2));
        teste = mean_square_error(y_actual, y_predict);

        add_to_progress_graph(pgraph, trial / 50, traine, teste);
    end
end