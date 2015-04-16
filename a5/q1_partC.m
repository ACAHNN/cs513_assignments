lu_times = []; mpm_times = []; m = 50;
for i=1:100
    % create the tridiagonal matrix
    B=rand(m); A=B*B';
    A=diag(diag(A,-1),-1)+diag(diag(A))+diag(diag(A,1),1);
    
    % Method 1: LU factorization
    tic;
    % case 1: A-0*I
    [L,U] = lu_sym(A);
    pevals1 = length(find(diag(U)>0));
    % case 2: A-1*I
    [L,U] = lu_sym(A-eye(m));
    pevals2 = length(find(diag(U)>0));
    % eigen values in the range
    pevals = pevals1-pevals2;
    lu_times(i) = toc;
    
    % Method 2: MPM sequences
    tic;
    % case 1: A-0*I
    [d] = mpm(A);
    % count the sign changes
    pevals1 = sign_changes(d);
    % case 2: A-1*I
    [d] = mpm(A-eye(m));
    % count the sign changes
    pevals2 = sign_changes(d);
    % eigen values in the range
    pevals = pevals2-pevals1;
    mpm_times(i) = toc;
    
end

avg_lu=sum(lu_times)/m
avg_mpm=sum(mpm_times)/m