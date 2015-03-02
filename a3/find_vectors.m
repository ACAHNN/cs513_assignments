function [P] = find_vectors(m, n, s)
    
    % create the x and y ranges
    x=(1:m);
    y=(1:n);
    
    % create the meshgrid (x,y) coordinates
    [X,Y]=meshgrid(x,y);
    
    % create (x,y) pairs in form [j;k]
    A=[X(:)';Y(:)'];
    
    % solve each s*[p;o]=[j;k] for all [j;k]
    B=s\A;
    
    % find columns with integer solutions
    cols=all(mod(B,1)==0);
    
    % return [j;k]'s with integer [p;o]'s
    P=A(:,cols);
end