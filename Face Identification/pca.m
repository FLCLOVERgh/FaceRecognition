%PCA program£¬patterns here is for input mode vector,num is the contorol variable
%Output£ºbasevector is the feature vector after computing the maxim feature value
%newsample is the represent of the sample
function [newsample basevector]=pca(patterns,num)
[u v]=size(patterns);
totalsamplemean=mean(patterns);
for i=1:u
    gensample(i,:)=patterns(i,:)-totalsamplemean;
end
sigma=gensample*gensample';
[U V]=eig(sigma);
d=diag(V);
[d1 index]=dsort(d);
if num>1
    for i=1:num
        vector(:,i)=U(:,index(i));
        base(:,i)=d(index(i))^(-1/2)* gensample' * vector(:,i);
    end
else
    sumv=sum(d1);
    for i=1:u
        if sum(d1(1:i))/sumv>=num
            l=i;
            break;
        end
    end
    for i=1:l
        vector(:,i)=U(:,index(i));
        base(:,i)=d(index(i))^(-1/2)* gensample' * vector(:,i);
    end
end
newsample=patterns*base;
basevector=base;