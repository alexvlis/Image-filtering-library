function [ out ] = sharpening( original )

size = 3; % Size is fixed
kernel = ones(size) * -1; % All elements are -1
kernel(2, 2) = 8; % Central element is 8

out = apply_linear_filter(original, kernel);

end

