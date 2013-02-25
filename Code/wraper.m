function [trajArrayRx,trajArrayRy,trajArrayGx,trajArrayGy,trajArrayBx,trajArrayBy]=wraper()
files=dir('*.jpg');
trajArrayRx=zeros(size(files));
trajArrayRy=zeros(size(files));
trajArrayBx=zeros(size(files));
trajArrayBy=zeros(size(files));
trajArrayGx=zeros(size(files));
trajArrayGy=zeros(size(files));
for i=1:size(files)
    image = imread(files(i).name)
 %   if(mod(i,10)==1)
 
  %  end
   % if(mod(i,10)==3)
      % [r,g,b]=meanBG(image)
   % end
    if(i>4)
    figure(1);
    [trajArrayRx(i),trajArrayRy(i),~,trajArrayGx(i),trajArrayGy(i),~,trajArrayBx(i),trajArrayBy(i),~]=wraper2(image);
    %[trajArrayRx(i),trajArrayRy(i),trajArrayGx(i),trajArrayGy(i),trajArrayBx(i),trajArrayBy(i)]=wraper1(image);
    end
    hold on
for j=1:size(files)
    if(trajArrayRx(j)>0&&trajArrayRy(j)>0)
    plot(trajArrayRy(j),trajArrayRx(j),'r*');
    if(j>1&&trajArrayRx(j-1)>0&&trajArrayRy(j-1)>0)
    line([trajArrayRy(j-1),trajArrayRy(j)],[trajArrayRx(j-1),trajArrayRx(j)]);
    end
    end

end
for j=1:size(files)
    if(trajArrayGx(j)>0&&trajArrayGy(j)>0)
    plot(trajArrayGy(j),trajArrayGx(j),'g*');
    if(j>1&&trajArrayGx(j-1)>0&&trajArrayGy(j-1)>0)
    line([trajArrayGy(j-1),trajArrayGy(j)],[trajArrayGx(j-1),trajArrayGx(j)]);
    end
    end
end
for j=1:size(files)
    if(trajArrayBx(j)>0&&trajArrayBy(j)>0)
    plot(trajArrayBy(j),trajArrayBx(j),'b*');
    if(j>1&&trajArrayBx(j-1)>0&&trajArrayBy(j-1)>0)
    line([trajArrayBy(j-1),trajArrayBy(j)],[trajArrayBx(j-1),trajArrayBx(j)]);
    end
    end
end
end
final=1
end