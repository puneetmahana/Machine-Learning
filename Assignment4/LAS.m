function [count,A,FitInfo] = LAS(X,Y,L)
[A,FitInfo] = lasso(X,Y,'Lambda',L);
count = 0;
for i = 1:size(A,1)
    if A(i) ~= 0
        count = count + 1;
    end
end