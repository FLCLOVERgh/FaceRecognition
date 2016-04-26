clear all
clc
close all
start=clock;
sample_class=1:40;%sample category
sample_classnum=size(sample_class,2);%the number of sample category
fprintf('Program starts.........\n\n');

for train_samplesize=3:8;
    train=1:train_samplesize;%training sample in each category
    test=train_samplesize+1:10;%testing sample in each category
    
    train_num=size(train,2);%the number of training sample in each category
    test_num=size(test,2);%the number of testing sample in each category
    
    address=[pwd '\ORL\s'];
    %read training sample
    allsamples=readsample(address,sample_class,train);
    
    %use PCA to project the high-dimensional data onto a low-dimensional feature subspace
    [newsample base]=pca(allsamples,0.9);
    %compute the Sw and Sb
    [sw sb]=computswb(newsample,sample_classnum,train_num);
    
    %read testing sample
    testsample=readsample(address,sample_class,test);
    best_acc=0;%the optimal recognition rate
    %find the optimal projection dimension
    for temp_dimension=1:1:length(sw)
        vsort1=projectto(sw,sb,temp_dimension);
        
        %projection of both the testing sample and the training sample
        tstsample=testsample*base*vsort1;
        trainsample=newsample*vsort1;
        %calculate the recognition rate
        accuracy=computaccu(tstsample,test_num,trainsample,train_num);
        if accuracy>best_acc
            best_dimension=temp_dimension;%save the optimal projection dimension
            best_acc=accuracy;
        end
    end
    %---------------------------------output display----------------------------------
    fprintf('The number of training sample in each category£º%d\n',train_samplesize);
    fprintf('The optimal projection dimension£º%d\n',best_dimension);
    fprintf('FisherFace recognition rate£º%.2f%%\n',best_acc*100);
    fprintf('Operation time£º%3.2fs\n\n',etime(clock,start));
end
fprintf('The end of the program.........\n\n');