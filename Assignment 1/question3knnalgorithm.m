load('MNISTdata.mat')
X = trainx;
C = trainLabel;
X1 = testx;
C1 = testLabel;
C2 = [0,1,2,3,4,5,6,7,8,9];
error1 =[];
M = knnmean(X,C);
for i = 1:2:19
    k = i;
    s = size(X1,1);
    count = 0;
    for i = 1:s
         z = X1(i,:);
        Clsprd = knn(X,C,z,k);
        if (Clsprd ~= C1(i))
            count = count + 1;
        end
    end
        temp=[count/s];
         error1 = [error1;temp];
         error1
         plot(error1)
   end
         




