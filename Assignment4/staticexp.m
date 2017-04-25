function Lplot = staticexp(X,Y,b)
d = size(X,2);
t = 1;
pt = zeros(size(X,1),size(X,2));
for l = 1:d
    pt(1,l) = 1/d;
end
Lplot = [];
temp = 0;
for j = 1:size(X,1)
    sum = 0;
    t = j;
    outpred = 0;
    for k = 1:d
        outpred = outpred + pt(j,k)*X(j,k);
    end
    for i = 1:d
        loss = power(X(j,i) - Y(j),2);
        c = exp(-b * loss);
        pt(j+1,i) = pt(j,i)*c;
        sum = sum + pt((j+1),i);
    end
    temp=temp + (outpred - Y(j))^2;
    
    Lplot = [Lplot;temp/t];
    for i = 1:d
        pt(j+1,i) = pt(j+1,i)/sum;
    end
end
end



        
        