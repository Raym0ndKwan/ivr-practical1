% Takes an image and returns the background

function [foregroundImage,backgroundImage]=diffFromBG(img)

foregroundImage=zeros(size(img));
backgroundImage=zeros(size(img));
[r,g,b]=meanBG(img);
[m,n,l]=size(foregroundImage);
        for i=1:m
            for j=1:n
                if(colorSimilarity(r,g,b,img(i,j,1),img(i,j,2),img(i,j,3))<45)
                    foregroundImage(i,j,1)=255;
                    foregroundImage(i,j,2)=255;
                    foregroundImage(i,j,3)=255;
                    backgroundImage(i,j,1)=round(r);
                    backgroundImage(i,j,2)=round(g);
                    backgroundImage(i,j,3)=round(b);
                end
                if(colorSimilarity(r,g,b,img(i,j,1),img(i,j,2),img(i,j,3))>=45)
                    foregroundImage(i,j,1)=img(i,j,1);
                    foregroundImage(i,j,2)=img(i,j,2);
                    foregroundImage(i,j,3)=img(i,j,3);
                    backgroundImage(i,j,1)=img(i,j,1);
                    backgroundImage(i,j,2)=img(i,j,2);
                    backgroundImage(i,j,3)=img(i,j,3);
                end
            end
        end
end

