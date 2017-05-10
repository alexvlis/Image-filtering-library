function [ out ] = apply_nonlinear_filter( original, weights, ksize )

[rows, cols] = size(original);
out = zeros(rows, cols);

rpad = (ksize-1)/2;
cpad = (ksize-1)/2;

for i = (1+rpad):(rows-rpad)
    for j = (1+cpad):(cols-cpad) 
        % Extract the window
        window = original(i-rpad:i+rpad, j-cpad:j+cpad);
        
        % Sort the window
        mask = sort(window(1:end));
        
        list = []; % Empty the final list
        for k = 1:length(weights)
            % Build the temporary list for this value and weight
            buffer = ones(1, weights(k)) * mask(k);
            
            % Append the temporary list to the final one
            list = [list, buffer];
        end
        out(i, j) = median(list);
    end
end

end
