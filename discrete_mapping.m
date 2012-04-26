function [ disc_mapping ] = discrete_mapping( source_m, target_m, omega1_m, omega2_m, thresh )
%DISCRETE_MAPPING Summary of this function goes here
%   Detailed explanation goes here
    source_disc = omega1_m(1, :);
    target_disc = omega2_m(1, :);
    source_count = omega1_m(2, :);
    target_count = omega2_m(2, :);
    
    disc_mapping = [];
    
    for i=1:size(source_disc, 2)
        for j=1:size(target_disc, 2)
            if source_count(i) <= target_count(j)
                counts = zeros(source_count(i), 2);
                for k=1:source_count(i)
                    counts(k, :) = [ sum(source_m(:, source_disc(i)) == k) , sum(target_m(:, target_disc(j)) == k)];
                end
                
                [corr_v, lag_v] = xcorr(counts(:, 1) / sum(counts(:, 1)), counts(:, 2) / sum(counts(:, 2)), 'Coeff');
                l = find(corr_v == max(corr_v));
                lag = lag_v(l);
                
                %penalize correlation value with any unused discrete values
                unused = 0;
                for k=source_count(i)+1:target_count(j)
                    unused = unused + sum(target_m(:, target_disc(j)) == k);
                end
                
                true_corr = max(corr_v) * ((size(target_m, 1) - unused) / size(target_m, 1));
                %true_corr = max(corr_v);
                if(true_corr > thresh && lag == 0)
                    
                    disp(sprintf('%d[%d] %d[%d] %f', source_disc(i), source_count(i), target_disc(j), target_count(j), true_corr));
                    %{
                    name = sprintf('census %d credit %d', source_disc(i), target_disc(j));
                    graph_xcorr(counts(:, 1) / sum(counts(:, 1)), counts(:, 2) / sum(counts(:, 2)), lag, name);            
                    disp(max(corr_v));
                    %}
                    if size(disc_mapping, 1) == 0 || ~any(disc_mapping(:, 1) ==  source_disc(i))
                        disc_mapping = vertcat(disc_mapping, [source_disc(i), target_disc(j), true_corr]);
                    else
                        pos = find(disc_mapping(:, 1) ==  source_disc(i));
                        if true_corr > disc_mapping(pos, 3)
                            disc_mapping(pos, 3) = true_corr;
                            disc_mapping(pos, 2) = target_disc(j);
                        end
                    end
                end
            end
        end
    end
    disc_mapping = disc_mapping(:, [1 2]);
end

