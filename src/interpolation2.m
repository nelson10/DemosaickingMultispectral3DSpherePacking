% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

% Comparison of minimum distance
% Solution using the Discrete Sphere Packing based on 3D N^2 Queens
% Approach

function [Xrec] = interpolation2(J,G)
T = G(1:4,1:4);
[M,N,L]= size(J);
% if(L == 8)
%     
% elseif(L==16 | L==9)
%     
% elseif(L==25)
%     h = (1/25)*[1 2 3 4 5 4 3 2 1;2 4 6 8 10 8 6 4 2;3 6 9 12 15 12 9 6 3;4 8 12 16 20 16 12 8 4;3 6 9 12 15 12 9 6 3;2 4 6 8 10 8 6 4 2;1 2 3 4 5 4 3 2 1];
% end
f1 = 0.5*[0 0.5 0; 0.5 2 0.5;0 0.5 0];
f2 = 0.25*[1 2 1; 2 4 2; 1 2 1];
f3 = (1/16)*[1 2 3 4 3 2 1;2 4 6 8 6 4 2;3 6 9 12 9 6 3;4 8 12 16 12 8 4;3 6 9 12 9 6 3;2 4 6 8 6 4 2;1 2 3 4 3 2 1];
f4 = (1/8)*[0 2 2 2 0;2 4 4 4 2; 2 4 8 4 2;2 4 4 4 2;0 2 2 2 0];
for i=1:L
    PoA = sum(T(:)==i)/numel(T);
    if(PoA==1/2)
       Xrec(:,:,i) = imfilter(J(:,:,i),f1,'conv');
    elseif(PoA==1/4)
       Xrec(:,:,i) = imfilter(J(:,:,i),f2,'conv');
     elseif(PoA==1/8)
       Xrec(:,:,i) = imfilter(J(:,:,i),f3,'conv');
    else
       Xrec(:,:,i) = imfilter(J(:,:,i),f4,'conv');
    end

end
end