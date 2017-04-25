function [count,A] = RID(Y,X,L)
A = ridge(Y,X,L,0);
count = 0;
for i = 1:size(A,1)
    if A(i) ~= 0
        count = count + 1;
    end
end