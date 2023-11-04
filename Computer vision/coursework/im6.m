I=imread("Images/im6.jpg");
I=im2gray(I);
I=im2double(I);
Ia=imread("Images/im6seg1.png");
Ia=im2double(Ia);


dog=fspecial('gaussian',11,1.25)-fspecial('gaussian',11,1.75);
Id=conv2(I,dog,"same");
ed2=edge(Id,'canny_old');
eva2=evaluate(ed2,Ia)

lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
Il=conv2(I,lap,"same");

gaborMask=gabor2(3,0.1,90,0.75,90);
gaborMask2=gabor2(3,0.1,90,0.75,0);
IaG1=conv2(I,gaborMask,"same");
IaG2=conv2(I,gaborMask2,"same");
IaGR=sqrt(IaG1.^2+IaG2.^2);

Iseg=zeros(size(Id));
Iseg(Id<0.5)
IsegO=imopen(Iseg,strel('disk',1));
IsegE=imerode(Iseg,strel('disk',1));
IsegC=imdilate(IsegE,strel('disk',1));

hist(Id(:),64);

figure,clf;subplot(2,2,1),imagesc(Iseg);colormap("gray");
subplot(2,2,2),imagesc(IsegO);colormap("gray");
subplot(2,2,3),imagesc(IsegE);colormap("gray");
subplot(2,2,4),imagesc(IaGR);
eva=evaluate(IsegO,Ia)

%--------------------------------------------------------------------
lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
g4=fspecial("gaussian",8,1.2);
log=conv2(g4,lap,'same');
Ilog=conv2(I,log,"same");
ed5=edge(Ilog,"roberts");
eva=evaluate(ed5,Ia)
imagesc(ed5);