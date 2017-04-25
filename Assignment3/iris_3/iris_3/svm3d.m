function [mu,cov] = svm3d(X,k)
r = size(X,1);
c = size(X,2);
max = 10;
Param = [];
pxgvny = zeros(r,k);
pyj = zeros(k,1);
pxi = zeros(r,1);
pyxi = zeros(k,r);
mu = datasample(X,k); 
cov = ones(k,1);
LogL = zeros(max,1);
for i = 1:k
   pyj(i) = 1/k;
end
z = 1;
    while z <= max
        for m = 1:r
            pxi(m) = 0;
            for l = 1:k
                pxgvny(m,l) = mvnpdf(X(m,:), mu(l,:),cov(l)*eye(c));
                pxi(m) = pxi(m) + pxgvny(m,l) * pyj(l);
            end
        end
        for m = 1:r
            for l = 1:k
                pyxi(l,m) = (pxgvny(m,l) * pyj(l))/pxi(m);
            end
        end
    NJ = sum(pyxi,2);

for j = 1:k
    mu(j,:)=0;
    cov(j,:) = 0;
    for i = 1:r
       mu(j,:) = mu(j,:) + pyxi(j,i) * X(i,:)/NJ(j) ;
       cov(j) = pyxi(j, :) * sum( (X - repmat(mu(j, :), r, 1)) .^ 2, 2 ) / c / NJ(j);
       pyj(j) = NJ(j)/r;
    end
  end

for i = 1:r
    for j = 1:k
        L = log(mvnpdf(X(i, :), mu(j, :), cov(j) * eye(c)))+ log(pyj(j));
        LogL(z) = LogL(z) + pyxi(j, i) * L ;
    end
end
 z = z + 1;
    end
 