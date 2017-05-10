function [ out ] = apply_linear_filter( original, kernel )
%APPLY_LINEAR_FILTER Summary of this function goes here
%   Generalized linear filter implementation

[rows, cols] = size(original);
[krows, kcols] = size(kernel);

wsum = sum(sum(kernel)); % Pre-compute the sum of the weights
out = zeros(rows, cols); % Allocate memory for the output image

rpad = (krows-1)/2;
cpad = (kcols-1)/2;

for i = (1+rpad):(rows-rpad)
    for j = (1+cpad):(cols-cpad)
       % Extract the window area
       window = original((i-rpad):(i+rpad), (j-cpad):(j+cpad));
       if wsum ~= 0
            out(i, j) = sum(sum(window.*kernel))/wsum;
       else
           % Dont divide by the sum of the weights
           out(i, j) = abs(sum(sum(window.*kernel)));
       end
    end
end

end