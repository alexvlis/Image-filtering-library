function [ out ] = morph( original, se, order )

[rows, cols] = size(original);
[serows, secols] = size(se);

out = zeros(rows, cols);

rpad = (serows-1)/2;
cpad = (secols-1)/2;

for i = (1+rpad):(rows-rpad)
    for j = (1+cpad):(cols-cpad) 
        % Extract the window
        window = original(i-rpad:i+rpad, j-cpad:j+cpad);
        
        % Keep only the elements that matter and sort them
        window = sort(window(se ~= 0));
        out(i, j) = window(order); % Choose the specified position
    end
end
figure; imshow(out)
end
