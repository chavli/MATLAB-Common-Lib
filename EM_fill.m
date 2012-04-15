function [ filled_data ] = EM_fill( data_m, counts, theta_m, pi_v )
%EM_PREDICT Summary of this function goes here
%   Detailed explanation goes here

    filled_data = zeros(size(data_m, 1), size(data_m, 2));
    attrs_n = size(data_m, 2) - 1;
    
    %go through each sample
    for l=1:size(data_m, 1)
        sample = data_m(l, :);
        filled_data(l, :) = sample;
        hidden = find( sample(1:attrs_n) <= 0 );
        given = find( sample(1:attrs_n) > 0 );
        
        %for each hidden attribute
        for target=1:size(hidden, 2)
            high = 0; 
            fill = 0;
            %for each possible value of the hidden attribute
            for value=1:counts(hidden(target))
                j = sample(attrs_n + 1);

                posterior = 1;
                for i=1:size(given, 2)
                    posterior = posterior * theta_m(given(i), j, sample(given(i)));
                end
                posterior = posterior * theta_m(hidden(target), j, value) * pi_v(j);
                
                %keep track of largest likelihood
                if posterior > high
                    high = posterior;
                    fill = value;
                end                
                    
            end
            filled_data(l, hidden(target)) = fill;
        end
    end
end

