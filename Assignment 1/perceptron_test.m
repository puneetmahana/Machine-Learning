load('new_inputs.mat');
load('new_outputs.mat');
X=newinputs;
y=outputs;
count = 0;
s = size(X,1);
c = size(X,2);
w = [-159.2060  151.8443]
v = [1 0]
for i = 1:s
    a = w*transpose(X(i,:));
    if y(i)*a <= 0
        count = count + 1;
    end
end
temp = dot(w,v)/(norm(w)*norm(v));
degrees = acosd(temp);
testerr = count/s;
testerr
degrees
margin=min(abs(X*w.' / norm(X)));
%plot_points_and_classifier(X,y,w);