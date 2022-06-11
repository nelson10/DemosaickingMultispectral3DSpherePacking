% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 22 March 2022

%% Pseudo-panchromatic image difference (PPID)

function [Xrec] = PseudoPanchromaticImageDifference(J,G)
[m,n,K]= size(J);
%% t=0
Im = sum(J,3);
maxMSFA = max(Im(:));

for i=1:K
     temp = J(:,:,i);
     maxMSFAk = max(temp(:));
     ImAdj(:,:,i) = Im.*(G==i) * (maxMSFA/maxMSFAk);
end
IAdj = sum(ImAdj,3);
subplot(1,2,1),imshow(Im,[])
pbaspect([1 1 1])
subplot(1,2,2),imshow(IAdj,[])
pbaspect([1 1 1])

%     [RGB] = RGB_test(Xrec);
%     imagesc(RGB)
end