ret = ssolve(10, 0.1, 30);
figure
plot(ret)
title('ssolve with a=10, b=0.1, n=30')
print -dpdf a0_q4_a.pdf

clear all

ret = ssolve(2, -0.05, 50);
figure
plot(ret)
title('ssolve with a=2, b=-0.05, n=50')
print -dpdf a0_q4_b.pdf

