function [pevals] = sign_changes(d)
    signs = sign(d);
    s = signs(1);
    pevals = 0;
    for i=2:length(signs)
        if signs(i) ~= s
            pevals = pevals + 1;
        end
        s = signs(i);
    end
end