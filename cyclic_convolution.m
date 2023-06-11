[dist_image_1,dist_image_2,noised_image,imp_resp_image]=img_gen('HILA','EREL');
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

y1 = dist_image_1;
y2 = dist_image_2;

