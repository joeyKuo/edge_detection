I=imread('Images/im1.jpg');
I=im2gray(I);
I=im2double(I);
Itest=imread("Images/im1seg1.png");
Itest=im2double(Itest);
Itest1=imread("Images/im1seg5.png");
Itest1=im2double(Itest1);

Iseg=zeros(size(I));
Iseg(I<0.68)=1;
Iseg(I<0.47)=2;
Iseg(I<0.37)=3;
IsegD=imdilate(Iseg,ones(3,3));
IsegO=imopen(Iseg,ones(3,3));
ed=edge(Iseg,"sobel");
ed1=edge(IsegD,'sobel');
ed2=edge(IsegO,'sobel');
eva=evaluate(ed,Itest);

%-----------------------------
I=imread('Images/im3.jpg');
I=im2gray(I);
I=im2double(I);
Itest=imread("Images/im3seg1.png");
Itest=im2double(Itest);
Itest1=imread("Images/im3seg5.png");
Itest1=im2double(Itest1);

Iseg=zeros(size(I));
Iseg(I<0.68)=1;
Iseg(I<0.47)=2;
Iseg(I<0.37)=3;
IsegD=imdilate(Iseg,ones(3,3));
IsegO=imopen(Iseg,ones(3,3));
ed=edge(Iseg,"sobel");
ed1=edge(IsegD,'sobel');
ed2=edge(IsegO,'sobel');
eva=evaluate(ed1,Itest);