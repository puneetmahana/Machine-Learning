
function [sorted,indexes] = sort1(trainLabels)
load('IRISData.mat');
X = trainData;
r = size(X,1);
[sorted,indexes]=sort(trainLabels);
sorted = trainData; 
for i=1:size(X,1)
     sorted(i,:) = trainData(indexes(i),:); 
end
end
