%% exercicio 1
clc
clear

I = imread("ex2.bmp");

subplot(1, 2, 1);
imshow(I);

subplot(1, 2, 2);
imshow(ajusta_0_255(I));

%% exercicio 2
%  Considerando as imagens "fg00009.bmp" e "bg00010.bmp", visualize: 
% (a) A diferenca (subtração) entre as imagens; 
% (b) A diferenca com a faixa dinamica reajustada entre 0 e 255; 
% (c) O valor absoluto da diferença; 
% (d) O valor absoluto da diferença com a faixa dinâmica reajustada entre 0 e 255; 
% (e) Sobre o resultado do item (d), apague os (atribua zero aos) pixels que 
%     correspondem ao fundo da imagem (background)
clc
clear
fg = double(imread("fg00009.bmp"));
bg = double(imread("bg00010.bmp"));

a = dif_2_img(fg, bg);
b = ajusta_0_255(a);
c = abs(a);
d = ajusta_0_255(c);

e = d;
e(e<51) = 0;
e(e>50) = 255;

subplot(5, 2, 1);
imshow(uint8(bg));
subplot(5, 2, 2);
imshow(uint8(fg));
subplot(5, 2, 3);
imshow(uint8(a));
subplot(5, 2, 4);
imshow(uint8(b));
subplot(5, 2, 5);
imshow(uint8(c));
subplot(5, 2, 6);
imshow(uint8(d));
subplot(5, 2, 6);
imshow(uint8(e));
%% exercicio 4
% a) Implemente um algoritmo que leia a imagem "fg00009.bmp" e gere uma 
% "fg00009_filtered.bmp" cujos pixels correspondem à média da vizinhança-8 
% do respectivo pixel da imagem original (3x3). 
% b) Repita o processamento ampliando essa vizinhanca para uma área de 9x9

clc, clear

fg = double(imread("fg00009.bmp"));

[m, n] = size(fg);
fg_filt = zeros(m, n);
fg_filt2 = fg_filt;

for c = 2:m-1
    for l = 2:n-1
        % o primeiro mean retorna o vetor medio
        fg_filt(c, l) = mean(mean((fg(c-1:c+1, l-1:l+1))));
    end
end

for C = 5:m-4
    for L = 5:n-4
        fg_filt2(C, L) = mean(mean((fg(C-4:C+4, L-4:L+4))));
    end
end

subplot(1, 3, 1);
imshow(uint8(fg));
subplot(1, 3, 2);
imshow(uint8(fg_filt));
subplot(1, 3, 3);
imshow(uint8(fg_filt2));

%% exercicio 5
% Implemente um algoritmo que rotacione a imagem "fg00009.bmp" em 30o 
% (sentido anti-horário)

clear
clc

i = double(imread('fg00009.bmp'));
[col, lin] = size(i);

% pega o centro
c_x = col/2;
c_y = lin/2;

teta = deg2rad(30);

t1 = [1 0 0; 0 1 0; -c_x -c_y 1];
trans2 = [1 0 0; 0 1 0; c_x c_y 1];
rot = [cos(teta) sin(teta) 0; -sin(teta) cos(teta) 0; 0 0 1];
f_m = t1 * rot * trans2;
i_f_m = inv(f_m); % matriz de transporte 
i_f_m(1, 3) = 0;
i_f_m(2, 3) = 0;
for l = 1:col
  for c = 1:lin
    p = [l c 1]*i_f_m;
    p = round(p);
    if (p(1)<=col && p(2)<=lin && p(1)>0 && p(2) >0)
      h(l,c) = i(p(1), p(2));
    end
  end
end

subplot(1, 2, 1);
imshow(uint8(h));
subplot(1, 2, 2);
imshow(rot_image(i, 30));

%% ex 6
% Implemente uma função que realize a rotação de uma imagem de entrada 
% qualquer com um ângulo definido como parâmetro de entrada. Teste essa 
% função com a imagem "fg00009.bmp" e com os ângulos de 0o, 90o, 180o, 30o 
% e -30o.
clc, clear
imshow(rot_image(double(imread('fg00009.bmp')), -30));

%% ex 7
% Implemente um algoritmo de registro baseado em aproximações bilineares 
% para registrar a imagem "im_in.bmp" com a imagem de referência "im_ref.bmp".

clc, clear

cf1 = 420;
lf1 = 23;
cf2 = 143;
lf2 = 91;
cf3 = 121;
lf3 = 463;
cf4 = 520;
lf4 = 260;

po = [510,307,165,494,130,110,345,287]';

m = [cf1 lf1 cf1*lf1 1 0 0 0 0;
     cf2 lf2 cf2*lf2 1 0 0 0 0;
     cf3 lf3 cf3*lf3 1 0 0 0 0;
     cf4 lf4 cf4*lf4 1 0 0 0 0;
     0 0 0 0 cf1 lf1 cf1*lf1 1;
     0 0 0 0 cf2 lf2 cf2*lf2 1;
     0 0 0 0 cf3 lf3 cf3*lf3 1;
     0 0 0 0 cf4 lf4 cf4*lf4 1];

w = m\po; % calcula a inversa

i = double(imread('im_in.bmp'));
s = size(i);

for l = 1:s(1)
  for c = 1:s(2)
    co = round(w(1)*c + w(2)*l + w(3)*c*l + w(4));
    lo = round(w(5)*c + w(6)*l + w(7)*c*l + w(8));
    if (lo<=s(1) && co<=s(2) && co>0 && lo>0)
      h(l,c) = i(lo,co);
    end
  end
end

imshow(uint8(h));
