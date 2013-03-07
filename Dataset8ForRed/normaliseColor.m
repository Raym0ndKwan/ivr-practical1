% Normalises Colour by brightening up the image

function normalisedImage = normaliseColor(img)
normalisedImage = double(img);

[m,n,l]=size(img);
       for i=1:m
           for j=1:n
               % illuIntensity is the sum of the r, g and b values at each
               % pixel
               illuIntensity = normalisedImage(i,j,1) + normalisedImage(i,j,2) + normalisedImage(i,j,3);
               % the image is normalised by replacing each pixel with one
               % that has been illuminated
               normalisedImage(i,j,1) = normalisedImage(i,j,1)/illuIntensity*500; 
               normalisedImage(i,j,2) = normalisedImage(i,j,2)/illuIntensity*500;
               normalisedImage(i,j,3) = normalisedImage(i,j,3)/illuIntensity*500;
            end
       end
end