% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%% Intensity Difference (ID)

function [Xrec] = IntensityDifference(J,G)
[~,~,K]= size(J);
% if(L == 8)
%
% elseif(L==16 | L==9)
%
% elseif(L==25)
%     h = (1/25)*[1 2 3 4 5 4 3 2 1;2 4 6 8 10 8 6 4 2;3 6 9 12 15 12 9 6 3;4 8 12 16 20 16 12 8 4;3 6 9 12 15 12 9 6 3;2 4 6 8 10 8 6 4 2;1 2 3 4 5 4 3 2 1];
% end

%implay(mk)
M = 1/64*[1 2 2 2 1;2 4 4 4 2;2 4 4 4 2;2 4 4 4 2; 1 2 2 2 1];
H = (1/16)*[1 2 3 4 3 2 1;2 4 6 8 6 4 2;3 6 9 12 9 6 3;4 8 12 16 12 8 4;3 6 9 12 9 6 3;2 4 6 8 6 4 2;1 2 3 4 3 2 1]; % Low-pass filter
Y = sum(J,3);
Im= imfilter(Y,M,'conv');
for k=1:K
    delta(:,:,k) = J(:,:,k) - (Im.*(G==k));
    delta2(:,:,k) = imfilter(delta(:,:,k),H,'conv');
    Xrec(:,:,k) = Im + delta2(:,:,k);
    %Xrec(:,:,j) = imsharpen(Xrec(:,:,j));
    %Xrec(:,:,j) = imfilter(J(:,:,j),M,'conv');
    %Xrec(:,:,j) = imsharpen(Xrec(:,:,j));
end
end