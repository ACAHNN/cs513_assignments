function [A] = q4_partA(m,k,T)
    base = meshgrid(T(1):T(k+1))';
    j = meshgrid(1:k+1);
    A = base.^(j-1);
end