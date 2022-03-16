% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

function [T] = distance(G)
[~,N]= size(G);
L = round(sqrt(N));
G = G(1:L,1:L);
[r,c,z] = find(G);
B = [r c z];
T = zeros(L,L);
D = pdist(B);
dist = squareform(D);
for i=1:L^2
    [~,~,values]=find(dist(i,:));
    T(r(i),c(i)) = min(values);
end
end