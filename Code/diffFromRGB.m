function newimage=diffFromRGB(img,r,g,b)

newimage=double(img);
[m,n,l]=size(newimage);
        for i=1:m
            for j=1:n
                dis=euclideanDist3D(r,g,b,newimage(i,j,1),newimage(i,j,2),newimage(i,j,3));
                if(dis<35)
                %if((r-newimage(i,j,1)^2)<750&&(g-newimage(i,j,2)^2)<600&&(b-newimage(i,j,3)^2)<675)
                    newimage(i,j,1)=0;
                    newimage(i,j,2)=0;
                    newimage(i,j,3)=0;
                end
                if(dis>50)
                    newimage(i,j,1)=255;
                    newimage(i,j,2)=255;
                    newimage(i,j,3)=255;   
                end
            end
        end
subplot(1,2,1);
imshow(uint8(img));
title('Original image')
subplot(1,2,2);
imshow(uint8(newimage));
title('Rest covered by white')
end