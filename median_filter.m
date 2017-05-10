function [ out ] = median_filter( original, ksize)

length = ksize^2;

% Everything is 0 except from the middle element
weights = zeros(1, length);
weights(1, (length+1)/2) = 1;

out = apply_nonlinear_filter(original, weights, ksize);

figure; imshow(out)

end