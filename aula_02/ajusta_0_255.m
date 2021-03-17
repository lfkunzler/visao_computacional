function [img_out] = ajusta_0_255(img_in)
%UNTITLED3 Summary of this function goes here
%   a partir do valor minimo e maximo da imagem, excursiona pra 0-255

% 0 = a*min(I(:)) + b
% 255 = a*max(I(:)) + b
% b = -a*min
% 255 = a*max - a*min
% a = 255/(max-min)
% b = -a*min

minv = double(min(img_in(:)));
maxv = double(max(img_in(:)));

a = 255/(maxv-minv);
b = -a*minv;

i_aux = double(img_in);
i_aux = a*i_aux + b;
img_out = uint8(i_aux);
end

