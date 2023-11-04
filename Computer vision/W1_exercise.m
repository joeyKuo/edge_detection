I1=rand(1000,1000) %system list all of the data entered
I2=rand(1000,1000); %system won't list, data will be saved

%using loop to add two data-inefficient
for i=1:1000
    for j=1:1000
        Isum(i,j)=I1(i,j)+I2(i,j);
    end
end
%add directly-efficient
Isum=I1+I2;

% martrix multiplication
I3=I1*I2;
%mutiple element-by-element
I4=I1.*I2;

%loading image from file
ImagA=imread('filename.jpg');

ImagA=imread('rooster.jpg');

figure(1), subplot(2,2,1), imagesc(ImagA); title('RGB image');
subplot(2,2,2), imagesc(ImagA(:,:,1)); title('red channel'); colorbar;
subplot(2,2,3), imagesc(ImagA(:,:,2)); title('green channel'); colorbar;
subplot(2,2,4), imagesc(ImagA(:,:,3)); title('blue channel'); colorbar

ImagB=imread('20220927/elephant.png');
figure(2), imagesc(ImagB); colorbar
colormap("gray");

%tensity of pixal
ImagB(RowNumber,ColNumber)

%from RGB to intensity
ImagA=imread('rooster.jpg');
ImagB=rgb2gray(ImagA);
%from unit8 to double format
im2double(ImagA)

