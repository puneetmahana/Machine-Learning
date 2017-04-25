load('train_data.mat')
load('train_labels.mat')
load('test_data.mat')
load('test_labels.mat')
SVMStruct = svmtrain(train_data,train_labels,'boxconstraint',1,'kernel_function','linear');
Group = svmclassify(SVMStruct,test_data);
count = 0;
for i = 1:size(Group,1)
    if (Group(i) ~= test_labels(i))
        count = count + 1;
    end
end
err = count/size(test_data,1)
