% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Y:  Compressive measurement M1 x M2
% mask:  Tensor Coded aperture M1 x M2 x N
% J: Tensor assumming Spectral CorrelationM1 x M2 x N

function [J] = JointCodedApertures(Y,mask)
%h = round(0.1*N);
[M1,M2,N] = size(mask);
J = zeros(M1,M2,N);
h = 2;
c = 0;
for i=1:N
    if(i >= h+1 && i <= N-(h+1))
        c =c + 1;
        g(:,:,c) = sum(mask(:,:,i-h:i+h-1),3);
    elseif(i < h+1)
        c = c + 1;
        ind = i-h:i+h-1;
        idx = 0 < i-h:i+h-1;
        g(:,:,c) = sum(mask(:,:,ind(idx)),3);
    else
        c = c + 1;
        ind = i-h:i+h-1;
        idx = N > i-h:i+h-1;
        g(:,:,c) = sum(mask(:,:,ind(idx)),3);
    end
end

sample =100*(sum(g(:))/numel(g));
disp("number of non-zero values " + num2str(sample) + "%");

for j=1:N
    J(:,:,j) = (g(:,:,j).*Y); 
end
end
