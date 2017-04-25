load('forestfires.csv');
X = forestfires;
shuffledArray = X(randperm(size(X,1)),:);
XX = X(:,[1:12]);
YY = X(:,[13]);
for i = 1:size(YY,1)
    if YY(i) == 0
        YY(i) = YY(i) + 0.1;
    end
    YY(i) = log(YY(i));
end
trainX = XX(1:400,:);
trainY = YY(1:400,:);
testX = XX(401:517,:);
testY = YY(401:517,:);
lamda = [0.9,0.1,0.01,0.6,0.12];
lamda1 = [1,50,100,200,1000];

[counta1,A1,FitInfo1] = LAS(trainX,trainY,lamda(1));
[counta2,A2,FitInfo2] = LAS(trainX,trainY,lamda(2));
[counta3,A3,FitInfo3] = LAS(trainX,trainY,lamda(3));
[counta4,A4,FitInfo4] = LAS(trainX,trainY,lamda(4));
[counta5,A5,FitInfo5] = LAS(trainX,trainY,lamda(5));
[countb1,B1] = RID(trainY,trainX,lamda1(1));
[countb2,B2] = RID(trainY,trainX,lamda1(2));
[countb3,B3] = RID(trainY,trainX,lamda1(3));
[countb4,B4] = RID(trainY,trainX,lamda1(4));
[countb5,B5] = RID(trainY,trainX,lamda1(5));


%{
nzcoef = [counta1,counta2,counta3,counta4,counta5];
%plot(lamda,nzcoef);
wb = min(nzcoef);
disp('Wb');
disp(wb);
Indexes = find(nzcoef==wb);
disp(Indexes);
S = [FitInfo1,FitInfo2,FitInfo3,FitInfo4,FitInfo5];
omega = [A1,A2,A3,A4,A5];
w = [S.Intercept; omega];

error = sum( ([ones(size(testX, 1), 1), testX] *w - repmat(testY, 1, length(lamda))) .^ 2 ) / length(testY);
disp(error);
%plot(lamda,error);
minerror = min(error);
Index = find(error==minerror);
errlambda=[];
for i = 1:size(Index,2)
      errlambda = [errlambda;lamda(Index(i))];
end
disp(errlambda);
%}
%%----------------------------------------RIDGE------------------------------------------------------------------------
nzcoef1 = [countb1,countb2,countb3,countb4,countb5];
%plot(lamda1,nzcoef1);
wbrid = min(nzcoef1);
Indexes1 = find(nzcoef1==wbrid);
disp(Indexes1);
omega1 = [B1,B2,B3,B4,B5];

error1 = sum( ([ones(size(testX, 1), 1), testX] *omega1 - repmat(testY, 1, length(lamda1))) .^ 2 ) / length(testY);
disp(error1);
plot(lamda1,error1);
minerror1 = min(error1);
Index1 = find(error1==minerror1);
errlambda1=[];
for i = 1:size(Index1,2)
      errlambda1 = [errlambda1;lamda1(Index1(i))];
end
disp(errlambda1);
