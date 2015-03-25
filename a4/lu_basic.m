function [L,U] = lu_basic(U)
    tic
    % grab the dimension of U (A)
    m = size(U);
    % initialize L
    L = eye(m);
    
    % for each row of U
    for k=1:m-1
        % for each row below current (rows to modify)
        for i=k+1:m
            % create the elemination value
            L(i,k)=U(i,k)/U(k,k);
            % preform the elemination/update of all elements of row i
            for j=k:m
                U(i,j)=U(i,j)-L(i,k)*U(k,j);
            end
        end
    end
    toc
end