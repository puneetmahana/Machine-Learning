function [M] = knnmean(X,C)
count = 0;
M=zeros(1,size(X,2),10);
alc=zeros(10,1); 
for j=1:size(X,1)
    p= C(j) + 1; 
    alc(p)=alc(p) + 1; 
    M(:,:,p)=M(:,:,p) + X(j,:); 
end;
for k=1:10
    M(:,:,k)=M(:,:,k)/alc(k); 
end; 