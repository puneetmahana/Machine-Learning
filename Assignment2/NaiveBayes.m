load('SPECTtrainData.mat');
load('SPECTtrainLabels.mat');
load('SPECTtestData.mat');
load('SPECTtestLabels.mat');
X = trainData;
Y = trainLabels;
X1 = testData;
Y1 = testLabels;
s = size(Y,1);
s1 = size(X,1);
s2 = size(X,2);
count1 = 0;
for i = 1:s
    if Y(i,1) == 1
        count1 = count1 + 1;
    end
end
count0 = s - count1;
proby1 = count1/s;
proby0 = count0/s;
py11 = [];
py01 = [];
py10 = [];
py00 = [];
P1 = [];
P2 = [];
P3 = [];
P4 = [];
for i = 1:s2
      cy11 = 0;
      cy01 = 0;
      cy10 = 0;
      cy00 = 0;
    for j = 1:s1
        if Y(j) == 1 && X(j,i) == 1
            cy11 = cy11 + 1;         
        end
    end
py11 = [py11;cy11];
    for j = 1:s1
        if Y(j) == 0 && X(j,i) == 1
            cy01 = cy01 + 1;         
        end
    end
py01 = [py01;cy01];
    for j = 1:s1
        if Y(j) == 1 && X(j,i) == 0
            cy10 = cy10 + 1;         
        end
    end
py10 = [py10;cy10];
    for j = 1:s1
        if Y(j) == 0 && X(j,i) == 0
            cy00 = cy00 + 1;         
        end
    end
py00 = [py00;cy00];
end
for i = 1:s2
    P1(i) = (py11(i) + 1)/(count1 + 2);
    P3(i) = (py10(i) + 1)/(count1 + 2);
    P2(i) = (py01(i) + 1)/(count0 + 2);
    P4(i) = (py00(i) + 1)/(count0 + 2);
end
errcount = 0;
label = [];
for i = 1:size(X1,1)
prody1 = proby1(1,1);
prody0 = proby0(1,1);
    for j = 1:size(X1,2)
        if X1(i,j) == 0
            prody1 = prody1 * P3(j);
        end
        if X1(i,j) == 1 
            prody1 = prody1 * P1(j);
        end
    end  
     for j = 1:size(X1,2)
        if X1(i,j) == 0 
            prody0 = prody0 * P4(j);
        end
        if X1(i,j) == 1 
            prody0 = prody0 * P2(j);
        end
     end

    if prody1 < prody0
      label(i) = 0;
    else
      label(i) = 1;
    end
end
for i = 1:size(X1,1)
    if label(i) ~= Y1(i)
        errcount = errcount + 1;
    end
end
error = errcount/size(Y1,1);
disp(error);