function x = my_ifft2(X)
    x = X;
    sz = size(X);
    for col = 1:sz(2)
        x(:,col) = ifft(X(:,col));
    end
    for row = 1:sz(1)
        x(row,:) = ifft(x(row,:));
    end
end