function [ posterior_n ] = EM_class_posterior( class_n, sample_v, ...
    pi_v, theta_m)
    likelihood = 1;
    normalization = 0;
    
    %assuming <= 0 is a hidden value, extract attributes that are given
    given = find( sample_v > 0 );
    
    %hidden values cancel out when you apply bayes rule
    for i=1:size(given, 2)
        likelihood = likelihood * theta_m(given(i), class_n, sample_v(given(i)));
    end

    likelihood = likelihood * pi_v(class_n);
    
    %calulate normalization value
    for j=1:size(pi_v, 2)
        temp = 1;
        for i=1:size(given, 2)
            temp = temp * theta_m(given(i), j, sample_v(given(i)));
        end
        temp = temp * pi_v(j);

        normalization = normalization + temp;
    end 
    
    posterior_n = likelihood / normalization;
end

