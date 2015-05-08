function [A] = generate_interval_matrix(m,n,e)
    I = [];
    for i=1:size(n,2)
        % generate random values in the interval
        I = [I (((n(i)+e)-(n(i)-e)).* ...
            rand(round(m/size(n,2)),1)+(n(i)-e))'];
    end
    % m/n has remainder (add those values)
    if size(I,2) < m
        I = [I (((n(i)+e)-(n(i)-e)).* ...
            rand(m-size(I,2),1)+(n(i)-e))'];
    end
    % generate A with eigenvalues from I
    D = diag(sort(I,'descend'));
    P = rand(m);
    A = P*D*inv(P);
end