function sample=readsample(address,classnum,num)
%read sample function
%input£ºaddress is the address of the saple
%classnum is the cateegory of the samples need to be read
%num is the sample of each category
%the output is the sample matrix
allsamples=[];
image=imread([pwd '\ORL\s1_1.bmp']);%read the first image
[rows cols]=size(image);%get the column and row of the image
for i=classnum
    for j=num
        a=imread(strcat(address,num2str(i),'_',num2str(j),'.bmp'));
        b=a(1:rows*cols);
        b=double(b);
        allsamples=[allsamples;b];
    end
end
sample=allsamples;