I=imread("Images/im3.jpg");
I=im2gray(I);
I=im2double(I);

hist(I(:),64);

for i=1:12
ImDir='Images/';
imFile=[ImDir,'im',int2str(i),'.jpg'];
I=im2double(imread(imFile));
I=im2gray(I);
figure(i),hist(I(:),64);
end

