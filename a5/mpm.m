function [d] = mpm(A)
    n = size(A);
    d = []; d(1) = 1;
    d(2) = A(1,1);
    for i=2:n
        d(i+1)=A(i,i)*d(i)-A(i,i-1)^2*d(i-1);
    end
end