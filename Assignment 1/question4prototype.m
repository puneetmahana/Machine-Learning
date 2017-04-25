load('MNISTdata.mat')
X = trainx;
C = trainLabel;
X1 = testx;
C1 = testLabel;
s = size(X1,1);
error1 =[];
count = 0;
a = [40,80,160,320]
for i = 1:size(a)
    p = a(i);
    k = p/20;
[Xp,yp] = prototypes(X,C,k,p);
    for i = 1:s
         z = X1(i,:);
        class = knn(Xp,yp,z,k);
        if (class ~= C1(i))
            count = count + 1;
        end
    end
    temp =[count/s];
     error1 = [error1;temp];
      error1
end