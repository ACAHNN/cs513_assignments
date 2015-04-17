m = length(A);
[P,D] = eig(A);
D= diag(D);

% Step 1: Power Method
% (find the first two dominant eigenvalues)

% most dominant eigenvalue
[eval1,evec1,err1] = power_method(A,rand(m,1),10^-2);
fprintf('1st dom from pm: %f\n',eval1)
fprintf('true 1st dom: %f\n\n',D(1));

% second most dominant eigenvalue (deflate eval1 from A)
e = [1 zeros(1,m-1)]'; w = e-evec1; w = w/norm(w);
H = eye(m)-2*w*w';
A1 = H*A*H; tilA = A1(2:end,2:end);
[eval2,evec2,err2] = power_method(tilA,rand(m-1,1),10^-2);
fprintf('2nd dom from pm: %f\n',eval2)
fprintf('true 2nd dom: %f\n\n',D(2));

% Step 2: Inverse Power Method
% (find the first two least dominant evals)

% least dominant eigenvalue
[eval1,evec1,err1] = inv_power_method(A,rand(m,1),10^-2);
fprintf('1st least dom from pm: %f\n',eval1)
fprintf('true 1st least dom: %f\n\n',D(m));

% second least dominant eigenvalue (deflate eval1 from A)
e = [1 zeros(1,m-1)]'; w = e-evec1; w = w/norm(w);
H = eye(m)-2*w*w';
A1 = H*A*H; tilA = A1(2:end,2:end);
[eval2,evec2,err2] = inv_power_method(tilA,rand(m-1,1),10^-2);
fprintf('2nd least dom from pm: %f\n',eval2)
fprintf('true 2nd least dom: %f\n\n',D(m-1));