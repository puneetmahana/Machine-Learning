load('train_data.mat');
load('train_labels.mat');
load('test_data.mat')
load('test_labels.mat')
X1 = test_data;
Y1 = test_labels;
X = train_data;
Y = train_labels;
k = 2;
[mu,cov] = svm3d(X,k);
errorem = svm3derror(mu,cov,k)

%SVMStruct = svmtrain(train_data,train_labels,'boxconstraint',1,'kernel_function','linear');
%SVMStruct = svmtrain(train_data,train_labels,'boxconstraint',1,'kernel_function','polynomial','polyorder',3);
SVMStruct = svmtrain(train_data,train_labels,'boxconstraint',1,'kernel_function','rbf');
Group = svmclassify(SVMStruct,X1);
count = 0;
for i = 1:size(Group,1)
    if (Group(i) ~= test_labels(i))
        count = count + 1;
    end
end
errsvm = count/size(test_data,1)