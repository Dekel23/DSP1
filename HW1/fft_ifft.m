classdef fft_ifft
    methods(Static)
        function result = my_fft(X)
            N = length(X);
            M = fft_ifft.highestProductPower2(N);
            L = N/M;
            result = zeros(1,M);
            for l = 0:L-1
                y = zeros(1,M);
                for m = 0:M-1
                    y(m+1) = X(l+1+m*L);
                end
                Y = fft_ifft.fft_recursive(y);
                for k = 1:M
                    result(k) = result(k)+Y(k)*exp(-1i*2*pi*(k-1)*(l)/N);
                end
            end
        end
        
        function Y = fft_recursive(X)
            N = length(X);
            if N <= 1
                Y = X;
            else
                even = fft_ifft.fft_recursive(X(1:2:N));
                odd = fft_ifft.fft_recursive(X(2:2:N));
                
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
            result = 1/N*conj(fft_ifft.my_fft(conj(X)));
        end
    end
end