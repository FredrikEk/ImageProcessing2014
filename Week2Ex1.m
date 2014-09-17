%% Ex 1
clear
clf

A = imread('cameraman.tif');
%imshow(A,[])

AT = fft2(A);
ATF = raduv(AT/4);
Ap = ifft2(ATF);

imshow(Ap)

