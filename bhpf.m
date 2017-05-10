function [ out ] = bhpf( original, order, cutoff )

F = fftshift(fft2(original));
[rows, cols] = size(F);
H = zeros(rows, cols);
rcenter = rows/2;
ccenter = cols/2;

for u = 1:rows
     for v = 1:cols         
         H(u,v) = 1 - 1/(1 + (sqrt(((rcenter-(u-1))^2 + (ccenter-(v-1))^2))/cutoff).^(2*order));
     end
end

G = ifft2(H.*F);
out = sqrt(real(G).^2 + imag(G).^2);

figure; imshow(out)
figure; mesh(1:cols, 1:rows, H);
colormap(cool(100))

end
