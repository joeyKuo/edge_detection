gmask=fspecial("gaussian",3,0.46);
gmask1=conv2(a,a,'same');

a=[1 1 1;1 0 0;1 1 1];
b=[0.5 0.5 0.5;0.5 0 0;0.5 0.5 0.5];
c=a.*b;

a1=a.^2;
b1=b.^2;
a2=sqrt(sum(a1));
b2=sqrt(sum(b1));
ab=sum(a)/numel(a);
bb=sum(b)/numel(b);
%NCC%
ncc=sum(c)/(a2*b2);

%cross correlation%
cc=sum(c);

%correlation coieffcient
cc1=sum((a-ab).*(b-bb))/((sqrt(sum((a-ab).^2)))*(sqrt(sum((b-bb).^2))));

%sum of squared difference
ssd=sum((a-b).^2);

%euclidean distance
ed=sqrt(ssd);

%sum of absolute difference
sad=sum(abs(a-b));
