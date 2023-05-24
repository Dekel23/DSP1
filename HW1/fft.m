X = [1,0,-1,1,0,0,1,0,1,1,-1,-1];
Y = my_fft(X);
N = length(Y);
f = (0:N-1)/N;
figure;
plot(f, abs(Y));
title('FFT Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

signal = my_ifft(Y);
N = length(signal);
t = (0:N-1)/N;
figure;
plot(t, signal);
title('IFFT Magnitude Spectrum');
xlabel('time (s)');
ylabel('Magnitude');

function result = my_fft(X)
    N = length(X);
    M = highestProductPower2(N);
    L = N/M;
    y = zeros(L,M);
    Y = zeros(L,M);
    result = zeros(1,M);
    for l = 0:L-1
        for m = 0:M-1
            y(l+1,m+1) = X(l+1+m*L);
        end
        Y = fft_recursive(y);
%         if L == 1
%             Y = fft_recursive(y);
%         else
%             Y = fft_recursive(y);
%         end
        for k = 1:M
            result(k) = result(k)+Y(l+1,k)*exp(-1i*2*pi*(k-1)*(l)/N);
        end
    end
end

function Y = fft_recursive(X)
    N = length(X);
    if N <= 1
        Y = X;
    else
        even = fft_recursive(X(1:2:N));
        odd = fft_recursive(X(2:2:N));
        
        factor = exp(-1i*2*pi*(0:N/2-1)/N);
        Y = [even+factor.*odd, even-factor.*odd];
    end
end

function Y = highestProductPower2(X)
    counter = 0;
    while mod(X,2) == 0
        counter = counter+1;
        X = X/2;
    end
    Y = pow2(counter);
end

function result = my_ifft(X)
    N = length(X);
    result = 1/N*conj(my_fft(conj(X)));
end


