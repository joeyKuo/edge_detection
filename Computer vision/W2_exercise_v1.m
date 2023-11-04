Ia=imread('20220927/rooster.jpg');
Ib=imread('20220927/elephant.png');
Ic=imread('20220927/woods.png');

%change value at specific/a range of coordinate
Ib(403,404)=1;
Ib(401:end,401:end)=255;

%create own image
Isyn=zeros(201,201);
Isyn(51:150,51:150)=1;
Isyn(81:120,:)=0.5;
Isyn(:,81:120)=0.75;
figure(2), clf, imagesc(Isyn); colormap('gray')

%resize
Ibsmall1=imresize(Ib,0.5);
Iblarge1=imresize(Ib,2);

%using specific method to resize
Iblarge2=imresize(Ib,2,'bilinear');
Ibsmall2=imresize(Ib,0.5,'nearest');

%padding,cropping or removing row/column
Ibpad=padarray(Ib,[10,50]); %padding
Ibcrop=imcrop(Ib,[250,50,120,300]); %cropping

%
Isynv=Isyn(:); %modify from matrix to column
Isynv(1:202:end)=1;
Isyn=reshape(Isynv,201,201); %modiy from column back to matrix
figure(4), clf, imagesc(Isyn); colormap('gray')

Ibd=im2double(Ib);

%-----------------------------------------------------------------------
%calculate the differences in intensity values between pixels that are 
%vertical neighbours. neighbour number minus original number
Ibdiffv=Ibd(1:end-1,:)-Ibd(2:end,:); %vertical
figure(4), clf, imagesc(Ibdiffv);colormap('gray');colorbar
Ibdiffh=Ibd(:,1:end-1)-Ibd(:,2:end); %horizontal
figure(5), clf, imagesc(Ibdiffh);colormap('gray');colorbar
%example for Ibddiffv & Ibddiffh
a=[0 6 1 4;1 2 3 0;1 0 0 8];
b=[1 9 9 8;1 9 9 7;2 0 2 2];
adiffv=a(1:end-1,:)-a(2:end,:);
adiffh=a(:,1:end-1)-a(:,2:end);
bdiff=b(:,1:end-1)-b(:,2:end);
adiff=sqrt(adiffh(1:end-1,:).^2+adiffv(:,1:end-1).^2);

%combine vertical and horizontal image as one image
Ibdiff=sqrt(Ibdiffh(1:end-1,:).^2+Ibdiffv(:,1:end-1).^2);
figure(6), clf, imagesc(Ibdiff); colormap('gray'); colorbar

%convert to binary
bw=im2bw(Ibdiff,0.075);
figure(7), clf, imagesc(bw); colormap('gray'); colorbar

%-----------------------------------------------------------------------
%plot a graph to show their realtionship
offsets=[0:30];
for offset=offsets
   simb(offset+1)=corr2(Ib(1:end-offset,:),Ib(1+offset:end,:)); %shift one 
   % compared to oringal one vertically
   simc(offset+1)=corr2(Ic(1:end-offset,:),Ic(1+offset:end,:));
end
figure(8), clf,
plot(offsets,simb);
hold on;
plot(offsets,simc);
legend({'elephant','woods'});
xlabel('shift'); ylabel('correlation coefficient')

%first question answer
corr2(Ib(1:end-3,:),Ib(1+3:end,:));

%-----------------------------------------------------------------------
%DoG:difference of gaussian
%h = fspecial('gaussian',hsize,sigma) where hsize means size of filter
dog=fspecial('gaussian',11,1.25)-fspecial('gaussian',11,1.75);
