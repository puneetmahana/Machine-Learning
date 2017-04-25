load('cloud.data');
X = cloud(:,[1:6,8:10]);
Y = cloud(:,[7]);
Lt1 = staticexp(X,Y,1);
plot(Lt1);

