function [sw sb]=computswb(samples,classnum,num)
%compute Sw and Sb
%samples is the input sample£¬classnumin the number of categories£¬
%num is the number of samples in the category
%Sb is the between classes disperse sample matrix
%Sw is the within-classes disperse matrix
samplemean=mean(samples);
for i=1:classnum
    newsamplemean(i,:)=mean(samples((i-1)*num+1:i*num,:));
end
sw=0;
for i=1:classnum
    for j=1:num
        sw=sw+(samples((i-1)*num+j,:)-newsamplemean(i,:))'*(samples((i-1)*num+j,:)-newsamplemean(i,:));
    end
end
sb=0;
for i=1:classnum
    sb=sb+(newsamplemean(i,:)-samplemean)'*(newsamplemean(i,:)-samplemean);
end