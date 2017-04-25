load('train_labels.mat')
load('test_labels.mat')
load('train_data.mat')
load('test_data.mat')
SVMStruct = svmtrain(train_data,train_labels,'showplot',true);
Group = svmclassify(SVMStruct,test_data,'Showplot',true);
count = 0;
for i = 1:size(Group,1)
    if (Group(i) ~= test_labels(i))
        count = count + 1;
    end
end
err = count/size(test_data,1)
    