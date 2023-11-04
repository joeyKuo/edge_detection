%create matrix,first number is row's size, second number is column's size
I1=rand(4,2);

%result different as below:
sum=I1*I2 %matrix*matrix
sum=I1.*I2 %each element inside matrix do times

%plot
figure(1), subplot(2,2,1), imagesc(Ia); title('title name');

Ia=imread("20220927/rooster.jpg");
Ib=imread('20220927/elephant.png');

%displays the intensities of the individual R, G, and B channels that 
% make up the image. also some tips to show image and its description
subplot(2,2,2), imagesc(Ia(:,:,1)); title('red channel'); colorbar
subplot(2,2,3), imagesc(Ia(:,:,2)); title('green channel'); colorbar
subplot(2,2,4), imagesc(Ia(:,:,3)); title('blue channel'); colorbar
colormap('gray')
figure(2), imagesc(Ib); colorbar
figure(2), axis('off')
axis('equal')

%show all the pixel values in the designed row/column/mtraix of image.
Ib(3,:)
Ib(:,3)
Ib(1:6,1:4)

%in rooster plot, last number designed which channel of image to show
Ia(1:6,1:4,1) %first image
Ia(1:6,1:4,2) %second image

%image conversion
rgb2ind() %RGB to indexed
rgb2gray() %RGB to intensity
im2bw() %RGB to binary
