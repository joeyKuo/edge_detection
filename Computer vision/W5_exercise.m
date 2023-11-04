I=imread('20220927/boat.png');
I=im2double(I);

%question 1
figure(1)
Igray=rgb2gray(I);
subplot(2,2,1); hist(Igray(:),64); title('Intensity')
Ired=I(:,:,1);
subplot(2,2,2); hist(Ired(:),64); title('Red')
Igreen=I(:,:,2);
subplot(2,2,3); hist(Igreen(:),64); title('Green')
Iblue=I(:,:,3);
subplot(2,2,4); hist(Iblue(:),64); title('Blue')

figure(2),clf, colormap('default')
Iseg=zeros(size(Igray));
Iseg(Igray<0.68)=1;
Iseg(Igray<0.47)=2;
Iseg(Igray<0.37)=3;
imagesc(Iseg); colorbar;

%question 2
figure(3),clf,colormap('default');
subplot(2,2,1);
IsegD=imdilate(Iseg,ones(3,3));
imagesc(IsegD);
subplot(2,2,2);
IsegE=imerode(Iseg,ones(3,3));
imagesc(IsegE);
subplot(2,2,3);
IsegO=imopen(Iseg,ones(3,3));
imagesc(IsegO);
subplot(2,2,4);
IsegC=imclose(Iseg,ones(3,3));
imagesc(IsegC);

IsegDD=imdilate(Iseg,strel('disk',3,0));
IsegEE=imerode(Iseg,strel('disk',3,0));
IsegOO=imopen(Iseg,strel('disk',3,0));
IsegCC=imclose(Iseg,strel('disk',3,0));

%question 3
figure(4),clf, colormap('default')
IsegK=imsegkmeans(im2single(I),5);
imagesc(Iseg); colorbar; title('k-means Clustering on RGB')

figure, colormap('default')
[a,b,c]=size(I);
[X,Y] = meshgrid(1:b,1:a);
featureSet = cat(3,I,X,Y);
Iseg=imsegkmeans(im2single(featureSet),5);
imagesc(Iseg); colorbar; title('k-means Clustering on RGB+XY')

%question 4
Ismall=imresize(I,0.25,'bilinear');
[a,b,c]=size(Ismall);
Msmall=reshape(Ismall,[a*b,c]);
Mseg=clusterdata(Msmall,'cutoff',0.3,'criterion','distance','linkage','average','distance','euclidean');
Iseg=reshape(Mseg,[a,b]);
figure(5),clf, colormap('default')
imagesc(Iseg); colorbar; title('Hierarchical Agglomerative Clustering on RGB')

figure(6),clf; colormap('default')
Msmall=Msmall-min(Msmall);
Msmall=Msmall./max(Msmall);
Mseg=clusterdata(Msmall,'cutoff',0.3,'criterion','distance','linkage','average','distance','euclidean');
Iseg=reshape(Mseg,[a,b]);
imagesc(Iseg); colorbar; title('Hierarchical Agglomerative Clustering on scaled RGB')