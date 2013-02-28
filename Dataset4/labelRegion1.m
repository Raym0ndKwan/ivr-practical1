 
function [rx,ry,rr,gx,gy,gr,bx,by,br]=labelRegion1(img)
grayImage=rgb2gray(img);
thresholdImage=im2bw(grayImage,0.9);
L=bwlabel(~thresholdImage,8);
N=max(L(:)); 
j=1;
rx=0;
ry=0;
rr=0;
gx=0;
gy=0;
gr=0;
bx=0;
by=0;
br=0;
for i= 1:N   
    [x,y]=find(L==i);
    if(size(x,1)>200)
        c1(j)=sum(x)/size(x,1);
        c2(j)=sum(y)/size(y,1);
        if(sum(img(x,y,1))/size(x,1)>200);
        rx=c1(j);
        ry=c2(j);
        plot(c2(j),c1(j),'r*');
        rr=sqrt(size(x,1))/2;        
        elseif(sum(img(x,y,2))/size(x,1)>180);
        plot(c2(j),c1(j),'g*');
        gx=c1(j);
        gy=c2(j);
        gr=sqrt(size(x,1));
        elseif(sum(img(x,y,3))/size(x,1)>180);
        plot(c2(j),c1(j),'b*');
        bx=c1(j);
        by=c2(j);
        br=sqrt(size(x,1))/2;

        end
        j=j+1;
    end
end
end
