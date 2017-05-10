function [ out ] = mean_filter( original, size )
%MEAN Summary of this function goes here
%   Detailed explanation goes here

weight = 1/(size^2);
kernel = ones(size, size) * weight;

out = apply_linear_filter(original, kernel);

figure; imshow(out)

end

