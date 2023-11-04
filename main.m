I=imread('Images/im1.jpg');
I=im2gray(I);
I=im2double(I);
Itest=imread("Images/im1seg1.png");
Itest=im2double(Itest);
Itest1=imread("Images/im1seg5.png");
Itest1=im2double(Itest1);

%1. no method - 57%,34.7%
ed=edge(I,"canny");
figure(1),clf,imagesc(ed);colormap("gray");
eva=evaluate(ed,Itest)

%2. gaussian - second highest - 62.2%,42.9%
g=fspecial("gaussian",18,3);
Ig=conv2(I,g,"same");
ed1=edge(Ig,'sobel');
ed11=edge(Ig,"canny_old");
figure(2),clf,imagesc(ed1);colormap("gray");
eva1=evaluate(ed1,Itest)
eva11=evaluate(ed11,Itest)

%{
for i=1:6
    g=fspecial("gaussian",6*i,i);
    Ig=conv2(I,g,"same");
    ed1=edge(Ig,'canny_old');
    eva=evaluate(ed1,Itest1);
    eva
end
%}
%sd=3 get the highest score which is 0.5887;

%3. DoG - 62.2%,42.3%
dog=fspecial('gaussian',11,1.25)-fspecial('gaussian',11,1.75);
Id=conv2(I,dog,"same");
ed2=edge(Id,'canny_old');
eva2=evaluate(ed2,Itest)
%{
for i=0:0.1:2.8
    dog=fspecial('gaussian',18,6-i)-fspecial('gaussian',18,3+i);
    Id=conv2(I,dog,"same");
    ed2=edge(Id,'canny_old');
    eva2=evaluate(ed2,Itest1)
end
%}

%4. gabor - 56%,37.9%
gaborMask=gabor2(3,0.1,90,0.75,0);
Igb=conv2(I,gaborMask,"same");
ed3=edge(Igb,'canny_old');
eva3=evaluate(ed3,Itest1)

%5. Laplacian - highest - 63.6%,43.8%
lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
Il=conv2(I,lap,"same");
ed4=edge(Il,"canny_old");
eva4=evaluate(ed4,Itest1)

%6. LoG - 63.3%,43.49%
lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
g4=fspecial("gaussian",8,1.2);
log=conv2(g4,lap,'same');
Ilog=conv2(I,log,"same");
ed5=edge(Ilog,"canny_old");
eva5=evaluate(ed5,Itest)
%{
for i=1:0.1:6
g4=fspecial("gaussian",ceil(6*i),i);
log=conv2(g4,lap,'same');
Ilog=conv2(I,log,"same");
ed5=edge(Ilog,"canny_old");
eva5=evaluate(ed5,Itest)
end
%}

%evaluate
eval=evaluate(ed1,Itest);
%---------------------------------------------------------------------
I=imread('Images/im2.jpg');
I=im2gray(I);
I=im2double(I);
Itest=imread("Images/im2seg1.png");
Itest=im2double(Itest);
Itest1=imread("Images/im2seg5.png");
Itest1=im2double(Itest1);

%1. no method - 36.6%,50%
ed=edge(I,"canny");
figure(1),clf,imagesc(ed);colormap("gray");
eva=evaluate(ed,Itest)

%2. gaussian - 43.6%,52.6%
g=fspecial("gaussian",18,3);
Ig=conv2(I,g,"same");
ed1=edge(Ig,'canny');
ed11=edge(Ig,"canny_old");
figure(2),clf,imagesc(ed1);colormap("gray");
eva1=evaluate(ed1,Itest)
eva11=evaluate(ed11,Itest)

%{
for i=1:6
    g=fspecial("gaussian",6*i,i);
    Ig=conv2(I,g,"same");
    ed1=edge(Ig,'canny_old');
    eva=evaluate(ed1,Itest1);
    eva
end
%}
%sd=3 get the highest score which is 0.5887;

%3. DoG - 39%,53%
dog=fspecial('gaussian',11,1.25)-fspecial('gaussian',11,1.75);
Id=conv2(I,dog,"same");
ed2=edge(Id,'canny_old');
eva2=evaluate(ed2,Itest1)
%{
for i=0:0.1:2.8
    dog=fspecial('gaussian',18,6-i)-fspecial('gaussian',18,3+i);
    Id=conv2(I,dog,"same");
    ed2=edge(Id,'canny_old');
    eva2=evaluate(ed2,Itest1)
end
%}

%4. gabor - 36%,46%
gaborMask=gabor2(3,0.1,90,0.75,0);
Igb=conv2(I,gaborMask,"same");
ed3=edge(Igb,'canny_old');
eva3=evaluate(ed3,Itest)

%5. Laplacian - highest - 39%,53.6%
lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
Il=conv2(I,lap,"same");
ed4=edge(Il,"canny_old");
eva4=evaluate(ed4,Itest)

%6. LoG - 39.9%,53.7%
lap=[-1/8 -1/8 -1/8;-1/8 1 -1/8; -1/8 -1/8 -1/8];
g4=fspecial("gaussian",8,1.2);
log=conv2(g4,lap,'same');
Ilog=conv2(I,log,"same");
ed5=edge(Ilog,"canny_old");
eva5=evaluate(ed5,Itest)
%{
for i=1:0.1:6
g4=fspecial("gaussian",ceil(6*i),i);
log=conv2(g4,lap,'same');
Ilog=conv2(I,log,"same");
ed5=edge(Ilog,"canny_old");
eva5=evaluate(ed5,Itest)
end
%}

%------------------------------------------------------------------------
compare_segmentations(3);
for i=1:12
    compare_segmentations(i);
end