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
plot(rdy,rdx,'r+');
line([(rdy-ry)*10+ry,ry],[(rdx-rx)*10+rx,rx]);
plot(bdy,bdx,'b+');
line([(bdy-by)*10+by,by],[(bdx-bx)*10+bx,bx]);
plot(gdy,gdx,'g+');
line([(gdy-gy)*10+gy,gy],[(gdx-gx)*10+gx,gx]);

% for wraper -> image that trajectory is plotted on
subplot(2,3,4);
end