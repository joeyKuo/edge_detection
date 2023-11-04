%question 1
%import woods image
I=imread("20220927/woods.png");
I=im2double(I);
%DoG mask
GMask2=fspecial("gaussian",15,2.0);
GMask25=fspecial("gaussian",15,2.5);
dog=GMask2-GMask25;

%convolution
Idog=conv2(I,dog,"same");

%correlation
%shift 5 pixel
Icorr=corr2(Idog(1:end-5,:),Idog(1+5:end,:));
%shift 24 pixel
Icorr1=corr2(Idog(1:end-24,:),Idog(1+24:end,:));

%question 2
Ia=imread("20220927/rooster.jpg");
Ia=im2double(Ia);
gc=fspecial("gaussian",14,2.25);
IaYB=conv2(mean(Ia(:,:,1:2),3),gc,"same")-conv2(Ia(:,:,3),gc,'same');

%question 3
lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
g15=fspecial("gaussian",9,1.5);
g5=fspecial("gaussian",30,5);
log15=conv2(g15,lap,'valid');
log5=conv2(g5,lap,'valid');

I=imread("20220927/woods.png");
I=im2double(I);
ILog15=conv2(I,log15,'same');
ILog5=conv2(I,log5,'same');
figure(1),clf;
subplot(2,2,1),mesh(log15),colormap("jet");
subplot(2,2,2),mesh(log5),colormap("jet");
subplot(2,2,3),imagesc(ILog15);
subplot(2,2,4),imagesc(ILog5);

%question 4
gmask6=fspecial("gaussian",36,5.8);
gmask3=fspecial("gaussian",36,3.2);
dog=gmask3-gmask6;

lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
g4=fspecial("gaussian",36,4);
log=conv2(g4,lap,'same');
log=log./max(max(log));
dog=dog./max(max(dog));
a=sqrt(sum(sum((dog-log).^2)));

offsets=[0:0.1:3];
for offset=offsets
    dog=fspecial("gaussian",36,3+offset)-fspecial("gaussian",36,6-offset);
    lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
    g4=fspecial("gaussian",36,4);
    log=conv2(g4,lap,'same');
    log=log./max(max(log));
    dog=dog./max(max(dog));
    distance=sqrt(sum(sum((dog-log).^2))); 
    distance
end
figure(8), clf,
plot(offsets,distane);

%question 5
I=imread("20220927/woods.png");
I=im2double(I);
g=fspecial("gaussian",9,1.5);
%level 1
log1=I-conv2(I,g,'same');
%level 2
I1=imresize(conv2(I,g,'same'),0.5,"nearest");
log2=I1-conv2(I1,g,"same");
%level3
I2=imresize(conv2(I1,g,'same'),0.5,'nearest');
log3=I2-conv2(I2,g,"same");

%question 6
I=imread("20220927/elephant.png");
I=im2double(I);

gb0=gabor2(3,0.1,0,0.75,90); %not sure using 0 or 90
gb15=gabor2(3,0.1,15,0.75,90);
gb30=gabor2(3,0.1,30,0.75,90);
gb45=gabor2(3,0.1,45,0.75,90);
gb60=gabor2(3,0.1,60,0.75,90);
gb75=gabor2(3,0.1,75,0.75,90);
gb90=gabor2(3,0.1,90,0.75,90);
gb105=gabor2(3,0.1,105,0.75,90);
gb120=gabor2(3,0.1,120,0.75,90);
gb135=gabor2(3,0.1,135,0.75,90);
gb150=gabor2(3,0.1,150,0.75,90);
gb165=gabor2(3,0.1,165,0.75,90);
ig0=conv2(I,gb0,'valid');
ig15=conv2(I,gb15,'valid');
ig30=conv2(I,gb30,'valid');
ig45=conv2(I,gb45,'valid');
ig60=conv2(I,gb60,'valid');
ig75=conv2(I,gb75,'valid');
ig90=conv2(I,gb90,'valid');
ig105=conv2(I,gb105,'valid');
ig120=conv2(I,gb120,'valid');
ig135=conv2(I,gb135,'valid');
ig150=conv2(I,gb150,'valid');
ig165=conv2(I,gb165,'valid');
ig=sqrt((ig0.^2)+(ig15.^2)+(ig30.^2)+(ig45.^2)+(ig60.^2)+(ig75.^2)+(ig90.^2)+(ig105.^2)+(ig120.^2)+(ig135.^2)+(ig150.^2)+(ig165.^2));
%ig1=ig0+ig15+ig30+ig45+ig60+ig75+ig90+ig105+ig120+ig135+ig150+ig165;
