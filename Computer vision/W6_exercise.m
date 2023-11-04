I=imread("20220927/cameraman.tif");
harris=detectHarrisFeatures(I);
surf=detectSURFFeatures(I);
[features1, valid_points1] = extractFeatures(I,harris);
[features2, valid_points2] = extractFeatures(I,surf);

%harris
subplot(1,2,1),imshow(I); 
hold on,plot(valid_points1);
%SURF
subplot(1,2,2),imshow(I); 
hold on,plot(valid_points2.selectStrongest(100),'showOrientation',true);

%using indoo image
I=imread("20220927/indoor.jpg");
I=rgb2gray(I);
harris=detectHarrisFeatures(I);
surf=detectSURFFeatures(I);
[features1, valid_points1] = extractFeatures(I,harris);
[features2, valid_points2] = extractFeatures(I,surf);
%harris
subplot(1,2,1),imshow(I); 
hold on,plot(valid_points1);
%SURF
subplot(1,2,2),imshow(I); 
hold on,plot(valid_points2.selectStrongest(100),'showOrientation',true);