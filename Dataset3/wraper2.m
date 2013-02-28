function [rx,ry,rr,gx,gy,gr,bx,by,br]=wraper2(img)
H = fspecial('disk',10);
img1 = imfilter(img,H,'replicate');
%img1=img;
img2 = normColor(img1);
[img3,img4] = diffFromBG(img2);
subplot(2,3,1);
imshow(img);
title('1.Original image')
subplot(2,3,2);
imshow(uint8(img1));
title('2.Blurred image')
subplot(2,3,3);
imshow(uint8(img2));
title('3.Normalized RGB image')
subplot(2,3,4);
imshow(uint8(img4));
title('4.BG covered by EST BG color')
hold on;
[rx,ry,rr,gx,gy,gr,bx,by,br]=labelRegion1(uint8(img3));
[img5,rdx,rdy,gdx,gdy,bdx,bdy]=segFromRadius(img,rx,ry,rr,gx,gy,gr,bx,by,br);
subplot(2,3,5);
imshow(uint8(img5));
title('5.ROI');
subplot(2,3,6);
imshow(img);
title('6.Direction(zoom to see)')
hold on;
plot(ry,rx,'r+');
line([(rdy-ry)*60/sqrt((rdy-ry)^2+(rdx-rx)^2)+ry,ry],[(rdx-rx)*60/sqrt((rdy-ry)^2+(rdx-rx)^2)+rx,rx]);
plot(by,bx,'b+');
line([(bdy-by)*60/sqrt((bdy-by)^2+(bdx-bx)^2)+by,by],[(bdx-bx)*60/sqrt((bdy-by)^2+(bdx-bx)^2)+bx,bx]);
plot(gy,gx,'g+');
line([(gdy-gy)*60/sqrt((gdy-gy)^2+(gdx-gx)^2)+gy,gy],[(gdx-gx)*60/sqrt((gdy-gy)^2+(gdx-gx)^2)+gx,gx]);
subplot(2,3,4);
end