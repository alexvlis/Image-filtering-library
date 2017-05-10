function [ out ] = gaussian(original, sigma)
%GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here

kernel = make_gaussian_kernel(sigma);
out = apply_linear_filter(original, kernel);

figure; imshow(out)

end
