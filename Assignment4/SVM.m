function err = SVM(traindata,trainlabel,testdata,testlabel,C,kerneltype)
SVMStruct = svmtrain(traindata,trainlabel,'boxconstraint',C,'kernel_function',kerneltype,'autoscale',false);
Group = svmclassify(SVMStruct,testdata);
count = 0;
for i = 1:size(Group,1)
    if (Group(i) ~= testlabel(i))
        count = count + 1;
    end
end
err = count/size(testdata,1);
end
