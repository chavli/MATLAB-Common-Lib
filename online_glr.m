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

function [ weights_v ] = online_glr( train_m, trials_n, step_f, test_m)
    %add bias value
    train_m = horzcat(ones(size(train_m, 1), 1), train_m);
    test_m = horzcat(ones(size(test_m, 1), 1), test_m);
    
    size_v = size(train_m);
    attrs_n = size_v(2) - 1;  %exclude classification column (assumed to be last)
    samples_n = size_v(1);
    
    %initialize weights
    weights_v = ones(1,attrs_n);
    
    %check step flag
    if step_f == 1
        pgraph = init_progress_graph; 
    end
    
    %go through all trials
    for trial=0:trials_n - 1
        %alpha = 2 / (trial + 1);
        %alpha = 1 / sqrt(trial + 1);
        alpha = .01 / (log(trial + 1) + exp(1));
        sample = mod(trial, samples_n) + 1; %pick a sample
        
        %online weight update
        sample_v = train_m(sample, :);
        weight_0 = weights_v(1);
        guess = sigmoid((weights_v(2:attrs_n) * sample_v(2:attrs_n)') + weight_0);        
        weights_v = weights_v + alpha * (sample_v(attrs_n + 1) - guess) * (sample_v(1:attrs_n)); 
        
        %update graph if step is enabled
        if step_f == 1 && mod(trial, 50) == 0
            y_predict =  binary_logistic_predict(train_m, weights_v);
            y_actual = train_m(:, size_v(2));
            traine = mean_square_error(y_actual, y_predict);

            y_predict =  binary_logistic_predict(test_m, weights_v);
            y_actual = test_m(:, size_v(2));
            teste = mean_square_error(y_actual, y_predict);
            
            pgraph = add_to_progress_graph(pgraph, trial / 50, traine, teste);
        end
    end
    
    %add the last step
    if step_f == 1
        y_predict =  binary_logistic_predict(train_m, weights_v);
        y_actual = train_m(:, size_v(2));
        traine = mean_square_error(y_actual, y_predict);

        y_predict =  binary_logistic_predict(test_m, weights_v);
        y_actual = test_m(:, size_v(2));
        teste = mean_square_error(y_actual, y_predict);

        add_to_progress_graph(pgraph, trial / 50, traine, teste);
    end
end