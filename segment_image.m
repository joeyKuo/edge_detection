function seg = segment_image(I)
%This function aim to detect edge of input images by using gaussian mask,
%convolution and sobel edge-detection

%description: This function first change input image into gray and double
%format, then uses gaussian to suppress noise, i take sd=1.25 and
%size=6*sd, which is 8. Convolving our image with gaussian mask, using
%'same' to make sure size is the same. I use method taught in week 5 as
%segmentation. I use 0.68,0.47, and 0.37 as parameters after testing
%different set of numbers. Later on, by imerode and then dilate to remove
%background noise. Finally, I use 'sobel' as edge-detection to detect edge.
%After compared it with roberts and canny. I find it more suitable for this
%training image, because "Roberts" fail to detect edge while "canny" keeps
%too much background noise.

%change input image to double and gray
I=im2gray(I);
I=im2double(I);

%Creat gaussion mask with standard deviation=1.25, size=8(6*sd)
%Convolve with gaussian mask, use "same" as shape to make sure the size of 
%images is the same.
%By convolve with gaussian mask can suppress noise effectively
% (images get more blurred)
g=fspecial("gaussian",8,1.25);
I=conv2(I,g,"same");

%using segmentation method taught in week 5
%Due to the vary of images, I test different set of data to indentify
%the optimal threshoolds applicable for most of images. As result
%0.68,0.47, and 0.37 become the best solution.
Iseg=zeros(size(I));
Iseg(I<0.68)=1;
Iseg(I<0.47)=2;
Iseg(I<0.37)=3;
%because training_images contain lots of background noise, I erode first
%and then dilate to remove background noise.
IsegE=imerode(Iseg,ones(7,7));
IsegD=imdilate(IsegE,ones(7,7));

%using sobel edge-detection to detect edge.
%roberts methold loses too much edge while log or canny methods retain too
%much edge of background noise. Hence in this case, sobel is more
%appropriate
seg=edge(IsegD,'sobel');