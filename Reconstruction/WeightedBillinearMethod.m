% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Weighted Bilinear Method (WB)
% Brauers, Johannes, and Til Aach. "A color filter array based multispectral camera." 12. Workshop Farbbildverarbeitung. Ilmenau, 2006.

function [Xrec] = WeightedBillinearMethod(J)
[~,~,K]= size(J);
H = (1/16)*[1 2 3 4 3 2 1;2 4 6 8 6 4 2;3 6 9 12 9 6 3;4 8 12 16 12 8 4;3 6 9 12 9 6 3;2 4 6 8 6 4 2;1 2 3 4 3 2 1]; % Low-pass filter
for k=1:K
    Xrec(:,:,k) = imfilter(J(:,:,k),H,'conv');
    %Xrec(:,:,k) = imsharpen(Xrec(:,:,k));
end
end