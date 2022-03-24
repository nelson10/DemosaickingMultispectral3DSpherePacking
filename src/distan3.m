% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

function [res]=distan3(G)
%% 3D statistics
[~,N]= size(G);
%L = round(sqrt(N));
L = N;
%L = max(G(:));
G = G(1:L,1:L);
[r,c,z] = find(G);
B = [r c z];
T = zeros(L,L);
D = pdist(B);
dist =squareform(D);
for i=1:L^2
    [~,~,values]=find(dist(i,:));
    T(r(i),c(i)) = min(values);
end
%b = min(dist(dist>0));
%res = b;
bmax = max(T(:));
bmin = min(T(:));
if(bmax==bmin)
    res = bmin;
else
    res = 0;
end
end


