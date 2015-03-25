function [A] = q4_partA(T,k)
    [exp,base]=meshgrid(0:k,T);
    A=base.^exp;
end