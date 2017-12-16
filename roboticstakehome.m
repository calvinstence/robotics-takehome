%Calvin's Robotics Takehome

%% Open the color images and convert to grayscale
cpens=imread('penguins.jpg'); %read in a file, convert to matlab matrices
gpens=rgb2gray(cpens); %converts from color to grayscale
imshow(cpens) %displays the image in a window
figure
imshow(gpens)
%% Do some filtering
medpens= medfilt2(gpens, [3 3]); %median filters image (best to use afterthresholding
G = fspecial('gaussian',[3 3],2); %create 3x3 gaussian blur kernel
blurpens= imfilter(medpens,G,'same'); %filters image with gaussian blur(best to use before threhsolding
imshow(blurpens)
%% Threshold the image
threshpens = calvthresh(blurpens,128);
imshow(threshpens)
%Morphological filtering
se = strel('square',5); %creates a 5x5 kernel for morph. filtering
erodedpens = imerode(threshpens,se); %erodes image (best to use afterthresholding)
dilatedpens = imdilate(erodedpens,se); %dilates image (best to use afterthresholding)
imshow(dilatedpens) %displays the image. imscale(dilatedpens) will beuseful if you have images with pixel values outside the standard range, suchas very large numbers after your semgmentation labeling.
%imsave %saves the current image
%%
seg1 = calvseg(dilatedpens);
seg2 = segim2(seg1);
imagesc(seg2)
colormap('gray')
%% scaling image color space
%sometimes image processing takes the range of pixel values into a very smallrange, a very large
% range or outside the typical range, including negative values. imagesc scales the pixel values
%to within the normal range and displays it. It uses a default heat
%colormap, so change it to a gray color map.
imagesc(test)
