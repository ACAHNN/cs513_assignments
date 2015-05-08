% Generate B
B=rand(30,10);
D=rand(10,10);
for k=100:100:999
    % Generate C
    C=D;
    C(1:2,:)=C(1:2,:)*k;
    % Generate A
    A=B*C;
    [U,S,V] = svd(A);
end
