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