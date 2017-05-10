function [ out ] = imopen( original, se)
%OPEN Summary of this function goes here
%   Detailed explanation goes here

[rows, cols] = size(se);
out = morph(morph(original, se, 1), se, rows*cols);
figure; imshow(out)
end

