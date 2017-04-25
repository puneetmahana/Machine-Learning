load('0vAllData.mat');
load('0vAllLabels.mat');
X = newdata;
Y = newlabels;
a = size(X,1)/4;
S1data = X([1:a],:);
S1label = Y([1:a],:);
traindata1 = X([1823:7291],:);
trainlabel1 = Y([1823:7291],:);
S2data = X([size(S1data)+1:a*2],:);
S2label = Y([size(S1data)+1:a*2],:);
traindata2 = X([1:1822,3646:7291],:);
trainlabel2 = Y([1:1822,3646:7291],:);
S3data = X([3646:a*3],:);
S3label = Y([3646:a*3],:);
traindata3 = X([1:3645,5469:7291],:);
trainlabel3 = Y([1:3645,5469:7291],:);
S4data = X([5469:size(X,1)],:);
S4label = Y([5469:size(X,1)],:);
traindata4 = X([1:5468],:);
trainlabel4 = Y([1:5468],:);

disp('------------------------------------------Case 1: S1 as test--------------');

errorlinear1 = SVM(traindata1,trainlabel1,S1data,S1label,50,'linear');
disp(errorlinear1);
errorpoly1 = SVM(traindata1,trainlabel1,S1data,S1label,50,'polynomial');
disp(errorpoly1);
errorrbf1 = SVM(traindata1,trainlabel1,S1data,S1label,50,'rbf');
disp(errorrbf1);

disp('------------------------------------------Case 2: S2 as test--------------');

errorlinear2 = SVM(traindata2,trainlabel2,S2data,S2label,50,'linear');
disp(errorlinear2);
errorpoly2 = SVM(traindata2,trainlabel2,S2data,S2label,50,'polynomial');
disp(errorpoly2);
errorrbf2 = SVM(traindata2,trainlabel2,S2data,S2label,50,'rbf');
disp(errorrbf2);

disp('------------------------------------------Case 3: S3 as test--------------');

errorlinear3 = SVM(traindata3,trainlabel3,S3data,S3label,50,'linear');
disp(errorlinear3);
errorpoly3 = SVM(traindata3,trainlabel3,S3data,S3label,50,'polynomial');
disp(errorpoly3);
errorrbf3 = SVM(traindata3,trainlabel3,S3data,S3label,50,'rbf');
disp(errorrbf3);

disp('------------------------------------------Case 4: S4 as test--------------');

errorlinear4 = SVM(traindata4,trainlabel4,S4data,S4label,50,'linear');
disp(errorlinear4);
errorpoly4 = SVM(traindata4,trainlabel4,S4data,S4label,50,'polynomial');
disp(errorpoly4);
errorrbf4 = SVM(traindata4,trainlabel4,S4data,S4label,50,'rbf');
disp(errorrbf4);

linearerror = (errorlinear1+errorlinear2+errorlinear3+errorlinear4)/4;
polyerror = (errorpoly1+errorpoly2+errorpoly3+errorpoly4)/4;
rbferror = (errorrbf1+errorrbf2+errorrbf3+errorrbf4)/4;
A = ['average error Linear methods: ',num2str(linearerror)];
B = ['average error Polynomial methods: ',num2str(polyerror)];
C = ['average error RBF methods: ',num2str(rbferror)];
disp(A);
disp(B);
disp(C);
