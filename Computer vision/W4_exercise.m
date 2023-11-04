I=imread('20220927/elephant.png');
Ia=im2double(I);

%exercise 1
gaborMask=gabor2(3,0.1,90,0.75,90);
IaG=conv2(Ia,gaborMask,"valid");

%exercise2 
gaborMask2=gabor2(3,0.1,90,0.75,0);
IaG1=conv2(Ia,gaborMask,"valid");
IaG2=conv2(Ia,gaborMask2,"valid");
IaGL2=sqrt(IaG1.^2+IaG2.^2);