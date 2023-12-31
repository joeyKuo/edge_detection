I=imread("Images/im1.jpg");
I=im2gray(I);
I=im2double(I);
Ia=im2double(imread("Images/im1seg1.png"));
%laplacian
lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
Il=conv2(I,lap,"same");
%box
box=fspecial("average",5);
Ib=conv2(I,box,"same");
%gabor
gaborMask=gabor2(3,0.1,90,0.75,90);
gaborMask2=gabor2(3,0.1,90,0.75,0);
IaG1=conv2(I,gaborMask,"same");
IaG2=conv2(I,gaborMask2,"same");
IaGL2=sqrt(IaG1.^2+IaG2.^2);
figure,subplot(2,2,1),imagesc(I);colormap("gray");subplot(2,2,2),imagesc(Il);colormap("gray");
subplot(2,2,3),imagesc(Ib);colormap("gray");subplot(2,2,4),imagesc(IaGL2);colormap("gray");
%ed4=edge(Il,"canny_old");
ed=edge(IaGL2,"canny_old");
eva=evaluate(ed,Ia)