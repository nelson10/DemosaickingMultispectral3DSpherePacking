% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach
function [RGB] = Convert2RGB(X,L)
id = round(linspace(1,L,4));
B = sum(X(:,:,1:id(2)-1),3);
G = sum(X(:,:,id(2):id(3)),3);
R = sum(X(:,:,id(3)+1:L),3);
RGB(:,:,1) = R;
RGB(:,:,2) = G;
RGB(:,:,3) = B;
RGB = RGB./max(RGB(:));
gamma = 0.5;
RGB = RGB.^gamma;
end