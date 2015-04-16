function [eval,evec,err] = power_method(A,v,stop)
    error = intmax;
    while error > stop
        w=A*v;
        lam=(w'*v)/(v'*v);
        error=norm(A*v-lam*v)/norm(A*v);
        v=w;
    end
    eval = lam;
    evec = v./norm(v);
    err = error;
end