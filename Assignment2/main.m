load('IRISData.mat');
load('IRISLabels.mat');
X = trainData;
Y = trainLabels;
k = 2;
[param,Log] = EM(X,k);
disp(param);
disp(Log);
