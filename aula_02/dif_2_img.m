function [img_out] = dif_2_img(img1,img2)
% dif_2_img realiza a diferenca entre duas imagens de entrada quaisquer
img_out = double(img1) - double(img2);
end

