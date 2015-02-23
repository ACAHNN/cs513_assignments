Z=[1,2,3;4,5,6;7,8,7;4,2,3;4,2,2];
R=Z;

% Iteration 1
x=R(:,1);
a=norm(x(1:5),2);
y=[x(1:0)' a zeros(1,4)]';
w=(x-y)/norm(x-y,2);
H=eye(5)-2*w*w';
Q=eye(5)*H;
R=H*R;

% Iteration 2
x=R(:,2);
a=norm(x(2:5),2);
y=[x(1:1)' a zeros(1,3)]';
w=(x-y)/norm(x-y,2);
H=eye(5)-2*w*w';
Q=Q*H;
R=H*R;

% Iteration 3
x=R(:,3);
a=norm(x(3:5),2);
y=[x(1:2)' a zeros(1,2)]';
w=(x-y)/norm(x-y,2);
H=eye(5)-2*w*w';
Q=Q*H;
R=H*R;