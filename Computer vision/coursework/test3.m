for i=1:12
ImDir='Images/';
imFile=[ImDir,'im',int2str(i),'.jpg'];
I=im2double(imread(imFile));
I=im2gray(I);
segPred=segment_image(I); %<<<<<< calls your method for image segmentation

%convert segmentation to a boundary map, if necessary
segPred=round(segPred);
inseg=unique(segPred(:));
if min(inseg)==0 & max(inseg)==1
    %result is a boundary map
    boundariesPred=double(segPred);
else
    %result is a segmentation map
    boundariesPred=double(convert_seg_to_boundaries(segPred)); %convert segmentation map to boundary map
end
humanFiles=[ImDir,'im',int2str(i),'seg*.png'];
numFiles=length(dir(humanFiles));
for i=1:numFiles
    humanFile=['Images/im',int2str(i),'seg',int2str(i),'.png'];
    boundariesHuman(:,:,i)=im2double(imread(humanFile));
end
[f1score,TP,FP,FN]=evaluate(boundariesPred,boundariesHuman)
end