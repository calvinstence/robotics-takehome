function [ imseg ] = segim2( imseg )
imsz = size(imseg);
imht = imsz(1);
imwd = imsz(2);
%imseg2 = zeros(imht,imwd);
for i = 2:(imht-1)
    for j = 2:(imwd-1)
       if imseg(i,j)>0
        neighbors = [imseg(i,j-1),imseg(i+1,j),imseg(i,j+1),imseg(i-1,j)];
        for k=1:4
           if neighbors(k)==0;
            neighbors(k)=max(neighbors(:));
           end
        end
        if imseg(i,j)>min(neighbors)
            imseg(i,j)=min(neighbors);
        end
       end
       
    end
end
for i = (imht-1):2
    for j = (imwd-1):2
       if imseg(i,j)>0
        neighbors = [imseg(i,j-1),imseg(i+1,j),imseg(i,j+1),imseg(i-1,j)];
        for k=1:4
           if neighbors(k)==0;
            neighbors(k)=max(neighbors(:));
           end
         end
        if imseg(i,j)>min(neighbors)
            imseg(i,j)=min(neighbors);
        end
       end
       
    end
end
end

