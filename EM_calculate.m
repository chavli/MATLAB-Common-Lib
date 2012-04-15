function [ theta_m, pi_v ] = EM_calculate( data_m, xi_v, num_y )

    %%
    % initialize some data about the datasets
    
    attrs_n = size(data_m, 2) - 1;
    
    %number of classes in hidden variable
    M = num_y;

    %number of attributes
    X = size(xi_v, 2) - 1;

    %number of samples
    N = size(data_m, 1);

    %%
    %THE EM ALGORITHM!!!!

    %random dist
    pi_v = rand(1, M);
    pi_v = pi_v ./ sum(pi_v);

    theta_m = zeros(X, M, max(xi_v)); 
    for i=1:X   %each attribute
        for j=1:M   %each class
            for k=1:xi_v(i)     %each value for given attribute
                theta_m(i, j, k) = rand;
            end
            theta_m(i, j, :) = theta_m(i, j, :) ./ sum(theta_m(i, j, :));
        end
    end
    
    %book keeping things
    %define minimum delta-Q required for EM iterations to continue
    epsilon = .0001;
    q_new = 0; q_old = 0;
    first = true;

    while abs(q_new - q_old) >= epsilon || first
        %hold calculated expected counts
        E_cj = zeros(1,M);
        E_xik_cj = zeros( X, M, max(xi_v) );

        q_old = q_new;

        %%
        %calculate expectations
        %
        for j=1:M
            E_cj(j) = sum(data_m(:, attrs_n + 1) == j);
        end

        %for each attribute x_i
        for i=1:X
            %for each value of x_i
            for k=1:xi_v(i)   
                %for each sample
                temp = zeros(1, M);
                for l=1:N
                    sample = data_m(l, 1:X);
                    j = data_m(l, X+1);
                    %two cases
                    if(sample(i) == k)
                        temp(j) = temp(j) + EM_class_posterior(j, sample, pi_v, theta_m);
                    elseif(sample(i) == 0)
                        temp(j) = temp(j) + EM_class_posterior(j, sample, pi_v, theta_m) * theta_m(i, j, k);
                    end
                    
                    %store expected value of Xi = k | C = j
                    E_xik_cj(i, j, k) = E_xik_cj(i, j, k) + temp(j);                    
                end
            end
        end
        
        %%
        % perform maximization 

        %update EM values

        for i=1:X
            for k=1:xi_v(i)   
                for j=1:M
                    theta_m(i, j, k) = E_xik_cj(i, j, k) / sum(E_xik_cj(i, j, :));
                end
            end
        end

        for j=1:M
            pi_v(j) = E_cj(j) / sum(E_cj);
        end

        %%
        %calculate value of Q
        term_1 = 0; term_2 = 0;
        %for each attribute x_i
        for i=1:X
            %for each value of x_i
            for k=1:xi_v(i)   
                %for each hidden class
                for j=1:M
                    term_2 = term_2 + (E_xik_cj(i, j, k) * log10(theta_m(i, j, k)));
                end
            end
        end

        for j=1:M
            term_1 = term_1 + (E_cj(j) * log10(pi_v(j)));
        end
        q_new = term_1 + term_2;

        first = false;
    end



end

