function x = ssolve(a, b, n)
A = eye(n);
A(1,2) = a;
A(n,1:n-1) = b;
B = (1:n)';
B(n-1,1) = 0;
x = A\B;
