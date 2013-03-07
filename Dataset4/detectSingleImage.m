% Takes a single image and returns the x,y co-ordinates and radius of the
% red, blue and green robot for use by trackAllImages

function [rx,ry,rr,gx,gy,gr,bx,by,br] = detectSingleImage(img)

% Creates a 2D circular average filter with radius 10 and applies it to the
% image
filter = fspecial('disk',10);
smoothedImage = imfilter(img,filter);

% Normalises the image
normalisedImage = normaliseColor(smoothedImage);

% Isolates the background & foreground images
[foregroundImage,backgroundImage] = diffFromBG(normalisedImage);

% Plots all versions of the image

subplot(2,3,1);
imshow(img);
title('1.Original image')

subplot(2,3,2);
imshow(uint8(smoothedImage));
title('2.Smoothed image')

subplot(2,3,3);
imshow(uint8(normalisedImage));
title('3.Normalised RGB image')

subplot(2,3,4);
imshow(uint8(backgroundImage));
title('4. Estimated Background')

hold on;
[rx,ry,rr,gx,gy,gr,bx,by,br] = labelRegion(uint8(foregroundImage));
[regionsOfInterest,rdx,rdy,gdx,gdy,bdx,bdy] = centreOfRobot(img,rx,ry,rr,gx,gy,gr,bx,by,br);

subplot(2,3,5);
imshow(uint8(regionsOfInterest));
title('5.Regions of Interest');

subplot(2,3,6);
imshow(img);
title('6.Direction(zoom to see)')

%rdx = centre of black part)
hold on;
plot(ry,rx,'r+');
line([(rdy-ry)*60/sqrt((rdy-ry)^2+(rdx-rx)^2)+ry,ry],[(rdx-rx)*60/sqrt((rdy-ry)^2+(rdx-rx)^2)+rx,rx]);
plot(by,bx,'b+');
line([(bdy-by)*60/sqrt((bdy-by)^2+(bdx-bx)^2)+by,by],[(bdx-bx)*60/sqrt((bdy-by)^2+(bdx-bx)^2)+bx,bx]);
plot(gy,gx,'g+');
line([(gdy-gy)*60/sqrt((gdy-gy)^2+(gdx-gx)^2)+gy,gy],[(gdx-gx)*60/sqrt((gdy-gy)^2+(gdx-gx)^2)+gx,gx]);

subplot(2,3,4);
end