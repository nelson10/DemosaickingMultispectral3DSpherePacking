% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

function [Xrec] = interpolation(J)
[M,N,L]= size(J);
Xrec = zeros(M,N,L);
for j=1:L
    X = J(:,:,j);
    [x,y,v] = find(X);
    [xq,yq] = find(X==0);
    %x1 = interp2(x,y,v,xq,yq);
    F = scatteredInterpolant(x,y,v,'natural');
    X(X==0) = F(xq,yq);
    Xrec(:,:,j) = X;  
end
end