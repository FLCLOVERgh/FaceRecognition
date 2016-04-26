function accuracy=computaccu(testsample,num1,trainsample,num2)
%function: compute the face reccognition rate
%input: testsample is the sample after projection,num1is the number of samples in each category,
%trainsample is the training sample after projection
%num2 is the number of samples in each category,
%output is the recognition rate
accu=0;
testsampnum=size(testsample,1);
trainsampnum=size(trainsample,1);
for i=1:testsampnum
    for j=1:trainsampnum
        juli(j)=norm(testsample(i,:)-trainsample(j,:));
    end
    [temp index]=sort(juli);
    if ceil(i/num1)==ceil(index(1)/num2)
        accu=accu+1;
    end
end
accuracy=accu/testsampnum;
