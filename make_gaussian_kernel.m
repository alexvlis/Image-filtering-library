function [ kernel ] = make_gaussian_kernel( sigma )

% Set the size of the kernel
ksize = 2 * (3 * sigma) + 1;
kernel = zeros(ksize, ksize);

% Calculate the padding
pad = ceil(ksize/2);

% Populate the kernel
for i = 1:ksize
    for j = 1:ksize
       % Translate the indices relative to the central cell
       kernel(i, j) = gauss(i-pad, j-pad, sigma);
    end
end

end

function [ value ] = gauss(x, y, sigma)
    value = exp(-(x^2 + y^2)/(2*sigma^2));
end