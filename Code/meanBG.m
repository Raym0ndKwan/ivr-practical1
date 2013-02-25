function [red,green,blue]=meanBG(img)
[m,n,l]=size(img);
img=double(img);
red=0;
green=0;
blue=0;
        for i=1:m
            for j=1:n
                red=red+img(i,j,1);
                green=green+img(i,j,2);
                blue=blue+img(i,j,3);
            end
        end
red=red/(m*n);
green=green/(m*n);
blue=blue/(m*n);
end