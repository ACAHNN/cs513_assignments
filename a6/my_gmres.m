% runs the gmres algorithm for n iterations
function [Q,S,xtil] = my_gmres(A,b,n)
    % track Q, S, and X's
    Q = []; S = []; X={};
    
    % pre-process steps
    b1 = norm(b);
    Q(:,1) = b/norm(b);
    
    % run n iterations of gmres
    for i=1:n
       v=A*Q(:,i);
       S(:,i)=Q'*v;
       v=v-Q(:,1:i)*S(:,i);
       Q(:,i+1)=v/norm(v);
       S(i+1,i)=norm(v);
       b1=[b1;0];
       X{i}=Q(:,1:i)*(S\b1);
    end
    % return Sn and final x
    xtil = X{n};
    S=S(1:end-1,:);
end