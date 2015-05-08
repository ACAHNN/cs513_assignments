% Question 2

% Generate A from generate_interval_matrix
m = 100; n = [4 5 10]; e = 1;
A = generate_interval_matrix(m,n,e);

% Generate a random b
b = rand(100,1);

% Find the actual x (partt(i))
x = A\b

% Use function from Q1 (part(ii))
n = [5 10 20 90];
errs = []; Q = {}; S = {};
for i=1:4
    % gather data
    [Q{i},S{i},xtil]=my_gmres(A,b,n(i));
    errs = [errs norm(A*xtil-b)];
    disp(sprintf('n: %d error: %f',n(i),norm(A*xtil-b)));
end
plot(n,errs,'b--o')