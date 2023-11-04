Ia=imread('20220927/rooster.jpg');
Ib=imread('20220927/elephant.png');
Ic=imread('20220927/boxes.pgm');

%change colour to grayscale(intensity scale),then change to double
Iagray=im2gray(Ia);
Ibgray=im2gray(Ib);
Icgray=im2gray(Ic);
Iagrayd=im2double(Iagray);
Ibgrayd=im2double(Ibgray);
Icgrayd=im2double(Icgray);

%backup plan, never try
%{
Iad=im2double(Ia);
Ibd=im2double(Ib);
Icd=im2double(Ic);
Iadgray=rgb2gray(Iad);
Ibdgray=rgb2gray(Ibd);
Icdgray=rgb2gray(Icd);
%}

conv2(I,H,shape)
%I is a 2-dimensional matrix representing image,
%H is a matrix representing the mask,
%shape is a parameter defining the size of the output.

%exercise1
boxmask5=fspecial('average',5);
boxmask25=fspecial('average',25);
rooster5=conv2(Iagrayd,boxmask5,"same");
rooster25=conv2(Iagrayd,boxmask25,"same");
boxes5=conv2(Icgrayd,boxmask5,"same");
boxes25=conv2(Icgrayd,boxmask25,"same");

%exercise2 Gaussian mask
gmask1=fspecial("gaussian",9,1.5);
gmask10=fspecial("gaussian",60,10);
roosterg1=conv2(Iagrayd,gmask1,"same");
roosterg10=conv2(Iagrayd,gmask10,"same");
boxesg1=conv2(Icgrayd,gmask1,"same");
boxesg10=conv2(Icgrayd,gmask10,"same");

%exercise3 first derivative mask
ymask=[-1;1];
xmask=[-1 1];
elephanty=conv2(Ibgrayd,ymask,"valid");
elephantx=conv2(Ibgrayd,xmask,"valid");

%exercise4 Laplacian mask
lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
roosterL=conv2(Iagrayd,lap,'same');
boxesL=conv2(Icgrayd,lap,"same");

%exercise5 Gaussian Derivative mask
derivativeX=[-1 1];
derivativeY=[-1;1];
Gmask=fspecial("gaussian",15,2.5);
GDX=conv2(Gmask,derivativeX,'same');
GDY=conv2(Gmask,derivativeY,"same");
BoxesGDX=conv2(Icgrayd,GDX,'same');
BoxesGDY=conv2(Icgrayd,GDY,"same");
figure(1), clf; subplot(2,2,1),mesh(GDX);title('GDX');subplot(2,2,2),
mesh(GDY),title('GDY');subplot(2,2,3),imagesc(BoxesGDX);title('boxesX');
subplot(2,2,4),imagesc(BoxesGDY),title('boxesY');
Icdg=sqrt(BoxesGDX.^2+BoxesGDY.^2);

%exercise 6 The Canny edge mask
%canny edge detector: edge(I,'Canny');
figure(9), clf
IcCanny=edge(Ic,'Canny');
imagesc(IcCanny), title('Canny'); colormap('gray'); axis('equal', 'tight'); colorbar

%exercise 6 Gaussian Pyramid creation
%{
wrong answer from me
G=fspecial("gaussian",9,1.5);
G1=conv2(G,G,'same');
G2=conv2(G1,G1,"same");
G3=conv2(G2,G2,"same");
rooster1=imresize(Iagrayd,0.5,"nearest");
rooster2=imresize(rooster1,0.5,"nearest");
rooster3=imresize(rooster2,0.5,"nearest");
rooster3G3=conv2(rooster3,G3,'same');
%}
%correct answer
figure(11), clf
g=fspecial('gaussian',9,1.5);
IpyrG=Ia;
subplot(2,2,1),imagesc(IpyrG); axis('equal','tight'),colorbar
for i=2:4
   IpyrG=imresize(conv2(IpyrG,g,'same'), 0.5, 'nearest');
   subplot(2,2,i),imagesc(IpyrG); axis('equal','tight'), colorbar
end
%{
a=Ia;
test=imresize(conv2(a,G,"same"),0.5,"nearest");
test1=imresize(conv2(test,G,"same"),0.5,"nearest");
test2=imresize(conv2(test1,G,"same"),0.5,"nearest");
test3=imresize(conv2(test2,G,"same"),0.5,"nearest");
%}
