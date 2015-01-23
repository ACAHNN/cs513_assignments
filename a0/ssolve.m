function x = ssolve(a, b, n)
A = eye(n);
A(1,2) = a;
A(20,1:19) = b;
B = (1:n)';
B(n-1,1) = 0;
x = A\B;
