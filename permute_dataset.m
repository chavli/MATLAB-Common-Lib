function [ permutedset ] = permute_dataset( dataset_m )
%PERMUTE_DATA shuffles the samples in a dataset
    samples = size(dataset_m, 1);
    shuffle = randperm(samples);
    permutedset = dataset_m(shuffle, :);
end

