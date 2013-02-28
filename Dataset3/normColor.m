function newimage=normColor(img)
newimage=double(img);
[m,n,l]=size(img);
       for i=1:m
           for j=1:n
               illuIntensity=newimage(i,j,1)+newimage(i,j,2)+newimage(i,j,3);
               newimage(i,j,1)=newimage(i,j,1)/illuIntensity*500; %brightens up image again
               newimage(i,j,2)=newimage(i,j,2)/illuIntensity*500;
               newimage(i,j,3)=newimage(i,j,3)/illuIntensity*500;
            end
       end
subplot(1,2,1);
imshow(img);
title('Original image')
subplot(1,2,2);
imshow(uint8(newimage));
title('Normalized RGB image')

end