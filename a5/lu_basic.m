function [L,U,t] = lu_basic(U)
    ops = 0;
    % grab the dimension of U (A)
    m = size(U);
    % initialize L
    L = eye(m);
    ops = ops + m(1)^2;
    % for each row of U
    for k=1:m-1
        % for each row below current (rows to modify)
        for i=k+1:m
            % create the elemination value
            L(i,k)=U(i,k)/U(k,k);
            ops = ops + 3;
            % update of all elements of row i
            for j=k:m
                U(i,j)=U(i,j)-L(i,k)*U(k,j);
                ops = ops + 5;
            end
        end
    end
end