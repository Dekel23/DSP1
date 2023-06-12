



%% section C:
[dist_image_1,dist_image_2,noised_image,imp_resp_image]=img_gen('HILA','EREL');
figure;
imshow(dist_image_1);
figure;
imshow(dist_image_2);
figure;
imshow(noised_image);
figure;
imshow(imp_resp_image);


%% section D:
x = zeros(32,64);
x(1:8,1:8) = 1;

X = my_fft2(x);
RE_X = real(X);
surf(RE_X);


%% section E:
h0 = imp_resp_image(:,1);
NewH0 = my_DTFT(h0, 0:2);
disp(NewH0);
w = zeros(32, 1);
w(1) = 1;
w(30) = 1;
W = fft(w);
h0 = [h0; zeros(29,1)];
H0 = fft(h0);
Z = H0.*W;
z = ifft(Z);
stem(1:32, z);
title("h[n],w[n] conv")



%% section F:
h = imp_resp_image;

y1 = dist_image_1;
Y1 = my_fft2(y1);
[n,m] = size(Y1);
h1 = zeros(n, m);
h1(1:3, 1:5) = h;

y2 = dist_image_2;
Y2 = my_fft2(y2);
[n,m] = size(Y2);
h2 = zeros(n, m);
h2(1:3, 1:5) = h;


H1 = my_fft2(h1);
H2 = my_fft2(h2);

X1 = Y1./H1;
X2 = Y2./H2;

x1 = my_ifft2(X1);
x2 = my_ifft2(X2);
figure
imshow(abs(x1));
title("x1");
figure
imshow(abs(x2));
title("x2");

