% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

function [NAlpha] = distance(G)
[~,N]= size(G);
[r,c,z] = find(G);
B = [r c z];
D = pdist(B);
NAlpha = min(D(:)); % minimal value between <v,v> for all v \in r
end