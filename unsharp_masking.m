function [ out ] = unsharp_masking( original, ksize, k )

[rows, cols] = size(original);
out = zeros(rows, cols);

rpad = (ksize-1)/2;
cpad = (ksize-1)/2;

for i = (1+rpad):(rows-rpad)
    for j = (1+cpad):(cols-cpad)
        % Extract the window area
        window = original((i-rpad):(i+rpad), (j-cpad):(j+cpad));
        m = mean(window(:)); % Calculate the mean
        
        % Apply the adaptive filter function
        out(i, j) = m + k * (original(i, j) - m);
    end
end

figure; imshow(out)

end
