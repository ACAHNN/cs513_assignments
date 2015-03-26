A = {};
% Question matrices
A{1}=hilb(25);
A{2}=q4_partA(linspace(0,10,25),24);
A{3}=magic(25);
A{4}=magic(25)*rand(25);
% Random matrices
A{5}=rand(25); A{6}=rand(25);
A{7}=rand(25); A{8}=rand(25);
% Random symmetric matrices
B=rand(25);A{9}=B*B';
B=rand(25);A{10}=B*B';
% x vector
x=(1:25)';
% Run analysis on each matrix in A{}
for i=1:10
    % compute b from our known x
    b=A{i}*x;
    if issymmetric(A{i})
        % Gauss Elimination on symmetric A
        [L,U] = lu_sym(A{i});
    else
        % Gauss Elimination LU factorization
        [L,U] = lu_basic(A{i});
    end
    x1 = inv(U)*(inv(L)*b);
    e1 = norm(x1-x);
    % Matlab's LU factorization
    [L,U,P] = lu(A{i});
    x2 = inv(U)*(inv(L)*(P*b));
    e2 = norm(x2-x);
    % Full pivoting LU factorization
    [L,U,P,Q] = lu_pivot(A{i});
    x3 = Q*(inv(U)*(inv(L)*(P*b)));
    e3 = norm(x3-x);
    results = sprintf('cond: %e\ne1: %e e2: %e e3: %e',
                        cond(A{i}),e1,e2,e3)
end