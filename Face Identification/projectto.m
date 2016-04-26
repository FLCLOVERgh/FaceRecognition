function vsort=projectto(sw,sb,num)
%compute the optimal projection vector of Sw and Sb
%Sb is the between classes disperse sample matrix
%Sw is the within-classes disperse matrix
%vsort is the optimal projection vector
invSw=inv(sw);
newspace=invSw*sb;
[x y]=eig(newspace);
d=diag(y);
[d1 index1]=dsort(d);
for i=1:num
    vsort(:,i)=x(:,index1(i));
end