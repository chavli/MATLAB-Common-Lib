%
%   GLR.m
%   
%   Gradient Logistic Regression
%   runs a logistic regression model on a given set of data to discover the
%   corresponding set of weights defining the decision boundary.
%
%   arguments
%       train_m - the training dataset including the class labels
%       trials_n - number of trials
%       graph_f - flag determining if mse should be plotted live
%       test_m - the test dataset, only used if graph_f is 1
%   
%   returns
%       weights_v - the caluclated weights
%

function [ weights_v ] = GLR( train_m, trials_n, graph_f, test_m)
    % add extra "attribute" to left of data sets
    weight_0 = ones(size(train_m, 1), 1);
    train_m = horzcat(weight_0, train_m);
    
    weight_0 = ones(size(test_m, 1), 1);
    test_m = horzcat(weight_0, test_m);
 
    size_v = size(train_m);
    attrs_n = size_v(2) - 1;  %exclude classification column (assumed to be last)
    samples_n = size_v(1);
    
    %initialize weights
    weights_v =1*ones(1,attrs_n);
    
    %check step flag
    if graph_f == 1
        pgraph = init_progress_graph; 
    end
    
    for trial=0:trials_n - 1
        %alpha = .01;
        alpha = 2 / sqrt(trial + 1);
        %alpha = .01 / (log(trial + 1) + exp(1));
        
        %use all samples to determine weights (batch update)
        weight = zeros(1,attrs_n);
        for sample=1:samples_n
            sample_v = train_m(sample, :);
            guess = sigmoid(weights_v * sample_v(1:attrs_n)');
            weight = weight + (sample_v(size_v(2)) - guess) * (sample_v(1:attrs_n));            
        end
        
        weights_v = weights_v + alpha * weight;

        %update graph if step is enabled
        if graph_f == 1 && mod(trial, 50) == 0
            y_predict =  binary_logistic_predict(train_m(:,2:attrs_n+1), weights_v);
            y_actual = train_m(:, size_v(2));
            
            traine = mean_square_error(y_actual, y_predict);
            
            y_predict =  binary_logistic_predict(test_m(:,2:attrs_n+1), weights_v);
            y_actual = test_m(:, size_v(2));
            teste = mean_square_error(y_actual, y_predict);
            
            pgraph = add_to_progress_graph(pgraph, trial / 50, traine, teste);
        end
    end
    
    %add the last step
    if graph_f == 1
        y_predict =  binary_logistic_predict(train_m(:,2:attrs_n+1), weights_v);
        y_actual = train_m(:, size_v(2));
        traine = mean_square_error(y_actual, y_predict);

        y_predict =  binary_logistic_predict(test_m(:,2:attrs_n+1), weights_v);
        y_actual = test_m(:, size_v(2));
        teste = mean_square_error(y_actual, y_predict);

        add_to_progress_graph(pgraph, trial / 50, traine, teste);
    end
end


