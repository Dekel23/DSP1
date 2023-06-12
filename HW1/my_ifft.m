function result = my_ifft(X)
    N = length(X);
    result = 1/N*conj(my_fft(conj(X)));
end