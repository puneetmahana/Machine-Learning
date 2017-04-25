function [errem] = svm3derror(mu,cov,k)
load('test_data.mat');
load('test_labels.mat');
X = test_data;
Y = test_labels;
r = size(X,1);
c = size(X,2);
max = 10;
Param = [];
pxgvny = zeros(r,k);
pyj = zeros(k,1);
pxi = zeros(r,1);
pyxi = zeros(k,r);
count = 0;
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
    for i = 1:r
       pyj(j) = NJ(j)/r;
    end
  end

 z = z + 1;
    end
 for i=1:r
     for j=1:2
         if pyj(1) > pyj(2)
             newlabel(i) = 1;
         else
             newlabel(i) = -1;
         end
     end
 end
 for i=1:r
     if newlabel(i) ~= Y(i)
         count = count + 1;
     end
 end
 errem = count/r;
    