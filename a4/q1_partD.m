% run on matrices of different sizes
for j=3:6
    % create random symmetric matrices
    B=rand(10*j);
    A=B*B';
    
    % arrays for time storage
    sym_t=0; reg_t=0;
    
    % run the experiment 100 times
    for i=1:100
        % symmetric LU factorization
        [L,U,t] = lu_sym(A);
        sym_t(i) = t;

        % Gauss elimination LU factorization
        [L,U,t] = lu_basic(A);
        reg_t(i) = t;
    end
    sym_over_gauss = mean(sym_t)/mean(reg_t)
end