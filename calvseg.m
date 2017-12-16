function imseg = calvseg(imbw)
imsz = size(imbw);
imht = imsz(1);
imwd = imsz(2);
x = 0;
imseg = zeros(imht,imwd);
for i = 1:imht
    for j = 1:imwd
        if imbw(i,j) == 255
            x = x + 1;
            imseg(i,j) = x;
        end
    end
end
for i = 2:(imht-1)
    for j = 2:(imwd-1)
        if (imseg(i,j+1)<imseg(i,j))
            imseg(i,j) = imseg(i,j+1);
        end
        %if (imseg(i,j-1)<imseg(i,j))
        %    imseg(i,j) = imseg(i,j-1);
        %end
    end
end
end