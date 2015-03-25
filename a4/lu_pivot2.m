function [L,U,P,Q] = lu_pivot2(U)
    % grab the dimension of U (A)
    m = size(U);
    % initialize L
    L = eye(m);
    % pivot matrices 
    p=1:m;q=1:m;
    
    % for each row of U
    for k=1:m-1
        % find the max element in the sub-matrix
        [xinds,yinds] = find(max(max(abs(U(k:m,k:m))))==abs(U(k:m,k:m)));
        
        % project back to the full matrix U
        x=xinds(1)+(k-1); y=yinds(1)+(k-1);
        
        % Store the permutations
        p([k,x]) = p([x,k]);
        q([k,y]) = q([y,k]);
        
        % for each row below current (rows to modify)
        for i=k+1:m
            % create the elemination value
            L(p(i),q(k))=U(p(i),q(k))/U(p(k),q(k));
            % perform gaussian elimination
            U(p(i),:)=U(p(i),:)-L(p(i),q(k))*U(p(k),:);
        end
    end
    P=eye(m);P=P(p,:);
    Q=eye(m);Q=Q(:,q);
    L=L(p,q);
    U=U(p,q);
end