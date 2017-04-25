load('IRISData.mat');
load('IRISLabels.mat');
X = trainData;
Y = trainLabels;
k = 2;
[sorted,i] = sort1(Y);
[param,Log] = EM(sorted,k);
disp(param);
disp(Log);