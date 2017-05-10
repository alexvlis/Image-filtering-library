function [ out ] = weighted_median( original, ksize )

length = ksize^2;
weights = ones(1, length);
weights(1, (length-1)/2) = 3; % Set the middle weight

out = apply_nonlinear_filter(original, weights, ksize);

figure; imshow(out)

end
