function [ out ] = adaptive_weighted_median( original, ksize, cweight, c )

[rows, cols] = size(original);
out = zeros(rows, cols);

rpad = (ksize-1)/2;
cpad = (ksize-1)/2;
d = zeros(ksize, ksize);
mpos = ceil(ksize/2); % Work out the middle matrix element

% Pre-store the distance matrix
for i = 1:ksize
    for j = 1:ksize
        d(i, j) = distance([i j], [mpos mpos]);
    end
end

for i = (1+rpad):(rows-rpad)
    for j = (1+cpad):(cols-cpad) 
        list = [];
        window = original(i-rpad:i+rpad, j-cpad:j+cpad);
        window = sort(window(1:end));
        
        sigma = std(window);
        x = mean(window);
        
        % if the mean of the window is zero skip this iteration
        if x == 0
            out(i, j) = x;
            continue
        end
        
        % Compute the weights for this window
        idx = 1;
        for k = 1:ksize
            for q = 1:ksize
                % Calculate weight for this element
                weight = round(cweight - (c * d(k, q) * sigma)/x);
                
                % Create the new values to insert
                buffer = ones(1, weight) * window(idx);
                idx = idx + 1;
                
                % Insert new values
                list = [list, buffer];
            end
        end
        out(i, j) = median(list);
    end
end
figure; imshow(out)
end

function  [ d ] = distance(x, y)
% Calculate the euclidean distance between two vectors
d = sqrt(sum((x - y).^2));
end