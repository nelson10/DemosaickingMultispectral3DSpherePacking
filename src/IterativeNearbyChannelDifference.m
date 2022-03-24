% Created by: Ph.D Nelson Eduardo Diaz Diaz
% Post-doctorado Pontícia Universidad Católica de Valparaíso (PUCV)
% Date 2 February 2022

%%Iterative Nearby Channel Difference(ItNCD)

function [Xrec] = IterativeNearbyChannelDifference(J,G)
[n,m,K]= size(J);
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
Y = sum(J,3)/255;
Im= imfilter(Y,M,'conv');
deltaHat = zeros(n,m,K);
for k=1:K
    delta(:,:,k) = J(:,:,k) - (Im.*(G==k));
    deltaHat(:,:,k) = imfilter(delta(:,:,k),H,'conv');
    %delta2(:,:,k) = conv2(delta(:,:,k), H, 'same');
    Xrec(:,:,k) = Im + deltaHat(:,:,k);
end

N = 100;

for i=1:K
    It(:,:,i)= imfilter(J(:,:,i),H,'conv');
end

for t = 1:N
    for i=1:K
        if(i==1)
            It(:,:,i) = (It(:,:,i) + 2*It(:,:,i+1))/3;
        elseif(i==K)
            It(:,:,i) = (2*It(:,:,i-1) + It(:,:,i))/3;
        else
            It(:,:,i) = (It(:,:,i-1)+ It(:,:,i) + It(:,:,i+1))/3;
        end
    end
    for k=1:K
        delta(:,:,k) = J(:,:,k) - (It(:,:,k).*(G==k));
        deltaHat(:,:,k) = imfilter(delta(:,:,k),H,'conv');
        %delta2(:,:,k) = conv2(delta(:,:,k), H, 'same');
        Xrec(:,:,k) = It(:,:,k) + deltaHat(:,:,k);
    end
    It = Xrec;
end

end