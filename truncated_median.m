function [ out ] = truncated_median( original, ksize )

[rows, cols] = size(original);
out = zeros(rows, cols);

rpad = (ksize-1)/2;
cpad = (ksize-1)/2;

for i = (1+rpad):(rows-rpad)
    for j = (1+cpad):(cols-cpad) 
        window = original(i-rpad:i+rpad, j-cpad:j+cpad);
        window = sort(window(1:end));
        
        med = median(window);
        
        % Calculate the distances from the median
        upperd = max(window) - med;
        lowerd = med - min(window);
        
        % Work out the cutoff value
        if upperd > lowerd
            distance = upperd;
        elseif upperd < lowerd
            distance = lowerd;
        end
        % Cut the extreme values
        window = window(abs((window - med)) < distance);
        
        % The new median must approximate the mode
        out(i, j) = median(window);
    end
end

figure; imshow(out)

end
