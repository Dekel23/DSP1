X = [1,0,-1,1,0,0,1,0];
Y = fft_ifft.my_fft(X);
N = length(Y);
f = 0:N-1;
figure;
plot(f, abs(Y));
title('FFT Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% signal = fft_ifft.my_ifft(Y);
% N = length(signal);
% t = 0:N-1;
% figure;
% plot(t, signal);
% title('IFFT Magnitude Spectrum');
% xlabel('time (s)');
% ylabel('Magnitude');