%not used 
function cg=findCentroid(mass,coord)
dm=size(coord);
m=dm(1);
n=dm(2);
cg=zeros(1,n);
tmass=sum(mass);
for j=1:m
         for i=1:n
                 cg(i)=cg(i)+mass(j)*coord(j,i);
         end
end
cg=cg/tmass; 