function [eval,evec,err] = inv_power_method(A,v,stop)
    error = intmax;
    [L,U] = lu(A);
    while error > stop
        y=L\v; w=U\y;
        lam=1/((w'*v)/(v'*v));
        error=norm(A*v-lam*v)/norm(A*v);
        v=w;
    end
    eval = lam;
    evec = v./norm(v);
    err = error;
end