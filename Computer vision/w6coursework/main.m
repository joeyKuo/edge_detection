I1=imread("training_images/bikes/img1.png");
I2=imread("training_images/bikes/img2.png");
I1=rgb2gray(I1);
I2=rgb2gray(I2);
detector=detectHarrisFeatures(I1);
pos1=detector.Location;


detector2=detectHarrisFeatures(I2);
pos2=detector2.Location;
figure(2);imagesc(I2);hold on, plot(pos2(:,1),pos2(:,2),'y+','LineWidth',2);

figure(1);
subplot(2,2,1),imagesc(I1);hold on, plot(pos1(:,1),pos1(:,2),'y+','LineWidth',2);
subplot(2,2,2),imagesc(I2);hold on,plot(pos2(:,1),pos2(:,2),'y+','LineWidth',2);