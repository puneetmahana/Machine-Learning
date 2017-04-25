load('cloud.data');
X = cloud(:,[1:6,8:10]);
Y = cloud(:,[7]);
Lt1 = staticexp(X,Y,1);
Lt2 = staticexp(X,Y,0.00001);
Lt3 = staticexp(X,Y,0.0000001);
Lt4 = staticexp(X,Y,0.000000000001);
t=[];
for i=1:size(X,1)
    t=[t;i];
end
%plot(Lt1);
figure,plot(t,Lt1,t,Lt2,t,Lt3,t,Lt4);

