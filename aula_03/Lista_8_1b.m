% Execicio 1 lista 8

 
clear;
clc;

imagem = imread('hough_1.jpg');

imag = imagem;
[linA,colA] = size(imagem);
limiar=100;

for z=1:linA
    for x=1:colA
        if imag(z,x)>=limiar
           imag(z,x)=255;
        else
        imag(z,x)=255;
        end
   end
end


imagem_original = imagem;
imagem_reta_horizontal = imag;
[nl,nc,cor] = size(imag);
H(4*nl,180) =  zeros();

for i=1:1:nl
    for j=1:1:nc

        if imagem(i,j) == 0
            
            for teta=-89:1:90
                rho = (j*cosd(teta) + i*sind(teta));
                H (round(rho)+nl*2,teta+90) = (H(round(rho)+nl*2,teta+90)+1); 
           
            end   
        end
     end
end

[Hnl,Hnc] = size(H);

%%%%%%%%% DESENHA RETA NA IMAGEM ORIGINAL

for retas=0:1:20
    maximo = max(max(H));
    for k=1:1:Hnl
        for l=1:1:Hnc
            if H(k,l) == maximo
                if l==171
                
                    for yb=1:1:nc
                        xb = ((k -(2*nl)) - (yb*cosd(90))/sind(90));
                           if xb<nc && xb>1
                            matriz(round(xb),round(yb)) = 1;
                            imag(round(xb),round(yb)) = 0;
                           end
                    end
                else
                    for x=1:1:nl    
                        y = (((k-(2*nl))-x*sind((l-81))) / cosd((l-81))) ;                       
                        if y<nc && y>1
                            imagem(x,round(y)) = 0;
                        end            
                    end
                end
                H(k,l)=0;
            end  
        end
    end
end

subplot(1,2,1);
imshow(imagem),axis on, axis normal, hold on;

subplot(1,2,2);
imshow(H),axis on, axis normal, hold on;