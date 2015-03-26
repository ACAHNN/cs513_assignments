function [L,U,P,Q] = lu_pivot(U)
    % grab the dimension of U (A)
    m = size(U);
    % pivot matrices 
    P=eye(m);Q=eye(m);
    
    % for each row of U
    for k=1:m-1
        % find the max element in the sub-matrix
        pivot = max(max(abs(U(k:m,k:m))));
        [xinds,yinds] = find(pivot == abs(U(k:m,k:m)));
        
        % project back to the full matrix U
        x=xinds(1)+(k-1); y=yinds(1)+(k-1);
        
        % Pivot the rows and columns of U
        U([k,x],:) = U([x,k],:);
        U(:,[k,y]) = U(:,[y,k]);
        
        % Store the permutations
        P([k,x],:) = P([x,k],:);
        Q(:,[k,y]) = Q(:,[y,k]);
        
        % for each row below current (rows to modify)
        for i=k+1:m
            % create the elemination value
            U(i,k)=U(i,k)/U(k,k);
            % update of upper diagonal elements of row i
            for j=k+1:m
                U(i,j)=U(i,j)-U(i,k)*U(k,j);
            end
        end
    end
    L=tril(U,-1)+eye(m);
    U=triu(U);
end