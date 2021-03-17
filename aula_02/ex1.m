clc
clear

I = imread("ex2.bmp");

subplot(1, 2, 1);
imshow(I);

subplot(1, 3, 3);
imshow(ajusta_0_255(I));
