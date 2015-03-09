function [p] = q4_partB(f,a,b,m,k)
    T=linspace(a,b,m);
    p = polyfit(T,f(T),k);
end