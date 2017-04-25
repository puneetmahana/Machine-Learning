function [class] = knn(X,C,z,k)
n = size(C,1);
dist = zeros(1,n);
distsort = zeros(1,n);
ids = size(k);
ak = size(k);
    for i = 1:n
        dist(i) = norm(z - X(i,:));
    end
[distsort,indexSort]= sort(dist);
    for i = 1:k
        ids(i) = indexSort(i);
        ak(i) = C(ids(i));
    end
class = mode(ak);
end




