function [Xp,yp] = prototypes(X,C,k,p)
[p1,index] = datasample(X,p);
size(index,2)
dv = size(p,1);
    for i = 1:size(index,2)
        dv(i,1) = C(index(i));
     
    end

Xp=p1;
yp=dv;
end