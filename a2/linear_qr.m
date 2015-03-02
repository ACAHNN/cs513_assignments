ops = 0;
n=size(A);             
R=A;                    
Q=eye(n(1));

% QR Factorization
for i=1:n(2),
     % `x' is the current i'th column of R
     x=R(:,i);                          
     ops = ops+n(1);  
     % each execution of this line is n 
     a=norm(x(i:n),2);                  
     ops = ops+n(1);                      
     % each execution of this line is n
     y=[x(1:i-1)' a zeros(1,n(1)-i)]';  
     ops = ops+n(1);
     % each execution of this line is 2n
     w=(x-y)/norm(x-y,2);               
     ops = ops+2*n(1);             
     % each execution of this is 2n^2+2n
     Q=Q-(2*(Q*w))*w';                   
     ops = ops + 2*n(1)^2 + 2*n(1);
     % each execution of this is 2n^2+2n
     R=R-(2*w)*(w'*R);                   
     ops = ops + 2*n(1)^2 + 2*n(1);
end

% solve a system
% n operations
b=rand(n(1),1);
% n^2 operations
y=Q'*b;
% use back substitution n^2 operations
R\y