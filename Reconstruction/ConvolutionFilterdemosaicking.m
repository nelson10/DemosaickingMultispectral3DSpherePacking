% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Rathi, Vishwas, and Puneet Goyal. "Convolution Filter based Efficient Multispectral Image Demosaicking for Compact MSFAs." VISIGRAPP (4: VISAPP). 2021.

% PoA based convolution filter based weighted bilinear (PCWB)
function [Xrec] = ConvolutionFilterdemosaicking(J,G)
T = G(1:4,1:4);
[~,N,K]= size(J);

f1 = 0.5*[0 0.5 0; 0.5 2 0.5;0 0.5 0];
f2 = 0.25*[1 2 1; 2 4 2; 1 2 1];
f3 = (1/16)*[1 2 3 4 3 2 1;2 4 6 8 6 4 2;3 6 9 12 9 6 3;4 8 12 16 12 8 4;3 6 9 12 9 6 3;2 4 6 8 6 4 2;1 2 3 4 3 2 1];
f4 = (1/8)*[0 2 2 2 0;2 4 4 4 2; 2 4 8 4 2;2 4 4 4 2;0 2 2 2 0];

%Xrec = zeros(N,N,K);
D = zeros(N,N,K);
[Xrec] = PCWB(K,J,f1,f2,f3,f4,T);
for k=1:K
    D(:,:,k) = (Xrec(:,:,k).*(G==k)) - J(:,:,k);
end
%[Xrec] = PCWB(K,D,f1,f2,f3,f4,T);
end

function Xrec = PCWB(K,J,f1,f2,f3,f4,T)
for k=1:K
    PoA = sum(T(:)==k)/numel(T);
    if(PoA==1/2)
        Xrec(:,:,k) = imfilter(J(:,:,k),f1,'conv');
        %Xrec(:,:,k) = imsharpen(Xrec(:,:,k));
    elseif(PoA==1/4)
        Xrec(:,:,k) = imfilter(J(:,:,k),f2,'conv');
        %Xrec(:,:,k) = imsharpen(Xrec(:,:,k));
    elseif(PoA==1/8)
        Xrec(:,:,k) = imfilter(J(:,:,k),f3,'conv');
        %Xrec(:,:,k) = imsharpen(Xrec(:,:,k));
    else
        Xrec(:,:,k) = imfilter(J(:,:,k),f4,'conv');
        %Xrec(:,:,k) = imsharpen(Xrec(:,:,k));
    end
end
end