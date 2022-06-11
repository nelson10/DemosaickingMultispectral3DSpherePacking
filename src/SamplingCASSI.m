function [Y2] = SamplingCASSI(X,M,N,L,T)
Y2 = zeros(M,N+L-1);
%Y2(:,1:M) = X(:,:,1) .*T(:,:,1);
for l = 0:L-1
    Y2(:,1+l:M+l) = Y2(:,1+l:M+l) + X(:,:,l+1) .*T(:,:,l+1);
end
%imagesc(Y2),colormap('gray');
end