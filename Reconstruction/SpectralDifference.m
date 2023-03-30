% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 22 March 2022

%% Spectral Difference (SD)

function [Xrec] = SpectralDifference(J,G)
[m,n,K]= size(J);
[Xwb] = WeightedBillinearMethod(J);
%
delta = zeros(m,n,K);
Xt = zeros(m,n,K);
for i=1:K
    for j=1:K
        delta(:,:,j) = J(:,:,i) - (Xwb(:,:,j).*(G==i));
    end
    [Xwb1] = WeightedBillinearMethod(delta);
    %[RGB] = RGB_test(Xwb1);
    %imagesc(RGB)
    for j=1:K
        Xrec(:,:,j)= J(:,:,j) + Xwb1(:,:,j).*(G==j);
    end
    Xt(:,:,i) = sum(Xrec,3);
end
Xrec = Xt;
end