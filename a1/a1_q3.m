M = zeros(1,99);
for i=1:100,
    A=rand(i);
    sloppy_qr;
    M(1,i) = ops(1);
end
polyfit(1:99,M,4)