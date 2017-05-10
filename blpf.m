function [ out ] = blpf( original, order, cutoff )

% Work out how much we need to pad to apply FFT
[r, c] = size(original);
m = nextpow2(r);
n = nextpow2(c);

% FFT the image and shift it so the zero frequency is aligned
F = fftshift(fft2(original, 2^m, 2^n));

[rows, cols] = size(F);
H = zeros(rows, cols);
rcenter = rows/2;
ccenter = cols/2;

% Build the mask for the FFT domain
for u = 1:rows
     for v = 1:cols         
         H(u,v) = 1/(1 + (sqrt(((rcenter-(u-1))^2 + (ccenter-(v-1))^2))/cutoff).^(2*order));
     end
end

% Apply the filter and go back to the spatial domain
G = ifft2(H.*F);
out = sqrt(real(G).^2 + imag(G).^2);

% Crop the result to the initial size
out = out(1:r, 1:c);

figure; imshow(out)
figure; mesh(1:cols, 1:rows, H);
colormap(cool(100))

end