function [ out ] = imclose( original, se )
%CLOSING Summary of this function goes here
%   Detailed explanation goes here

[rows, cols] = size(se);
out = morph(morph(original, se, rows*cols), se, 1);
figure; imshow(out)
end

