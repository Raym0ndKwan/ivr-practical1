function [rx,ry,gx,gy,bx,by]=wraper1(img)
H = fspecial('disk',10);
img1 = imfilter(img,H,'replicate');
%img1=img;
img2 = normColor(img1);
[img3,img4] = diffFromBG(img2);
subplot(2,2,1);
imshow(img);
title('1.Original image')
subplot(2,2,2);
imshow(uint8(img1));
title('2.Blurred image')
subplot(2,2,3);
imshow(uint8(img2));
title('3.Normalized RGB image')
subplot(2,2,4);
imshow(uint8(img4));
title('4.BG covered by EST BG color')
hold on;
[rx,ry,gx,gy,bx,by]=labelRegion(uint8(img3));

end