m = size(A);
L = {};

for k=1:m-1
    L{k} = eye(m);
    for i=k+1:m
        L{k}(i,k)=A(i,k)/A(k,k);
        for j=k:m
            A(i,j)=A(i,j)-L{k}(i,k)*A(k,j);
        end
    end
end