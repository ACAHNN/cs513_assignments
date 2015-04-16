function [L,U] = lu_sym(U)
    % get the dimension of the input matrix
    m = size(U);
    % initialize L
    L = eye(m);
    
    % each row of U
    for k=1:m-1
        % each row below the current row (rows to modify)
        for i=k+1:m
            % create the elimination factor
            % grab the elimination factor from above the diagonal
            % U(k,i) instead of U(i,k)
            L(i,k)=U(k,i)/U(k,k);
            % update the upper triangular part of row i of U
            % start j at i (diagonal element)
            % process each j (from diagonal to end of row)
            for j=i:m
                U(i,j)=U(i,j)-L(i,k)*U(k,j);
            end
        end
    end
    % grab the upper triangular portion of U
    U = triu(U);
end