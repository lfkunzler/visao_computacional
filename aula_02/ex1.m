clc
clear

I = imread("ex2.bmp");

subplot(1, 2, 1);
imshow(I);

minv = min(I(:));
maxv = max(I(:));

% 0 = a*65 + b
% 255 = a*128 + b
% y = 4,05x + 263

I_d = double(I);
I_d = 4.05*I_d-263;
I_f = uint8(I_d);

subplot(1, 2, 2);
imshow(I_f);
