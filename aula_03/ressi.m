I  = imread('hough_1.jpg');
[lin,col] = size(I);
limiar=100;

for z=1:lin
    for x=1:col
    if I(z,x)>=limiar
        B(z,x)=255;
    else
        B(z,x)=0;
    end
   end
end

imshow(B)
C=zeros(size(I));

for x1=1:lin
    for y=1:col
        if I(x1,y)==255
            for a=-100:100
            B(x1,y)= -a*x1+y;
            C(x1,y)= C(x1,y)+ 1;
            end
        end
    end
end
B;
C        
    
