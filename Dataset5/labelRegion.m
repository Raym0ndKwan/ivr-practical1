 
function [rx,ry,rr,gx,gy,gr,bx,by,br] = labelRegion(img)

% Convert image to grayscale
grayImage = rgb2gray(img);
% Converts grayscale image to black and white using a threshold level of 0.8
thresholdImage = im2bw(grayImage,0.88);
%
L = bwlabel(~thresholdImage,8);
N = max(L(:)); 

j=1;
rx = 0;
ry = 0;
rr = 0;
gx = 0;
gy = 0;
gr = 0;
bx = 0;
by = 0;
br = 0;

for i= 1:N
    [r,c]=find(L==i);
    if(size(r,1)>200)
        c1(j)=sum(r)/size(r,1);
        c2(j)=sum(c)/size(c,1);
        if(sum(img(r,c,1))/size(r,1)>200);
        rx=c1(j);
        ry=c2(j);
        plot(c2(j),c1(j),'r*');
        rr=sqrt(size(r,1))/2;
        elseif(sum(img(r,c,3))/size(r,1)>180);
        plot(c2(j),c1(j),'b*');
        bx=c1(j);
        by=c2(j);
        br=sqrt(size(r,1))/2;
        elseif(sum(img(r,c,2))/size(r,1)>180);
        plot(c2(j),c1(j),'g*');
        gx=c1(j);
        gy=c2(j);
        gr=sqrt(size(r,1))/2;
        end
        j=j+1;
    end
end
end
