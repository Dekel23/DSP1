X = [1,2,3,4];
N = length(X);
Y = fft_recursive(X);
% Plotting the FFT magnitude spectrum
Fs = 1;  % Sampling frequency
f = (0:N-1) * Fs / N;  % Frequency vector

figure;
plot(f, abs(Y));
title('FFT Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

function Y = fft_recursive(X)
    N = length(X);
    
    if N <= 1
        Y = X;
    else
        even = fft_recursive(X(1:2:N));
        odd = fft_recursive(X(2:2:N));
        
        twiddle = exp(-1i * 2 * pi * (0:N/2-1) / N);
        Y = [even + twiddle .* odd, even - twiddle .* odd];
    end
end



