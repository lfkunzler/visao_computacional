function [image] = rot_image(image_d, degree)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [col, lin] = size(image_d);

    % pega o centro
    c_x = col/2;
    c_y = lin/2;

    teta = deg2rad(degree);

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
          h(l,c) = image_d(p(1), p(2));
        end
      end
    end
    image = uint8(h);
end
