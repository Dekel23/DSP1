n = 0:7;
X = cos(2*pi*n/8);
Y = my_fft(X);
N = length(Y);
f = 0:N-1;
figure;
plot(f, abs(Y));
title('FFT Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

signal = my_ifft(Y);
N = length(signal);
t = 0:N-1;
figure;
plot(t, signal);
title('IFFT Magnitude Spectrum');
xlabel('time (s)');
ylabel('Magnitude');