%this routine performs qr factorization using householder matrices
%it is correct, but highly inefficient. In assignments 1 and 2, cs513 students
%will examine its inefficiency and will improve it.
  ops = 0;
  n=size(A);               % n is defined as the order of A;
  
  R=A;                    %the original matrix A is stored
			  %in order to check at the end
			  %that the QR factorization was performed correctly
  Q=eye(n(1));
  
  for i=1:n(1)-1,

%i is a running index for the elimination step. entering
%the i'th step, we have in hand a factroization
%Q*R, with Q the product of the previous Householder
%matrices we used, and R the partially processed matrix (i.e., A_i in the
%notations used in class). During the ith step,
%we generate a new householder matrix H and rewrite Q*R as
%(Q*H)*(H*R). We then replace R H*R and Q by Q*H.
%Initially R is the given matrix, and Q is the identity matrix
     x=R(:,i);                          % `x' is the current i'th column of R
     ops = ops+n(1);
     
     a=norm(x(i:n),2);                  % each execution of this line is n 
     ops = ops+n(1);                    %
     
     y=[x(1:i-1)' a zeros(1,n(1)-i)]';  % `y' is the desired i'th column of R
     ops = ops+n(1);
     
     w=(x-y)/norm(x-y,2);               % `w' is the vector that determines H
     ops = ops+2*n(1);                  % each execution of this line is 2n
                                        % operations
                                     
     H=eye(n)-2*w*w';
     ops = ops+2*n(1)^2+n(1);
     
     Q=Q*H; R=H*R;
     ops = ops + 2*n(1)^3;              % each execution of this line is 2n^3
                                        % operations
  end
  norm(A-Q*R); norm(eye(n)-Q'*Q);
  ops;
