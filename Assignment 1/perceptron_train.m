count = 0;
s = size(X,1);
c = size(X,2);
w = zeros(1,c);
for i = 1:s
    a = w*transpose(X(i,:));
    if y(i)*a <= 0
        w = w + y(i)*X(i,:);
        count = count + 1;
    end
end
w
count


    
    

 

