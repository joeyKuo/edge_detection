Ia=imread('20220927/rooster.jpg');
Ib=imread('20220927/elephant.png');
Ic=imread('20220927/woods.png');

%change the specific location's colour(change number between 1-255)
Ia(411,422)=1;

%change a range of location's colour(change number between 1-255)
Ia(3:end,100:300)=244;

%print the image
imagesc(Ia);

%change the colour of image
imagesc(Ia);colormap('gray');

%create a image
Isyn=zeros(201,201);
Isyn(51:150,51:150)=1;
Isyn(81:120,:)=0.5;
Isyn(:,81:120)=0.75;
figure(2), clf, imagesc(Isyn); colormap('gray')

%change size of image
IbSmall=imresize(Ib,0.5);
IbLarge=imresize(Ib,2);

figure(3), clf
subplot(2,2,1), imagesc(IbSmall); title('Half size')
subplot(2,2,2), imagesc(IbLarge); title('Double size')

%change size of image by using 'bilinear' or 'nearest'
IbSmall1=imresize(Ib,0.5,"bilinear");
IbLarge1=imresize(Ib,2,"bilinear");
IbLarge2=imresize(Ib,2,"nearest");

figure(4), clf
subplot(2,2,1), imagesc(IbSmall1); title('Half size')
subplot(2,2,2), imagesc(IbLarge1); title('Double size')

%padding
Ibpad=padarray(Ib,[10,50]);

%cropping-[xmin ymin width height]
Ibcrop=imcrop(Ib,[250,50,120,300]);

%change image from matrix to vector, then resharp it back to matrix
Isynv=Isyn(:);
Isynv(1:202:end)=1;
Isyn=reshape(Isynv,201,201);

%change format from uint8 to double
Ibd=im2double(Ib);

%calculate the differences in intensity values between pixels that
% are vertical neighbours. To do this we take all the rows of the image 
% that have a neighbour vertically below them, subtract that neighbour's 
% value, and show the result:
%ex: a=[1 2;3 4;5 6], a'=[1-3 2-4;3-5 4-6]=[-2 -2;-2
%-2]
Ibdiffv=Ibd(1:end-1,:)-Ibd(2:end,:);

%follow abouve,do the minus horizantolly a=[1 2;3 4;5 6], 
% a'=[1-2;3-4;5-6]=[-1;-1;-1]
Ibdiffh=Ibd(:,1:end-1)-Ibd(:,2:end);

%combine the vertical and horizontal difference images into a single image
%showing (using positive pixel values) large changes in the intensity in 
% both the vertical and horizontal directions, by calculating the L2-norm 
% (or Euclidean-norm):
Ibdiff=sqrt(Ibdiffh(1:end-1,:).^2+Ibdiffv(:,1:end-1).^2);

%change to binary image
bw=im2bw(Ibdiff,0.075);
figure(7), clf, imagesc(bw); colormap('gray'); colorbar


%%%先用移動3pixel減去原來再跟原來比較(corr2)
%woods wrong answer
Ic=imread('20220927/woods.png');
Icd=im2double(Ic);
Icdiffv=Icd(1:end-3,:)-Icd(4:end,:);
corr2(Icd(1:end-3,:),Icdiffv)

%%%correct answer
offsets=[0:30];
for offset=offsets
   simb(offset+1)=corr2(Ib(1:end-offset,:),Ib(1+offset:end,:));
   simc(offset+1)=corr2(Ic(1:end-offset,:),Ic(1+offset:end,:));
end

%%%modified elephant
Ib=imread('20220927/elephant.png');
Ib(403,404)=1;
Ib(401:end,401:end)=255;
Ibd=im2double(Ib);

%%%modified rooster
Ia=imread('20220927/rooster.jpg');
Iad=im2double(Ia);


IaRG=conv2(Iad(:,:,1),gc,'same')-conv2(Iad(:,:,2),gs,'same');
mean(Iad(:,:,1:2),3)
IaRG=conv2(mean(Iad(:,:,1:2),3),gc,'same')-conv2(Iad(:,:,3),gs,'same');

%red-on,green-off
IaRG=conv2(Iad(:,:,1),gc,'same')-conv2(Iad(:,:,2),gs,'same');
%red-off,green-on
IaGR=conv2(Iad(:,:,2),gc,'same')-conv2(Iad(:,:,1),gs,'same');
%blue-on, yellow-off
IaBY=conv2(Iad(:,:,3),gc,'same')-conv2(mean(Iad(:,:,1:2),3),gs,'same');
%blue-off,yellow-on
IaYB=conv2(mean(Iad(:,:,1:2),3),gc,'same')-conv2(Iad(:,:,3),gs,'same');

figure(10), clf, colormap('gray')
Iagray=rgb2gray(Iad);
subplot(2,3,1); imagesc(Iagray); axis('off','equal','tight'); colorbar, title('intensity')
subplot(2,3,2); imagesc(IaRG); axis('off','equal','tight'); colorbar, title('red-on, green-off');
subplot(2,3,3); imagesc(IaYB); axis('off','equal','tight'); colorbar, title('yellow-on, blue-off');
Ialab=rgb2lab(Iad);
subplot(2,3,4); imagesc(Ialab(:,:,1)); axis('off','equal','tight'); colorbar, title('L-channel');
subplot(2,3,5); imagesc(Ialab(:,:,2)); axis('off','equal','tight'); colorbar, title('a-channel');
subplot(2,3,6); imagesc(Ialab(:,:,3)); axis('off','equal','tight'); colorbar, title('b-channel');