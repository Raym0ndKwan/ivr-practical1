% Isolates the center of mass of the robot
function [centreOfRobot,rdx,rdy,gdx,gdy,bdx,bdy] = centreOfRobot(img,rx,ry,rr,gx,gy,gr,bx,by,br)

rdx=0;
rdy=0;
bdx=0;
bdy=0;
gdx=0;
gdy=0;
rsum=0;
bsum=0;
gsum=0;

centreOfRobot = zeros(size(img));
[m,n,l] = size(centreOfRobot);
        for i=1:m
            for j=1:n
                if(euclideanDist2D(rx,ry,i,j)<rr)
                    centreOfRobot(i,j,1)=img(i,j,1);
                    centreOfRobot(i,j,2)=img(i,j,2);
                    centreOfRobot(i,j,3)=img(i,j,3);
                    if(img(i,j,1)<(img(round(rx),round(ry),1)-50))
                        rdx=rdx+i;
                        rdy=rdy+j;
                        rsum=rsum+1;
                    end
                elseif(euclideanDist2D(bx,by,i,j)<br)
                    centreOfRobot(i,j,1)=img(i,j,1);
                    centreOfRobot(i,j,2)=img(i,j,2);
                    centreOfRobot(i,j,3)=img(i,j,3);
                    if(img(i,j,3)<(img(round(bx),round(by),3)-50))
                        bdx=bdx+i;
                        bdy=bdy+j;
                        bsum=bsum+1;
                    end
                elseif(euclideanDist2D(gx,gy,i,j)<gr)
                    centreOfRobot(i,j,1)=img(i,j,1);
                    centreOfRobot(i,j,2)=img(i,j,2);
                    centreOfRobot(i,j,3)=img(i,j,3);
                    if(img(i,j,2)<(img(round(gx),round(gy),2)-50))
                        gdx=gdx+i;
                        gdy=gdy+j;
                        gsum=gsum+1;
                    end
                else
                    centreOfRobot(i,j,1)=255;
                    centreOfRobot(i,j,2)=255;
                    centreOfRobot(i,j,3)=255;
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
