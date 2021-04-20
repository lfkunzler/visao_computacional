%% exercicio 1
clear;
clc;
close all;
I = imread("im_in.bmp");
I = double(I);

T = 85;

[x,y] = size(I);

for i = 1:1:x
for j = 1:1:y
if I(i,j) > T
I(i,j) = 255;
end

if I(i,j) < T
I(i,j) = 0;
end

end
end

I = uint8(I);
imwrite(I, "im_ex1_L3.bmp", "bmp")
imshow(I);

%% exercicio 2
clear;
clc;
close all;
I = imread("neg1.jpg");

[x,y,z] = size(I);

for i = 1:1:x
for j = 1:1:y
for k = 1:1:z

I(i,j,k) = 255-I(i,j,k);

end
end
end
I = uint8(I);
imwrite(I, "im_ex2_L3.bmp", "bmp")
imshow(I);

%% exercicio 3
clear;
clc;
close all;
I =double(imread("ex2.bmp"));
[x,y] = size(I);
I2 = zeros(x,y);

r1 = 60;
s1 = 10;
r2 = 125;
s2 = 240;

inc1 = (s1-0)/(r1-0);
inc2 = (s2-s1)/(r2-r1);
inc3 = (255-s2)/(255-r2);

for i = 1:1:x
for j = 1:1:y

if I(i,j)<r1
I2(i,j)=I(i,j)*inc1;
end

if r1+1<I(i,j)<r2
I2(i,j)=I(i,j)*inc2;
end

if I(i,j)>r2
I2(i,j)=I(i,j)*inc3;
end


end
end


I2 = uint8(I);
imwrite(I2, "im_ex3_L3.bmp", "bmp")
imshow(I2);

%% exercicio 4
clear;
clc;
close all;
I = imread("im_in.bmp");
[x,y] = size(I);
histograma = zeros(1,256);

for i = 1:1:x
for j = 1:1:y
valor = I(i,j);
histograma(1, valor+1) = histograma(1, valor+1) +1;

end
end

plot(histograma)

%% exercicio 5
clear;
clc;
close all;
I = imread("ex2.bmp");
[x,y] = size(I);
K = 255/(x*y);
histograma = zeros(1,256);
soma=0;

for i = 1:1:x
for j = 1:1:y
valor = I(i,j);
histograma(1, valor+1) = histograma(1, valor+1) +1;

end
end

 

for m = 1:1:x
for n = 1:1:y
num = I(m,n);
for k = 1:1:num+1
soma = soma + histograma(1,k);
end

I(m,n) = K*soma;
soma=0;

end
end

I = uint8(I);
imwrite(I, "im_ex5_L3.bmp", "bmp")
imshow(I);

%% exercicio 6
clear;
clc;
close all;
I = imread('im_in.bmp');
I = double(I);
R = 0;

M =[1/50 1/50 1/50;
1/50 1/50 1/50;
1/50 1/50 1/50;
1/50 1/50 1/50;]


[x,y] = size(I);
[xm,ym] = size(M);
I2 = zeros(x,y);

for i = 1:1:x
for j = 1:1:y
imgi = i-fix(xm/2);
imgj = j-fix(ym/2);
if(i-fix(xm/2) > 0 && i+fix(xm/2)<=x && j-fix(ym/2) > 0 && j+fix(ym/2)<=y)
for k = 1:1:xm
for l = 1:1:ym
R = M(k,l) * I(imgi,imgj) + R;
imgj = imgj + 1;
end
imgj = j-fix(ym/2);
imgi = imgi + 1;
end
I2(i,j) = R;
R = 0;
end
end
end

I2 = uint8(I2);
imwrite(I2,'im_ex6_L3.bmp');
imshow(I2);

%% exercicio 7

clear;
clc;
close all;
I = imread('parafuso.jpg');
I = double(I);
R = 0;

M = [1 0 0 0 0 0 -1;
1 0 0 0 0 0 -1;
1 0 0 0 0 0 -1;
1 0 0 0 0 0 -1
1 0 0 0 0 0 -1;
1 0 0 0 0 0 -1;];


[x,y] = size(I);
[xm,ym] = size(M);
I2 = zeros(x,y);

for i = 1:1:x
for j = 1:1:y
imgi = i-fix(xm/2);
imgj = j-fix(ym/2);
if(i-fix(xm/2) > 0 && i+fix(xm/2)<=x && j-fix(ym/2) > 0 && j+fix(ym/2)<=y)
for k = 1:1:xm
for l = 1:1:ym
R = M(k,l) * I(imgi,imgj) + R;
imgj = imgj + 1;
end
imgj = j-fix(ym/2);
imgi = imgi + 1;
end
I2(i,j) = R;
R = 0;
end
end
end

I2 = uint8(I2);
imwrite(I2,'im_ex7_L3.jpg');
imshow(I2);