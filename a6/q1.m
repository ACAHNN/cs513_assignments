% Qustion 1

% generate the A matrix with intervals of eigenvalues
A=generate_interval_matrix(100,[-3 4 1],1);
b=rand(100,1);

fig=figure;
for n=1:10-1
    % run my_gmres to obtain Q and S
    [Q,S]=my_gmres(A,b,n);
    
    % compare spectrums
    specA=eig(A);
    specS=eig(S);
    
    % plot the eigenvalues of A and Sn
    subplot(3,3,n)
    plot(real(specA),zeros(size(specA,1)),'bo', ...
         real(specS), zeros(size(specS,1)),'rx')
    title(sprintf('n=%d',n))
end