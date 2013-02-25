%calculating direction
function [newimage,rdx,rdy,gdx,gdy,bdx,bdy]=segFromRadius(img,rx,ry,rr,gx,gy,gr,bx,by,br)

rdx=0;
rdy=0;
bdx=0;
bdy=0;
gdx=0;
gdy=0;
rsum=0;
bsum=0;
gsum=0;
newimage=zeros(size(img));
[m,n,l]=size(newimage);
        for i=1:m
            for j=1:n
                if(euclidianDist2D(rx,ry,i,j)<rr)
                    newimage(i,j,1)=img(i,j,1);
                    newimage(i,j,2)=img(i,j,2);
                    newimage(i,j,3)=img(i,j,3);
                    if(img(i,j,1)<200)
                        rdx=rdx+i;
                        rdy=rdy+j;
                        rsum=rsum+1;
                    end
                elseif(euclidianDist2D(bx,by,i,j)<br)
                    newimage(i,j,1)=img(i,j,1);
                    newimage(i,j,2)=img(i,j,2);
                    newimage(i,j,3)=img(i,j,3);
                    if(img(i,j,3)<200)
                        bdx=bdx+i;
                        bdy=bdy+j;
                        bsum=bsum+1;
                    end
                elseif(euclidianDist2D(gx,gy,i,j)<gr*1.8)
                    newimage(i,j,1)=img(i,j,1);
                    newimage(i,j,2)=img(i,j,2);
                    newimage(i,j,3)=img(i,j,3);
                     if(img(i,j,2)<150)
                        gdx=gdx+i;
                        gdy=gdy+j;
                        gsum=gsum+1;
                    end
                else
                    newimage(i,j,1)=255;
                    newimage(i,j,2)=255;
                    newimage(i,j,3)=255;
                end
            end
        end
        rdx=rdx/rsum;
        rdy=rdy/rsum;
        gdx=gdx/gsum;
        gdy=gdy/gsum;
        bdx=bdx/bsum;
        bdy=bdy/bsum;
end

