function X = my_fft2(x)
    X = x;
    sz = size(x);
    for row = 1:sz(1)
        X(row,:) = fft(x(row,:));
    end
    for col = 1:sz(2)
        X(:,col) = fft(X(:,col));
    end
end