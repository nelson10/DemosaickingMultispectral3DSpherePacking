% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 22 March 2022

%% Iterative Spectral Difference (ItSD)

function [Xrec] = IterativeSpectralDifference(J,G)
[m,n,K]= size(J);
[Xwb] = WeightedBillinearMethod(J);
delta = zeros(m,n,K,K);
Xt = zeros(m,n,K);
%% t=0
for i=1:K
    for j=1:K
        delta(:,:,j,i) = J(:,:,i) - (Xwb(:,:,j).*(G==i));
    end
    [Xwb1] = WeightedBillinearMethod(delta(:,:,:,i));
    %[RGB] = RGB_test(Xwb1);
    %imagesc(RGB)
    for j=1:K
        Xrec(:,:,j)= J(:,:,j) + Xwb1(:,:,j).*(G==j);
    end
    Xt(:,:,i) = sum(Xrec,3);
end
%Xrec = Xt;

sigma = 1.74;
B = 20*sigma;
lambda = round(linspace(400,700,K));
for i=1:K
    for j=1:K
        A = abs(lambda(j)-lambda(i))-100;
        Nij(i,j) = ceil(exp(-(A/B)));
    end
end
% t>1
nn = 3;
for t=1:nn
    for i=1:K
        for j=1:K
            if(t <= Nij(i,j))
                delta(:,:,j,i) = J(:,:,i) - (Xt(:,:,j).*(G==i));
            else
                delta(:,:,j,i) = delta(:,:,j,i);
            end
        end
        [Xwb1] = WeightedBillinearMethod(delta(:,:,:,i));
        %[RGB] = RGB_test(Xwb1);
        %imagesc(RGB)
        for j=1:K
            Xrec(:,:,j)= J(:,:,j) + Xwb1(:,:,j).*(G==j);
        end
        Xt(:,:,i) = sum(Xrec,3);
    end
    Xrec = Xt;
end
%     [RGB] = RGB_test(Xrec);
%     imagesc(RGB)
end