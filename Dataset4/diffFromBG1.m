%not currently used
function [newimage,bgimage]=diffFromBG1(img,r,g,b)

newimage=zeros(size(img));
bgimage=zeros(size(img));
[m,n,l]=size(newimage);
        for i=1:m
            for j=1:n
                if(ecludianDist(r,g,b,img(i,j,1),img(i,j,2),img(i,j,3))<50)
                %if((r-newimage(i,j,1)^2)<750&&(g-newimage(i,j,2)^2)<600&&(b-newimage(i,j,3)^2)<675)
                    newimage(i,j,1)=255;
                    newimage(i,j,2)=255;
                    newimage(i,j,3)=255;
                    bgimage(i,j,1)=round(r);
                    bgimage(i,j,2)=round(g);
                    bgimage(i,j,3)=round(b);
                end
                if(ecludianDist(r,g,b,img(i,j,1),img(i,j,2),img(i,j,3))>=50)
                %if((r-newimage(i,j,1)^2)<750&&(g-newimage(i,j,2)^2)<600&&(b-newimage(i,j,3)^2)<675)
                    newimage(i,j,1)=img(i,j,1);
                    newimage(i,j,2)=img(i,j,2);
                    newimage(i,j,3)=img(i,j,3);
                    bgimage(i,j,1)=img(i,j,1);
                    bgimage(i,j,2)=img(i,j,2);
                    bgimage(i,j,3)=img(i,j,3);
                end
            end
        end
% subplot(1,2,1);
% imshow(uint8(img));
% title('Original image')
% subplot(1,2,2);
% imshow(uint8(newimage));
% title('Bg covered by black')
end